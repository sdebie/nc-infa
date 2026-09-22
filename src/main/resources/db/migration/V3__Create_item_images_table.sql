CREATE TABLE IF NOT EXISTS item_images (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    item_id     UUID NOT NULL REFERENCES nursery_items (id) ON DELETE CASCADE,
    image_url   TEXT NOT NULL,
    sort_order  INTEGER DEFAULT 0,
    alt_text    TEXT,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_item_images_item_id ON item_images(item_id);
CREATE INDEX idx_item_images_sort_order ON item_images(item_id, sort_order);
