-- Privat budget: én tabel med dokumenter (indstillinger + én række pr. måned).
-- Hver bruger kan kun se og ændre sine egne rækker (Row Level Security).
create table if not exists public.budget_docs (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  id         text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.budget_docs enable row level security;

drop policy if exists "egne rækker" on public.budget_docs;
create policy "egne rækker" on public.budget_docs
  for all to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

grant select, insert, update, delete on public.budget_docs to authenticated;
revoke all on public.budget_docs from anon;
