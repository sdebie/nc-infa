-- Create auction table
CREATE TABLE IF NOT EXISTS auction (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    auction_name VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    auction_date TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'SCHEDULED',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create auction_item table
CREATE TABLE IF NOT EXISTS auction_item (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    auction_id UUID NOT NULL,
    item_id UUID NOT NULL,
    starting_price NUMERIC(19,2) NOT NULL,
    current_bid NUMERIC(19,2),
    estimated_price NUMERIC(19,2),
    reserve_price NUMERIC(19,2),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (auction_id) REFERENCES auction(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

-- Create indexes
CREATE INDEX idx_auction_status ON auction(status);
CREATE INDEX idx_auction_date ON auction(auction_date);
CREATE INDEX idx_auction_item_auction_id ON auction_item(auction_id);
CREATE INDEX idx_auction_item_item_id ON auction_item(item_id);
