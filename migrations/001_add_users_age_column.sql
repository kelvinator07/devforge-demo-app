-- Description: Add an INT age column to the existing users table.
--
-- Notes:
-- - PostgreSQL-flavored, idempotent via IF NOT EXISTS where supported.
-- - Intended to be applied by migrations tooling during deployment; NOT executed here.

ALTER TABLE users
  ADD COLUMN IF NOT EXISTS age INT;
