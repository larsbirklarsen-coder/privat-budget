# Privat budget

Husholdningsbudget: import af Nykredit-CSV, kategorisering, budget mod realiseret, fordeling og likviditet. Virker på pc og mobil (kan lægges på hjemmeskærmen).

- App: én `index.html` på GitHub Pages.
- Data: Supabase (egen database). Login med mail og adgangskode. Row Level Security sørger for, at en bruger kun ser sine egne rækker (`db/01_schema.sql`).
- Repoet indeholder ingen budgettal eller personlige data.
