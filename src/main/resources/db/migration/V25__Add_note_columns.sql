-- Add note column to item table
ALTER TABLE item ADD COLUMN note TEXT;

-- Add note column to auction_item table
ALTER TABLE auction_item ADD COLUMN note TEXT;
