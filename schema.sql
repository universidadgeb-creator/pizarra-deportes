-- Pizarra de Deportes · Vivo 47
-- Ejecuta todo este archivo una sola vez en Supabase → SQL Editor → New query → Run.
-- Usa el mismo proyecto de la Pizarra 1%; esta tabla es aparte y no toca ideas1pct.

create table if not exists public.deportes_docs (
  col        text        not null,   -- periodos, config, capturas, diario
  id         text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (col, id)
);

-- Reglas: cualquiera con el link puede leer y editar (igual que la Pizarra 1%).
-- No hay usuarios ni login; no compartas el link fuera del equipo.
alter table public.deportes_docs enable row level security;

drop policy if exists "cualquiera puede leer"      on public.deportes_docs;
drop policy if exists "cualquiera puede insertar"  on public.deportes_docs;
drop policy if exists "cualquiera puede actualizar" on public.deportes_docs;
drop policy if exists "cualquiera puede borrar"    on public.deportes_docs;

create policy "cualquiera puede leer"       on public.deportes_docs for select using (true);
create policy "cualquiera puede insertar"   on public.deportes_docs for insert with check (true);
create policy "cualquiera puede actualizar" on public.deportes_docs for update using (true) with check (true);
create policy "cualquiera puede borrar"     on public.deportes_docs for delete using (true);

-- Tiempo real: los cambios de una persona aparecen solos en las demás pantallas.
do $$
begin
  alter publication supabase_realtime add table public.deportes_docs;
exception when duplicate_object then null;
end $$;
