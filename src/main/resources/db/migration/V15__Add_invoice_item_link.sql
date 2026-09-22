CREATE TABLE IF NOT EXISTS invoice_item_link (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    item_id UUID NOT NULL,
    invoice_id UUID NOT NULL,
    item_type VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),

    CONSTRAINT uk_plant_item UNIQUE (item_id, invoice_id, item_type)
);

CREATE INDEX IF NOT EXISTS idx_item_id ON invoice_item_link(item_id);
CREATE INDEX IF NOT EXISTS idx_invoice_id ON invoice_item_link(invoice_id);
CREATE UNIQUE INDEX IF NOT EXISTS uk_plant_item_one_to_one
    ON invoice_item_link(item_id)
    WHERE item_type = 'PLANT';
