-- Rename table nursery_items to item
ALTER TABLE items RENAME TO item;

-- Rename indexes
ALTER INDEX idx_items_family_id RENAME TO idx_item_family_id;

-- Rename foreign key constraint (if any)
ALTER TABLE item_images
DROP CONSTRAINT item_images_item_id_fkey;

ALTER TABLE item_images
ADD CONSTRAINT item_images_item_id_fkey
FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE;
