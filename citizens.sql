CREATE TABLE citizens(
    id serial PRIMARY KEY,
    name varchar(256),
    age int,
    is_adult boolean GENERATED ALWAYS AS (age >= 18) STORED
);

INSERT INTO citizens(name,age) VALUES 
('Tanya',11),
('Andrij',14),
('Anya',39)
;