-- Create item_family table
CREATE TABLE IF NOT EXISTS item_family (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(255) NOT NULL UNIQUE,
    code        VARCHAR(50) NOT NULL UNIQUE,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Add family_id column to nursery_items
ALTER TABLE nursery_items ADD COLUMN family_id UUID REFERENCES item_family (id) ON DELETE SET NULL;

-- Extract unique families from description and populate item_family
INSERT INTO item_family (name, code)
SELECT DISTINCT TRIM(description), LOWER(REPLACE(TRIM(description), ' ', '_'))
FROM nursery_items
WHERE description IS NOT NULL AND description != ''
ON CONFLICT (name) DO NOTHING;

-- Update nursery_items with family_id
UPDATE nursery_items ni
SET family_id = (
    SELECT id FROM item_family if
    WHERE if.name = TRIM(ni.description)
)
WHERE ni.description IS NOT NULL AND ni.description != '';

-- Create index on family_id for performance
CREATE INDEX idx_nursery_items_family_id ON nursery_items(family_id);

-- Optional: Keep description as is or null it out (keeping for now in case other data is needed)
