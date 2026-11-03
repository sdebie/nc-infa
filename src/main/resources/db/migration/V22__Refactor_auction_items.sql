-- Refactor auction_item to store item details directly (decouple from item table)
-- Add status enum to auction table

-- Step 1: Drop the existing item_id foreign key constraint
ALTER TABLE auction_item DROP CONSTRAINT auction_item_item_id_fkey;

-- Step 2: Add item detail columns to auction_item
ALTER TABLE auction_item ADD COLUMN item_no VARCHAR(50);
ALTER TABLE auction_item ADD COLUMN item_description VARCHAR(1000);
ALTER TABLE auction_item ADD COLUMN item_diameter NUMERIC(10,2);
ALTER TABLE auction_item ADD COLUMN item_original_price NUMERIC(19,2);

ALTER TABLE auction ADD COLUMN status VARCHAR(50) DEFAULT 'SCHEDULED';

-- Step 3: Populate new columns from item table (for existing data)
UPDATE auction_item ai
SET
    item_no = i.item_no,
    item_description = i.description,
    item_diameter = i.diameter,
    item_original_price = i.original_price
FROM item i
WHERE ai.item_id = i.id;

-- Step 4: Drop the item_id column
ALTER TABLE auction_item DROP COLUMN item_id;

-- Step 5: Drop the old index
DROP INDEX IF EXISTS idx_auction_item_item_id;
DROP INDEX IF EXISTS idx_auction_item_auction_id;

-- Add index for auction_item search by item_no
CREATE INDEX idx_auction_item_item_no ON auction_item(item_no);
CREATE INDEX idx_auction_item_auction_id  ON auction_item(auction_id);
