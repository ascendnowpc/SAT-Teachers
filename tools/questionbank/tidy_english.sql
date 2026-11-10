-- The rules of tools/questionbank/tidy.py, run on the stems the database holds.
-- tidy.py is the reference; make_update.py checks this gives the same text for
-- every question before it is applied. The underlines, and the questions the
-- rules cannot rebuild from what is stored, are filled in by make_update.py.
do $tidy$
declare
  picture   constant text := 'This question is shown as a picture.';
  full_line constant int  := 110;
  opener    constant text := '^(Which|What|How|Why|Based on|According to|As used in|The student wants|It can most|The text|In the text|Assuming|Information in|Taken together)\y';
  ul        constant jsonb := '{{UNDERLINES}}';
  r record;
  ls text[]; n int; i int; c text; s text;
  sure boolean[]; marked boolean[]; ends boolean[];
  grew boolean; run_ok boolean; first_end int; last_end int;
  q int;
  kinds text[]; texts text[]; cur text; cur_kind text; prev text;
  v_passage text; qparts text[]; qcur text; v_question text;
  done int := 0;
begin
  for r in
    select id, source_ref, stem from questions
     where source_ref like 'CB-%' and subject = 'english'
       and passage is null and stem <> picture
       and source_ref <> all ({{EXCEPTIONS}})
     order by source_ref
  loop
    -- The printed lines, without the blank ones.
    ls := array(select rtrim(l) from unnest(string_to_array(r.stem, E'\n')) with ordinality t(l, o)
                 where btrim(l) <> '' order by o);
    n := coalesce(array_length(ls, 1), 0);
    continue when n = 0;

    -- An underline's rule, read as a minus: beside punctuation, wherever it is.
    sure := array_fill(false, array[n]);
    for i in 1 .. n loop
      c := regexp_replace(ls[i], '-+\?-?(?=[A-Za-z])', '', 'g');
      c := regexp_replace(c, '(?<=[A-Za-z0-9.,;:?!”’)])-+\s?(?=[’“”—])|(?<=\s)-(?=[“”’])', '', 'g');
      c := regexp_replace(c, '(?<=[].,;:?!”’)])-$|(?<=[A-Za-z]-)-$', '', 'g');
      sure[i] := c <> ls[i];
      ls[i] := c;
    end loop;
    -- …and, in a question about something underlined, after a letter at the
    -- end of a line next to one known to carry a rule, or as the only run.
    if r.stem ~* 'underlined' then
      ends := array_fill(false, array[n]);
      for i in 1 .. n loop ends[i] := ls[i] ~ '[A-Za-z]-$'; end loop;
      marked := sure;
      if true = any(sure) then
        loop
          grew := false;
          for i in 1 .. n loop
            if ends[i] and not marked[i] and ((i > 1 and marked[i - 1]) or (i < n and marked[i + 1])) then
              marked[i] := true;
              grew := true;
            end if;
          end loop;
          exit when not grew;
        end loop;
      elsif true = any(ends) then
        first_end := null; last_end := null; run_ok := true;
        for i in 1 .. n loop
          if ends[i] then
            if first_end is null then first_end := i;
            elsif i <> last_end + 1 then run_ok := false;
            end if;
            last_end := i;
          end if;
        end loop;
        if run_ok then
          for i in first_end .. last_end loop marked[i] := true; end loop;
        end if;
      end if;
      for i in 1 .. n loop
        if marked[i] and not sure[i] and ends[i] then ls[i] := left(ls[i], -1); end if;
      end loop;
    end if;

    -- Where the question starts: the last of the last four lines to open like
    -- one, or else where the final sentence starts.
    q := null;
    for i in reverse n .. greatest(1, n - 3) loop
      if ls[i] ~ opener then q := i; exit; end if;
    end loop;
    if q is null then
      q := n;
      while q > 1 and not (rtrim(ls[q - 1]) ~ '([].?!:)]|[”"’'']|_{3,})$' or ls[q - 1] like '©%') loop
        q := q - 1;
      end loop;
    end if;
    while q > 1 and ls[q - 1] like 'The student wants%' loop q := q - 1; end loop;

    -- The passage: headings over their text, notes as bullets, verse kept to
    -- its lines, a paragraph running on until a line stops short.
    kinds := '{}'; texts := '{}'; cur := null; cur_kind := 'para';
    for i in 1 .. q - 1 loop
      s := btrim(ls[i]);
      if s ~ '^Text [12]$' then
        if cur is not null then kinds := kinds || cur_kind; texts := texts || cur; cur := null; end if;
        kinds := kinds || 'heading'::text; texts := texts || s;
        continue;
      end if;
      if s ~ '^[?·•]\s+' then
        if cur is not null then kinds := kinds || cur_kind; texts := texts || cur; cur := null; end if;
        cur := '• ' || btrim(regexp_replace(s, '^[?·•]\s+', ''));
        cur_kind := 'bullet';
      elsif cur is null then
        cur := s; cur_kind := 'para';
      else
        cur := case when rtrim(cur) ~ '[A-Za-z]-$' or right(rtrim(cur), 1) in ('—', '/')
                    then rtrim(cur) || ltrim(s) else rtrim(cur) || ' ' || ltrim(s) end;
      end if;
      if length(ls[i]) < full_line then
        if cur_kind = 'para' and cur = s then cur_kind := 'line'; end if;
        kinds := kinds || cur_kind; texts := texts || cur; cur := null;
      end if;
    end loop;
    if cur is not null then kinds := kinds || cur_kind; texts := texts || cur; end if;

    v_passage := ''; prev := null;
    for i in 1 .. coalesce(array_length(kinds, 1), 0) loop
      if prev is null then v_passage := texts[i];
      elsif prev = 'heading'
         or (kinds[i] = 'bullet' and prev = 'bullet')
         or (kinds[i] = 'line' and prev = 'line') then v_passage := v_passage || E'\n' || texts[i];
      else v_passage := v_passage || E'\n\n' || texts[i];
      end if;
      prev := kinds[i];
    end loop;

    -- The question, as one line.
    qparts := '{}'; qcur := null;
    for i in q .. n loop
      if qcur is null then qcur := btrim(ls[i]);
      else qcur := case when rtrim(qcur) ~ '[A-Za-z]-$' or right(rtrim(qcur), 1) in ('—', '/')
                        then rtrim(qcur) || ltrim(ls[i]) else rtrim(qcur) || ' ' || ltrim(ls[i]) end;
      end if;
      if length(ls[i]) < full_line then qparts := qparts || qcur; qcur := null; end if;
    end loop;
    if qcur is not null then qparts := qparts || qcur; end if;
    v_question := btrim(regexp_replace(array_to_string(qparts, E'\n'), '\s*\n\s*', ' ', 'g'));

    update questions
       set passage = nullif(v_passage, ''),
           passage_underline = ul ->> r.source_ref,
           stem = v_question,
           image_url = null
     where id = r.id;
    done := done + 1;
  end loop;
  raise notice 'tidied % English questions', done;
end
$tidy$;
