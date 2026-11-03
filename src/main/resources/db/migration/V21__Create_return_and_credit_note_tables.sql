-- Add account_credit_balance to user table
ALTER TABLE "user" ADD COLUMN account_credit_balance NUMERIC(19,2) NOT NULL DEFAULT 0;

-- Create return_request table
CREATE TABLE IF NOT EXISTS return_request (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    return_no VARCHAR(50) NOT NULL UNIQUE,
    invoice_id UUID NOT NULL,
    status VARCHAR(50) NOT NULL,
    return_date TIMESTAMP NOT NULL,
    approval_date TIMESTAMP,
    reason TEXT,
    total_return_amount NUMERIC(19,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

-- Create return_item table
CREATE TABLE IF NOT EXISTS return_item (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    return_request_id UUID NOT NULL,
    invoice_item_id UUID NOT NULL,
    quantity_returned INT NOT NULL,
    unit_price NUMERIC(19,2) NOT NULL,
    total_return_amount NUMERIC(19,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (return_request_id) REFERENCES return_request(id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id)
);

-- Create credit_note table
CREATE TABLE IF NOT EXISTS credit_note (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    credit_note_no VARCHAR(50) NOT NULL UNIQUE,
    user_id UUID NOT NULL,
    return_request_id UUID NOT NULL UNIQUE,
    credit_amount NUMERIC(19,2) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    reason TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (return_request_id) REFERENCES return_request(id)
);

-- Create indexes
CREATE INDEX idx_return_request_invoice_id ON return_request(invoice_id);
CREATE INDEX idx_return_request_status ON return_request(status);
CREATE INDEX idx_return_item_return_request_id ON return_item(return_request_id);
CREATE INDEX idx_credit_note_user_id ON credit_note(user_id);
CREATE INDEX idx_credit_note_return_request_id ON credit_note(return_request_id);
