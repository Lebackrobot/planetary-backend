CREATE TABLE gods (
    id          SERIAL PRIMARY KEY,
    nickname    TEXT NOT NULL,
    password    TEXT NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION update_updated_at_column()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_gods_updated_at
    BEFORE UPDATE ON gods
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();