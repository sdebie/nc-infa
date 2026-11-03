-- Rename current_bid to sold_price in auction_item table
ALTER TABLE auction_item RENAME COLUMN current_bid TO sold_price;
