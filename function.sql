-- АГРЕГАТНІ ФУНКЦІЇ
-- COUNT - підрахувати кількість
-- SUM - просумувати всі значення стовпця
-- AVG - середнє значення якогось стовпця
-- MIN - міімальне значення якогось стовпця
-- MAX - максимальне значення якогось стовпця


SELECT max(salary) FROM workers;
SELECT min(salary) FROM workers;
SELECT sum(salary) FROM workers;
SELECT avg(salary) FROM workers;

SELECT count(id) FROM users;

-- GROUP BY

-- Розрахувати середню вагу для чоловіків і жінок
SELECT gender, avg(weight) FROM users
GROUP BY gender;

-- Знайти кількість чоловіків і жінок
SELECT gender, count(id) FROM users
GROUP BY gender;

-- Порахувати середню вагу всіх користувачів, які народились після 1985 року
SELECT avg(weight) FROM users
WHERE extract('years' from birthday) > 1985;


-- Як varchar реагує на агрегатні функції?
SELECT sum(first_name) FROM users; -- поверне помилку
SELECT min(first_name) FROM users; -- поверне результат


-- Якщо буде час - спробуйте виконати наведені нижче завдання)

-- Працюємо з нашим імпровізованим інтернет-магазином)

-- 1. Порахувати кількість товарів, які були продані (sum(quantity) -> orders_to_products)
-- 2. Кількість товарів, які є на складі (sum(quantity) -> products)
-- 3. Середня ціна всіх товарів
-- 4. Середня ціна кожного бренду
-- 5. Сума вартості всіх телефонів, які коштують в діапазоні від 1к до 2к
-- 6. Кількість моделей кожного бренду
-- 7**. Кількість замовлень кожного користувача, який робив замовлення (групуємо по customer_id в таблиці orders -> count)
-- 8. Середня ціна телефону Huawei (якщо немає Huawei - порахуйте середню ціну якогось бренду, який є)


-- 1
SELECT sum(quantity) FROM orders_to_products;

-- 2
SELECT sum(quantity) FROM products;

-- 3
SELECT avg(price) FROM products;

-- 4
SELECT brand, avg(price) FROM products GROUP BY brand;

-- 5
SELECT sum(quantity * price) FROM products WHERE price BETWEEN 1000 AND 2000;

-- 6
SELECT brand, count(brand) FROM products GROUP BY brand;

-- 7
SELECT customer_id, count(customer_id) FROM orders GROUP BY customer_id;

--8 
SELECT avg(price) FROM products WHERE brand = 'Huawei';


-- ORDER BY - сортує дані в таблиці за якимсь стовпцем
-- ORDER BY може приймати стовпець таблиці, за яким потрібно проводити сортування
-- Крім того, може приймати 2 налаштування:
-- ASC - за збільшенням (за замовчуванням)
-- DESC - за зменшенням

SELECT concat(first_name, ' ', last_name) AS "full name" FROM users
ORDER BY "full name" DESC;


SELECT id, first_name, last_name, birthday, extract("years" from age(birthday)) AS age 
FROM users
ORDER BY age;

SELECT * FROM products
ORDER BY price DESC;

SELECT product_id, sum(quantity) AS total
FROM orders_to_products
GROUP BY product_id
ORDER BY total DESC
LIMIT 10;

SELECT * FROM products WHERE id = 70;



-- ФІЛЬТРАЦІЯ ПО ГРУПАМ
SELECT extract("years" from age(birthday)) AS "вікова група", count(*) AS "кількість в групі"
FROM users
GROUP BY "вікова група"
HAVING count(*) >= 6
ORDER BY "кількість в групі", "вікова група";

-- витягти всі бренди у якіх кількість телефонів більше 1000
SELECT brand, sum(quantity) FROM products
GROUP BY brand
HAVING sum(quantity) > 1000
;

-- витягти всі бренди, в якіх продано більше 50 телефонів
SELECT product_id, sum(quantity) AS total FROM orders_to_products
GROUP BY product_id
HAVING sum(quantity) > 40
ORDER BY total DESC;