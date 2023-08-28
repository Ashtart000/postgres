CREATE TABLE chats(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != ''),
    owner_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

INSERT INTO chats (name,owner_id) VALUES ('superchat',1);

CREATE TABLE chats_to_users(
    chat_id int REFERENCES chats(id),
    user_id int REFERENCES users(id),
    join_at timestamp DEFAULT current_timestamp,
    PRIMARY KEY(chat_id,user_id)
);

INSERT INTO chats_to_users (chat_id,user_id) VALUES (2, 4);

INSERT INTO chats_to_users (chat_id,user_id) VALUES (2, 1);

CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK(body != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false NOT NULL,
    author_id int,
    chat_id int,
    FOREIGN KEY (chat_id,author_id) REFERENCES chats_to_users(chat_id,user_id)
);

INSERT INTO messages (body,author_id,chat_id) VALUES
('Hello from superchat',1,2),
('Hi, John',4,2),
('Let`s go to coffee',1,2),
('Ok',4,2)
;
