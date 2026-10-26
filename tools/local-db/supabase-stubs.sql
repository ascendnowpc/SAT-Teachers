-- ============================================================================
--  The parts of Supabase the migrations and contracts expect, for a plain
--  local Postgres. Not a migration: run once on an empty database before
--  supabase/migrations/*.sql. See tools/local-db/rebuild.sh.
-- ============================================================================

do $$ begin create role anon nologin;               exception when duplicate_object then null; end $$;
do $$ begin create role authenticated nologin;      exception when duplicate_object then null; end $$;
do $$ begin create role service_role nologin bypassrls; exception when duplicate_object then null; end $$;

create extension if not exists pgcrypto;

create schema auth;
create schema storage;
create schema extensions;
create schema net;

create table auth.users (
  id uuid primary key, instance_id uuid, aud text, role text, email text, encrypted_password text,
  email_confirmed_at timestamptz, raw_app_meta_data jsonb default '{}', raw_user_meta_data jsonb default '{}',
  created_at timestamptz default now(), updated_at timestamptz default now(), banned_until timestamptz,
  confirmation_token text, recovery_token text, email_change_token_new text, email_change text,
  is_sso_user boolean default false, deleted_at timestamptz);
create table auth.sessions (id uuid primary key default gen_random_uuid(), user_id uuid);
create table auth.refresh_tokens (id bigserial primary key, user_id text, session_id uuid);

-- The contracts sign in by setting request.jwt.claims, as PostgREST does.
create or replace function auth.uid() returns uuid language sql stable as $$
  select coalesce(nullif(current_setting('request.jwt.claim.sub', true), ''),
                  nullif(current_setting('request.jwt.claims', true), '')::jsonb->>'sub')::uuid
$$;
create or replace function auth.role() returns text language sql stable as $$
  select current_setting('request.jwt.claim.role', true)
$$;
create or replace function auth.jwt() returns jsonb language sql stable as $$
  select coalesce(nullif(current_setting('request.jwt.claims', true), ''), '{}')::jsonb
$$;

create table storage.buckets (id text primary key, name text, public boolean, file_size_limit bigint,
                              allowed_mime_types text[], created_at timestamptz default now());
create table storage.objects (id uuid primary key default gen_random_uuid(), bucket_id text, name text,
                              owner uuid, created_at timestamptz default now());
alter table storage.objects enable row level security;
create or replace function storage.foldername(name text) returns text[] language sql as $$
  select string_to_array(name, '/')
$$;

-- pg_net: the queue the triggers write to, so pc_access.sql can count it.
create table net.http_request_queue (id bigserial primary key, method text, url text, headers jsonb,
                                     body bytea, timeout_milliseconds int);
create or replace function net.http_post(url text, body jsonb default '{}', params jsonb default '{}',
                                         headers jsonb default '{}', timeout_milliseconds int default 1000)
returns bigint language sql as $$
  insert into net.http_request_queue (method, url, headers, body, timeout_milliseconds)
  values ('POST', url, headers, convert_to(body::text, 'utf8'), timeout_milliseconds)
  returning id
$$;

create publication supabase_realtime;

grant usage on schema public, auth, storage, net to anon, authenticated, service_role;
grant execute on all functions in schema auth to anon, authenticated;
grant all on all tables in schema net to anon, authenticated;
grant all on all sequences in schema net to anon, authenticated;
alter default privileges in schema public grant execute on functions to anon, authenticated, service_role;
alter default privileges in schema public grant all on tables to anon, authenticated, service_role;
