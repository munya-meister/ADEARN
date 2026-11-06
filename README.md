# ADEARN — Grandmeister Fan Space

Standalone, mobile-friendly fan engagement platform featuring Grandmeister's official YouTube video links and non-cash fan XP.

## Stack
React + Vite frontend, Node.js + Express API, PostgreSQL persistence, JWT stored in an HTTP-only cookie. No Supabase.

## Local setup
1. Install Node.js 20+ and PostgreSQL.
2. Create a PostgreSQL database named `adearn`.
3. Run `server/schema.sql` then `server/seed.sql` on that database.
4. Copy `server/.env.example` to `server/.env`. Set DATABASE_URL and a strong random JWT_SECRET (32+ characters). Set ADMIN_EMAIL to the email you will **register** as administrator.
5. Copy `client/.env.example` to `client/.env`.
6. From the repository root run `npm install`, `npm run install:all`, then `npm run dev`.
7. Open http://localhost:5173, create your administrator account, and then manage videos from the Admin tab.

## Deployment
- Frontend: Vercel, root directory `client`, framework Vite, build `npm run build`, output `dist`. Environment variable `VITE_API_URL` must point to the public HTTPS backend URL.
- API: Render Node web service, root directory `server`, build `npm install`, start `npm start`.
- Database: Managed PostgreSQL from your preferred provider. Apply `schema.sql` and `seed.sql` before launch.
- Backend environment: DATABASE_URL, JWT_SECRET, CLIENT_ORIGIN (your deployed frontend origin), NODE_ENV=production, ADMIN_EMAIL, and PGSSL according to your database provider.
- For production with cookies across different origins, ensure both sites run over HTTPS. You may later add CSRF/origin protection and email verification before opening registration widely.

## Current features
- Registration and login
- Account-specific XP persisted in PostgreSQL
- 50 XP daily check-in (UTC date, atomic and once a day)
- 100,000 XP milestone progress
- Preloaded official YouTube links with thumbnails and external playback
- Admin-only video management
- Responsive dark interface
- Leaderboard placeholder

## Important rewards policy
XP has no current monetary value. No deposits, cash withdrawals, or cash conversion are enabled or promised. Watching, liking, or subscribing to YouTube content does **not** award XP. A funded future rewards program would require separate transparent terms, legal/compliance review, and abuse safeguards.

## Security checklist before public launch
Add email verification, password reset, moderation, CSRF/origin checks on mutations, bot/signup protections, audit logs, and user-data privacy terms. For admin provisioning, use a safe operational method before accepting registrations publicly; the initial ADMIN_EMAIL bootstrap is intended for controlled setup only.
