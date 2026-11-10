-- ============================================================================
--  0091 — the English bank reads as text
--
--  College Board's Reading and Writing questions, as the app shows its own:
--  the passage on the left and the question alone on the right, each
--  sentence running on instead of breaking where the printed page did, the
--  notes of a Rhetorical Synthesis question as bullets and not a picture of
--  them, and the underlined sentence underlined where the export's rule
--  says which it is. No word of any question changes. The rules are
--  tools/questionbank/tidy.py's, run here on the stems the database holds
--  (tidy_english.sql), so this carries the rules and not the text.
--
--  1711 questions. Written by tools/questionbank/make_update.py from the
--  bank as 0075–0085 left it; each update is by source_ref and only of a
--  question whose stem is still the imported one, so a question corrected
--  by hand since is not touched, and a second run changes nothing.
-- ============================================================================

-- The rules of tools/questionbank/tidy.py, run on the stems the database holds.
-- tidy.py is the reference; make_update.py checks this gives the same text for
-- every question before it is applied. The underlines, and the questions the
-- rules cannot rebuild from what is stored, are filled in by make_update.py.
do $tidy$
declare
  picture   constant text := 'This question is shown as a picture.';
  full_line constant int  := 110;
  opener    constant text := '^(Which|What|How|Why|Based on|According to|As used in|The student wants|It can most|The text|In the text|Assuming|Information in|Taken together)\y';
  ul        constant jsonb := '{"CB-10455a19": "Since it was first introduced, Baxandall’s period eye has significantly influenced the practice of art history.", "CB-159ef46d": "Yet despite its inarguable value as a piece of writing, Lewis’s masterpiece has received almost no attention from literary scholars.", "CB-1b5d4e3e": "Theresa Cole and her team argue that penguins could fly at some point, but that they lost that ability more than 60 million years ago as they adapted to marine life.", "CB-1c6b1fa0": "This work demonstrates a vast amount of topographic knowledge, as the map features specific names of mountains and rivers, as well as the first-known sketch of the drainage network of the Missouri River.", "CB-213248f7": "simply", "CB-236fee8e": "Jinshanzhuang—Hong Kong–based import/export firms—likely coordinated the fish’s transport from Chinese-operated fisheries in Vietnam and Malaysia to North American markets.", "CB-271a5017": "Bitter’s feet were singing the news.", "CB-2aaee77f": "Female cuckoos have been seen quickly laying eggs in the nests of other bird species when those birds are out looking for food.", "CB-378c66d5": "In his 1950 masterpiece History of Mexico, Medellín fuses these influences into a style so idiosyncratic that it resists efforts to view his work through the lens of nationality or cultural identity.", "CB-39857700": "The landscape outspread below her seemed an enlargement of her present mood, and she found something of herself in its calmness, its breadth, its long free reaches.", "CB-3e6ad72d": "Using data spanning from 1994 to 2010 for a set of US companies, the team compared over 29,000 annual earnings forecasts to the actual earnings later reported by those companies.", "CB-4c4db685": "Turning away from landscapes painted in an expressionist style—a style that often involves using fluid, distorted shapes and thick, textured brushstrokes to express the artist’s subjective experience of reality—Johnson began painting portraits of Black Americans in a bold new way.", "CB-5336f2e4": "[John Redding] loved to wander down to the water’s edge, and, casting in dry twigs, watch them sail away down stream to Jacksonville, the sea, the wide world and [he] wanted to follow them.", "CB-54c6128b": "Because timber could only have been transported from distant Jura to Rome by boat, the team’s findings suggest the complexity of Roman trade routes.", "CB-570970cd": "The trees, like people, have their individual characters; some were ready to yield up their life-blood, while others were more reluctant.", "CB-590f0ad2": "Consider the silver-studded blue butterfly (Plebejus argus)", "CB-617a8a10": "To address this problem, a team of scientists used time-lapse cameras to record pollinator visits to red clover all day and night.", "CB-662892ad": "To transform the story into a play, Yamauchi created situations where characters reveal their thoughts by speaking them aloud during conversations with each other.", "CB-74446089": "Alternative R&B musicians Blood Orange and Moses Sumney, among other contemporary recording artists, cite the album as an influence.", "CB-764331f8": "In her shopping-cart stroller she exercised to exhaustion, bouncing for hours to develop her leg muscles.", "CB-7d075fc5": "By doing so, she gained valuable insights into her subjects’ day-to-day lives.", "CB-8e22efd9": "Moreover, the LCOE differential grew from 18.8% to 31.3% when the modeled cell lifetime was reduced by two-thirds.", "CB-9b01bcf4": "But he also sharply criticized Black nationalists such as Marcus Garvey who wanted to establish independent, self-contained Black economies and societies, even though Cruse himself identified as a Black nationalist.", "CB-a13541c0": "This insightful depiction of a preteen girl encouraged authors who, like Cisneros herself, are Latina to use fictional works to examine experiences from their own youth.", "CB-aa5897b8": "In Jane Austen’s novel Mansfield Park, an almost imperceptible smile from potential suitor Henry Crawford causes the protagonist Fanny Price to blush; her embarrassment grows when she suspects that he is aware of it.", "CB-aa7ae735": "reaching", "CB-c2c26e20": "suggestion", "CB-c502943e": "[Uncle Katsuhisa] was as loud as my father was quiet.", "CB-c762ca58": "When considering automation, therefore, companies—especially those specializing in products of symbolic value—should weigh trade-offs between efficiency gains and consumer preferences.", "CB-cef79fb9": "For example, the first join the workers completed exhibits a clear misalignment of the borders of the two panels, whereas the later joins are virtually invisible.", "CB-cf9a00e0": "Mary Beth Wilhelm and other astrobiologists search for life, or its remains, in this harsh place because the desert closely mirrors the extreme environment on Mars.", "CB-dc47c2ac": "Many ecologists have assumed that domed nests would provide protection from weather conditions and thus would allow species that build them to have larger geographic ranges than species that build open nests do.", "CB-dd1757fd": "But even this approximation of grid-cell activity has less to do with similarity between the neural networks and biological brains than it does with the rules programmed into the networks.", "CB-df45f0eb": "Several studies have found negligible electoral consequences for governments that impose fiscal austerity measures, yet some European governments recently suffered electorally due to their austerity programs.", "CB-e13171c4": "One such narrative is Jermain Loguen’s autobiography, which tells about how Neshnabé (Potawatomi) villagers offered him food, lodging, and directions during his 1835 journey from Tennessee to Canada.", "CB-eb89dcc8": "Imagine you and your friend are trying to decide where to eat lunch."}';
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
       and source_ref <> all (array['CB-eb03096e']::text[])
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

-- Stored short of a line: written out in full.
update questions set passage = $qb$According to the University of Hawaiʻi at Mānoa, aloha ʻāina is “a recognition, commitment, and practice sustaining the ea—or life breath” between the Hawaiian people and their natural environments. The concept has been proudly embodied ______ Native Hawaiians for generations, contributing to the lush flora and renowned beauty of the islands.$qb$, passage_underline = null, stem = $qb$Which choice completes the text so that it conforms to the conventions of Standard English?$qb$, image_url = null where passage is null and source_ref = 'CB-eb03096e' and md5(stem) = 'fa4effa38473ba9096c89e87f82305fe';
