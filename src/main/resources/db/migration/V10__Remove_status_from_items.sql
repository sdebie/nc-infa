-- Remove status column from item table
ALTER TABLE item DROP COLUMN IF EXISTS status;

-- Drop status index if it exists
DROP INDEX IF EXISTS idx_nursery_items_status;
