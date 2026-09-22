-- Add quantity_in_stock column to item table
ALTER TABLE item ADD COLUMN quantity_in_stock INTEGER DEFAULT 0 NOT NULL;

-- Create index for easy filtering
CREATE INDEX if not exists idx_item_quantity_in_stock ON item(quantity_in_stock);
