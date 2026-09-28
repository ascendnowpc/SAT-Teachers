-- ============================================================================
--  0054 — a PC is a role
--
--  Until now a student's PC was a line of free text on the roster row (0032):
--  whatever the teacher typed into the New session form. It identified a
--  person to the teachers and to nobody else, because nobody behind it had an
--  account. 0055 makes the PC a person who signs in, is chosen from a list,
--  and reads the sessions and reports of the students assigned to them.
--
--  This file is only the enum value, on purpose. Postgres will not let a new
--  enum value be used in the transaction that adds it ("unsafe use of new
--  value"), and a policy, a SQL function body or a cast that names 'pc' is a
--  use. So the value is committed here and everything that uses it is 0055.
-- ============================================================================

alter type user_role add value if not exists 'pc';
