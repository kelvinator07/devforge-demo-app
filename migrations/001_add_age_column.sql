-- Description: Add INT `age` column to `users` table in an idempotent way.
-- Re-running this migration should not error if the column already exists.

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'users'
          AND column_name = 'age'
    ) THEN
        ALTER TABLE users ADD COLUMN age INTEGER;
    END IF;
END $$;
