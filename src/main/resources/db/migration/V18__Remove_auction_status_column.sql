-- Remove status column from auction table (status will be calculated from auction_date)
DROP INDEX IF EXISTS idx_auction_status;
ALTER TABLE auction DROP COLUMN IF EXISTS status;
