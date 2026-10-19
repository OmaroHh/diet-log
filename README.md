# Diet Log

Track diet systems day by day: meals (name, description, calories), snacks, drinks, a note per day and a note per diet.
Static site (no build step) with Supabase for sign-in and storage.

## Setup
1. Create a Supabase project. In SQL Editor, run `schema.sql`.
2. In Project Settings > API, copy the Project URL and the anon public key into `config.js`.
3. In Authentication > URL Configuration, set Site URL to the deployed address (so confirmation emails link back to it).
4. Deploy this folder as-is to Netlify (publish directory: `.`, no build command).

## Files
- `index.html` — the whole app
- `config.js` — Supabase URL and anon key
- `schema.sql` — `diets` and `profiles` tables with Row Level Security policies
- `vendor/supabase-2.45.4.js` — Supabase client (bundled so the site has no CDN dependency)
