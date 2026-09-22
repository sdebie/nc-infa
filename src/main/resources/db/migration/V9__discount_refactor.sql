-- Remove sale_price from item table
ALTER TABLE item DROP COLUMN sale_price;

-- Create discount table
CREATE TABLE discount (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create discount_item junction table
CREATE TABLE discount_item (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    discount_id UUID NOT NULL REFERENCES discount(id) ON DELETE CASCADE,
    nursery_item_id UUID NOT NULL REFERENCES item(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(discount_id, nursery_item_id)
);

-- Create indexes
CREATE INDEX idx_discount_active ON discount(is_active);
CREATE INDEX idx_discount_dates ON discount(start_date, end_date);
CREATE INDEX idx_discount_item_discount ON discount_item(discount_id);
CREATE INDEX idx_discount_item_nursery_item ON discount_item(nursery_item_id);
