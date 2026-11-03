-- Add height column to item table
ALTER TABLE item ADD COLUMN height NUMERIC(10,2);

-- Add item_height column to auction_item table (snapshot of height at time of auction)
ALTER TABLE auction_item ADD COLUMN item_height NUMERIC(10,2);

-- Populate auction_item.item_height from existing items (for backwards compatibility)
UPDATE auction_item ai
SET item_height = i.height
FROM item i
WHERE ai.item_no = i.item_no;
