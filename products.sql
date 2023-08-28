CREATE TABLE products(
    id serial PRIMARY KEY,
    brand varchar(128) NOT NULL,
    model varchar(256),
    description text,
    price numeric(10,2) NOT NULL CHECK(price > 0),
    discounted_price numeric(10,2) CHECK(discounted_price <= price)
);

INSERT INTO products (brand,model,price) VALUES
    ('Samsung','A7',99.99),
    ('Nokia', 'G3',109.99)
    ;

INSERT INTO products (brand,model,price) VALUES
    ('Samsung','A9',129.99),
    ('Nokia', 'G5',149.99)
    ;

ALTER TABLE products 
    ADD CONSTRAINT "inique_brand_model_pair" UNIQUE(brand,model);

ALTER TABLE products ADD COLUMN test text;

ALTER TABLE products ADD COLUMN quantity int;
ALTER TABLE products ADD CONSTRAINT "quantity>=0" CHECK(quantity >= 0);

ALTER TABLE products DROP COLUMN test;