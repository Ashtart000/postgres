SELECT * FROM users;

SELECT id, email FROM users;

SELECT id, email, is_subscribe FROM users WHERE is_subscribe;

SELECT id, email, height FROM users WHERE height IS NOT NULL; 

SELECT id, first_name FROM users WHERE id % 2 = 0;

SELECT id, email, gender, is_subscribe FROM users WHERE is_subscribe AND gender = 'female';

SELECT id, first_name FROM users WHERE first_name = 'Anya';

SELECT id, first_name FROM users WHERE first_name LIKE 'A___';

SELECT id, first_name FROM users WHERE first_name LIKE '%a';

UPDATE users SET height = 1.8;

UPDATE users SET height = 1.6 WHERE gender = 'female';

SELECT id, first_name FROM users WHERE first_name LIKE 'A%' OR first_name LIKE 'B%';

SELECT id, first_name, last_name, birthday, age(birthday) FROM users;

SELECT id, first_name, last_name, birthday, EXTRACT ("years" from age(birthday)) FROM users;

SELECT id, first_name, last_name, birthday, extract ("years" from age(birthday)) 
FROM users WHERE extract("years" from age(birthday)) < 18;

SELECT id, first_name, last_name, birthday, extract ("years" from age(birthday)) 
FROM users WHERE extract("years" from age(birthday)) BETWEEN 18 AND 26;

SELECT id, first_name, last_name, birthday FROM users WHERE extract ("months" from birthday) = 1;

UPDATE users SET is_subscribe = true 
WHERE extract("years" from age(birthday)) >= 65 
RETURNING is_subscribe, extract("years" from age(birthday));

SELECT first_name AS "Ім'я",
last_name AS "Прізвище",
email AS "Пошта",
birthday AS "Дата народження",
extract("years" from age(birthday)) AS "Вік",
height AS "Зріст",
id AS "Особистий номер"
FROM users;

