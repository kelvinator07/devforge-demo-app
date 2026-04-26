-- Description: Add an INT 'age' column to the users table.
-- Idempotent migration: safe to re-run if the column already exists.

ALTER TABLE users
ADD COLUMN IF NOT EXISTS age INTEGER;
