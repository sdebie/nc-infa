-- Create auction_participant table to track users participating in auctions
CREATE TABLE IF NOT EXISTS auction_participant (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    auction_id UUID NOT NULL,
    user_id UUID NOT NULL,
    participant_number INT NOT NULL,
    joined_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (auction_id) REFERENCES auction(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    UNIQUE(auction_id, user_id),
    UNIQUE(auction_id, participant_number)
);

-- Add winning_bidder_id column to auction_item to track who bought the lot
ALTER TABLE auction_item ADD COLUMN winning_bidder_id UUID;

-- Add foreign key constraint for winning bidder
ALTER TABLE auction_item
ADD CONSTRAINT fk_auction_item_winning_bidder
FOREIGN KEY (winning_bidder_id) REFERENCES auction_participant(id);

-- Create indexes
CREATE INDEX idx_auction_participant_auction_id ON auction_participant(auction_id);
CREATE INDEX idx_auction_participant_user_id ON auction_participant(user_id);
CREATE INDEX idx_auction_item_winning_bidder_id ON auction_item(winning_bidder_id);
