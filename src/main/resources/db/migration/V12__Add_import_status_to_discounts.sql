-- Add import status column to discounts table
ALTER TABLE discount ADD COLUMN import_status VARCHAR(50) DEFAULT 'ACTIVE';

-- Add file_source column to track where discount came from
ALTER TABLE discount ADD COLUMN file_source VARCHAR(255);

-- Add imported_at timestamp
ALTER TABLE discount ADD COLUMN imported_at TIMESTAMP;

-- Create index for filtering by import status
CREATE INDEX IF NOT EXISTS idx_discounts_import_status ON discount(import_status);
