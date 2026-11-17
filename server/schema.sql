-- PostgreSQL 17 provides gen_random_uuid() natively; no shared extensions required.
CREATE TABLE IF NOT EXISTS users (id UUID PRIMARY KEY DEFAULT gen_random_uuid(),name VARCHAR(80) NOT NULL,email TEXT UNIQUE NOT NULL,password_hash TEXT NOT NULL,xp INTEGER NOT NULL DEFAULT 0 CHECK (xp>=0),is_admin BOOLEAN NOT NULL DEFAULT FALSE,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW());
CREATE TABLE IF NOT EXISTS videos (id UUID PRIMARY KEY DEFAULT gen_random_uuid(),title VARCHAR(150) NOT NULL,youtube_id VARCHAR(11) NOT NULL UNIQUE,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW());
CREATE TABLE IF NOT EXISTS checkins (user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,day DATE NOT NULL,PRIMARY KEY(user_id,day));

-- Existing accounts remain private unless they explicitly opt in.
ALTER TABLE users ADD COLUMN IF NOT EXISTS leaderboard_opt_in BOOLEAN NOT NULL DEFAULT FALSE;
