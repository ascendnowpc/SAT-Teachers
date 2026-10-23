#!/bin/bash
# Builds a scratch database from every migration and runs the contracts, on a
# plain local Postgres (no Docker, no Supabase CLI). Every contract row must
# read PASS, except rls_contract's two bank counts, which read FAIL on any
# database with the content migrations in it (see the README).
#
#   tools/local-db/rebuild.sh                 # every contract
#   tools/local-db/rebuild.sh targeted modes  # just these
#
# DB defaults to sat_local; PSQL defaults to `sudo -u postgres psql`.
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/../.." && pwd)"
DB="${DB:-sat_local}"
PSQL="${PSQL:-sudo -u postgres psql}"
RUN="$PSQL -q -v ON_ERROR_STOP=1 -d $DB"

$PSQL -q -d postgres -c "drop database if exists $DB" -c "create database $DB" || exit 1
$RUN < "$HERE/supabase-stubs.sql" > /dev/null || { echo "stubs failed"; exit 1; }

for f in "$ROOT"/supabase/migrations/*.sql; do
  # pg_net is stubbed above; the real extension is not installed locally.
  out=$(sed -E 's/^create extension.*pg_net.*$//I' "$f" | $RUN 2>&1) \
    || { echo "MIGRATION FAILED: $(basename "$f")"; echo "$out" | grep -i error; exit 1; }
done
echo "migrations: $(ls "$ROOT"/supabase/migrations/*.sql | wc -l) applied"

tests="${*:-$(ls "$ROOT"/supabase/tests/*.sql | xargs -n1 basename | sed 's/\.sql$//')}"
for t in $tests; do
  res=$($PSQL -d "$DB" < "$ROOT/supabase/tests/$t.sql" 2>&1)
  tally=$(echo "$res" | grep -oE '\| (PASS|FAIL|SKIP) *$' | awk '{print $2}' | sort | uniq -c | tr '\n' ' ')
  echo "$t: $tally $(echo "$res" | grep -m1 ERROR)"
done
