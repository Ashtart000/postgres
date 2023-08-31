CREATE TABLE students(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != ''),
    last_name varchar(256) NOT NULL CHECK(last_name != ''),
    group int NOT NULL
);

CREATE TABLE groups(
    id serial PRIMARY KEY,
    department int REFERENCES departments(id)
);

CREATE TABLE departments(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != '')
);

CREATE TABLE subject(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != ''),
    lecturer varchar(256) NOT NULL CHECK(lecturer != '')
);

CREATE TABLE exam(
    student int REFERENCES students(id),
    subject int REFERENCES subject(id),
    grade int CHECK(grade > 0)
);