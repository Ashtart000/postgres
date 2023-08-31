CREATE TABLE contents (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    description text,
    author_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

INSERT INTO contents(name, description, author_id) VALUES('Funny dogs',NULL,4);

CREATE TABLE reactions(
    content_id int REFERENCES contents(id) ON DELETE CASCADE,
    user_id int REFERENCES users(id),
    is_liked boolean
);

INSERT INTO reactions VALUES(1,2,false);
INSERT INTO reactions VALUES(1,4,true);

DELETE from contents WHERE id = 1;

DROP TABLE reactions;

