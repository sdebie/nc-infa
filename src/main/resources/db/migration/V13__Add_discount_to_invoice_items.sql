ALTER TABLE invoice_item ADD COLUMN discount_percentage DECIMAL(5,2);
ALTER TABLE invoice_item ADD COLUMN discounted_price DECIMAL(19,2);
