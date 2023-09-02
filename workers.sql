-- Створити таблицю workers
-- id
-- name
-- salary
-- birthday

CREATE TABLE workers(
  id serial PRIMARY KEY,
  name text CONSTRAINT name_check CHECK(name != '') NOT NULL,
  salary int CHECK(salary > 0) NOT NULL,
  birthday date CHECK (birthday < current_date)
);

-- 1. Додайте робітника з ім'ям Олег, з/п 300

INSERT INTO workers(name, salary, birthday) VALUES
('Oleg', 300, '1994-03-26');


-- 2. Додайте робітницю Ярославу, з/п 350

INSERT INTO workers(name, salary, birthday) VALUES
('Yaroslava', 350, '1991-01-21');


-- 3. Додайте двох нових працівників одним запитом
-- Сашу, з/п 1000
-- Машу, з/п 200

INSERT INTO workers(name, salary, birthday) VALUES
('Sasha', 1000, '1985-01-14'),
('Masha', 200, '1995-01-21')
RETURNING *;


-- 4. Встановити Олегу з/п 500
UPDATE workers SET salary = 500 WHERE name = 'Oleg' RETURNING *;


-- 5. Всім робітникам, з/п яких перевищує 500 долларів, врізати до 300 доларів
UPDATE workers SET salary = salary - 300 WHERE salary > 500 RETURNING *;


-- 6. Вибрати всіх робітників у віці від 20 до 35 років
-- варіант 1
SELECT id, name, birthday, extract ("years" from age(birthday)) AS age 
FROM workers WHERE extract ("years" from age(birthday)) BETWEEN 20 AND 30;

--  варіант 2
SELECT * FROM (
  SELECT name, extract('years' from age(birthday)) AS age FROM workers
) AS "workers_with_ages"
WHERE "workers_with_ages".age BETWEEN 20 AND 35;