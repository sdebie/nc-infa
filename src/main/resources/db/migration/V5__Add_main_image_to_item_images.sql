-- Add main_image column to item_images
ALTER TABLE item_images ADD COLUMN main_image BOOLEAN DEFAULT false;

-- Set the first image for each item as the main image
UPDATE item_images ii
SET main_image = true
WHERE (ii.item_id, ii.sort_order) IN (
    SELECT item_id, MIN(sort_order)
    FROM item_images
    GROUP BY item_id
);

-- Create index for quick lookup of main images
CREATE INDEX idx_item_images_main_image ON item_images(item_id, main_image)
WHERE main_image = true;
