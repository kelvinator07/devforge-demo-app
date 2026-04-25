-- Description: Add an 'age' column of type INT to the 'users' table if it does not exist

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='users' and column_name='age') THEN
        ALTER TABLE users ADD COLUMN age INT;
    END IF;
END $$;