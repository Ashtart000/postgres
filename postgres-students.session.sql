CREATE TABLE users(
    first_name VARCHAR(64) NOT NULL CONSTRAINT first_name_not_empty CHECK(first_name != ''),
    last_name VARCHAR(64) NOT NULL CHECK(last_name != ''),
    email TEXT NOT NULL CHECK(email != '') UNIQUE,
    biography TEXT,
    gender VARCHAR(30) NOT NULL,
    is_subscribe BOOLEAN,
    birthday DATE CHECK(birthday <= current_date),
    foot_size SMALLINT,
    height numeric(4,2)    
);

DROP TABLE users;

INSERT INTO users VALUES
    ('John','Doe','johndoe@gmail.com','some text about myself.......','male',true,'1984-01-15',44,1.85),
    ('Jane','Doe','janedoe@gmail.com','biography','female',false,'1985-03-25',38,1.64),
    ('Petr','Doe','petrdoe@gmail.com','.........','male',false,NULL,NULL,NULL),
    ('Clark','Doe','clarkdoe@gmail.com','.........','male',true,'1975-01-08',45,1.9)
    ;

ALTER TABLE users ADD COLUMN id serial PRIMARY KEY;

INSERT INTO users (
    first_name,
    last_name,
    email,
    biography,
    gender,
    is_subscribe,
    birthday,
    foot_size,
    height
  )
VALUES (
    'Tanya',
    'Doe',
    'tanya@gmail.com',
    'biography:text',
    'female',
    true,
    '2009-12-26',
    38,
    1.58
    ) RETURNING first_name;

UPDATE users SET height = 1.56 WHERE first_name = 'Tanya';

DELETE FROM users WHERE id > 11;

DROP TABLE messages, chats, chats_to_users;
DROP TABLE citizens, contents, reactions;

DELETE FROM orders_to_products;
DELETE FROM products;
DELETE FROM orders;