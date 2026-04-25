-- Description: Add an INT `age` column to the `users` table.
--
-- Notes:
-- - This migration is written to be idempotent for repeated execution.
-- - It does not drop or modify existing columns.

-- Add the column if it does not already exist.
ALTER TABLE users
ADD COLUMN IF NOT EXISTS age INT; 
