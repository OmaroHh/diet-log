# NutriMate

Track diet systems day by day: meals (name, description, calories), snacks, drinks, a note per day and a note per diet.
Tick each item off when you have it, scan products for calories, sugar and protein, and see a BMI cartoon on your profile.
Static site (no build step) with Supabase for sign-in and storage. Live at https://omarohh.github.io/diet-log/

## Setup
1. Create a Supabase project. In SQL Editor, run `schema.sql`.
2. In Project Settings > API, copy the Project URL and the anon public key into `config.js`.
3. In Authentication > URL Configuration, set Site URL to the deployed address.
4. Serve this folder as-is (GitHub Pages from `main` / root, or any static host).

## Files
- `index.html` — the whole app
- `config.js` — Supabase URL and anon key
- `schema.sql` — `diets` and `profiles` tables with Row Level Security policies
- `manifest.webmanifest`, `icons/` — home screen app name and icons
- `vendor/supabase-2.45.4.js` — Supabase client
- `vendor/html5-qrcode-2.3.8.min.js` — barcode scanner, loaded only when you open Scan

Product data comes from Open Food Facts (ODbL).
