CREATE TABLE IF NOT EXISTS nursery_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    item_no VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255) NOT NULL,
    original_price NUMERIC(15, 2) NOT NULL,
    sale_price NUMERIC(15, 2) NOT NULL,
    status VARCHAR(50),
    diameter INTEGER NOT NULL,
    available_sequence INTEGER,
    source VARCHAR(255),
    source_row INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_nursery_items_item_no ON nursery_items(item_no);
CREATE INDEX IF NOT EXISTS idx_nursery_items_status ON nursery_items(status);
CREATE INDEX IF NOT EXISTS idx_nursery_items_created_at ON nursery_items(created_at);
