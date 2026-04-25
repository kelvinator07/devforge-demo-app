-- Description: Add an 'age' column to the 'users' table
-- This migration adds a new INTEGER column 'age' to the existing 'users' table.

ALTER TABLE users
ADD COLUMN IF NOT EXISTS age INT;