# Pizarra de Deportes · Vivo 47

Tablero de deportes de Vivo 47 (Naciones Unidas, Gourmetería y Valle Real): Recovery, Nutrición, Mobility, Core, Full Evolution, Coach de Fuerza, Tutoriales, Testimonios y los estudios (Pulse, Exhala, NeoRide, Aura, FT, Salón 2, Baile).

- Sitio: https://universidadgeb-creator.github.io/pizarra-deportes/
- Es un solo archivo (`index.html`), sin compilar. GitHub Pages lo publica tal cual desde la rama `main`.
- Los datos viven en Supabase, en la tabla `deportes_docs` del mismo proyecto que la Pizarra 1%.

## Poner la base la primera vez

1. Entra a Supabase → tu proyecto → **SQL Editor → New query**.
2. Pega todo `schema.sql` y da **Run**. Crea la tabla, sus reglas de acceso y el tiempo real.
3. Abre el sitio. Arriba a la derecha debe decir "Sincronizado con el equipo".

## Qué guarda la tabla

Cada renglón es un documento (`col`, `id`, `data`):

| col | Qué es |
|---|---|
| `periodos` | Exports de TrainingGym ya acomodados por área, sucursal y periodo |
| `config` | Equipo, metas y reglas de cada área (`equipo` = Recovery) y ajustes generales (`deportes`) |
| `capturas` | Capturas mensuales a mano (Coach de Fuerza, Tutoriales) |
| `diario` | Captura diaria de accesos al club (Mobility, Full Evolution, Core) |

Con las reglas de `schema.sql`, cualquiera que tenga el link puede ver y editar. No lo compartas fuera del equipo.
