-- Add phone and account_credit_balance columns to user table
ALTER TABLE "user" ADD COLUMN IF NOT EXISTS phone VARCHAR(20);
ALTER TABLE "user" ADD COLUMN IF NOT EXISTS account_credit_balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00;
