-- Run once in Supabase: SQL Editor > New query > paste > Run.
-- One row per diet; the diet's days, meals, snacks, drinks and notes are stored in `data`.
create table if not exists public.diets (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

create index if not exists diets_user_id_idx on public.diets (user_id);

alter table public.diets enable row level security;

create policy "read own diets" on public.diets
  for select using (auth.uid() = user_id);
create policy "add own diets" on public.diets
  for insert with check (auth.uid() = user_id);
create policy "change own diets" on public.diets
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own diets" on public.diets
  for delete using (auth.uid() = user_id);

-- One profile row per person: current weight, target weight and height.
create table if not exists public.profiles (
  user_id uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  weight_kg numeric(5,1) check (weight_kg between 20 and 400),
  target_weight_kg numeric(5,1) check (target_weight_kg between 20 and 400),
  height_cm numeric(4,1) check (height_cm between 80 and 250),
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy "read own profile" on public.profiles
  for select using (auth.uid() = user_id);
create policy "add own profile" on public.profiles
  for insert with check (auth.uid() = user_id);
create policy "change own profile" on public.profiles
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
