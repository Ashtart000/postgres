CREATE TABLE books(
    id serial PRIMARY KEY,
    author varchar(64) NOT NULL CHECK(author != ''),
    title varchar(128) NOT NULL CHECK(title != '') UNIQUE,
    year numeric(4,0),
    publisher varchar(128),
    book_descriprion text,
    quantity int CHECK(quantity >= 0)
);

DROP TABLE books;

INSERT INTO books(author,title,year,publisher,book_descriprion,quantity) VALUES
    ('author1','title1',1984,'publisher1','description here...',0)
    ;