CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK(body != ''),
    author varchar(256) NOT NULL CHECK(author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
);

INSERT INTO messages VALUES('Hello text', 'me');

INSERT INTO messages (author, body) VALUES
    ('me', 'hello'),
    ('he', 'hi'),
    ('me', 'let`s go to coffee'),
    ('he', 'ok')
    ;

DROP TABLE messages;