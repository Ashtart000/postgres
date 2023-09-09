--Підзапити--

-- IN, NOT IN, SOME, ANY, EXISTS, ALL

--Задача: знайти всіх користувачів, які (не) робили замовлення
-- Не використовувати JOIN, не використовувати будь-яких реляційних операцій

SELECT * FROM users AS u
WHERE u.id IN (SELECT customer_id FROM orders);

SELECT * FROM users AS u
WHERE u.id NOT IN (SELECT customer_id FROM orders);


--Задача: знайти телефони, які ніхто не замовляв
SELECT * FROM products AS p
WHERE p.id NOT IN (SELECT product_id FROM orders_to_products);


-------EXISTS

--Задача: дізнатись,чи є в мене в таблиці юзер з id 4000

SELECT EXISTS
(SELECT * FROM users
WHERE id = 4000);


---Задача: використовуючи EXISTS знайти всіх користувачів, які робили замовлення
SELECT * FROM users AS u
WHERE EXISTS 
(SELECT * FROM orders AS o
WHERE u.id = o.customer_id);

---Задача: дізнатись, чи робив якийсь користувач замовлення. Відповідь подати у форматі true/false
SELECT EXISTS 
(SELECT * FROM orders
WHERE customer_id = 994);



--ANY/SOME
--SOME--ANY--IN <<---- СИНОНІМИ

--Задача: знайти всіх користувачів,які робили замовлення

SELECT * FROM users AS u
WHERE u.id = ANY (SELECT customer_id FROM orders);

SELECT * FROM users AS u
WHERE u.id = SOME (SELECT customer_id FROM orders);


---ALL

--Задача: Знайти всі телефони, які ніхто не купував
SELECT * FROM products AS p
WHERE p.id != ALL(SELECT product_id FROM orders_to_products);


--- Знайти всі телефони, які купував юзер з id 23
-- Не використовуючи JOINів, за допомогою виразів підзапитів

SELECT * FROM orders_to_products AS otp
WHERE EXISTS 
(SELECT * FROM orders AS o
WHERE otp.order_id = o.id AND o.customer_id = 10);


SELECT * FROM orders WHERE id IN (19, 20);
SELECT * FROM orders_to_products WHERE order_id IN (19, 20);


CREATE VIEW all_users_with_all_orders AS (
SELECT u.id AS user_id, first_name, last_name, email, gender, o.id AS order_id, created_at, status, product_id, otp.quantity, brand, model, price FROM 
users AS u JOIN orders AS o 
ON u.id = o.customer_id
JOIN orders_to_products AS otp
ON o.id = otp.order_id
JOIN products AS p
ON otp.product_id = p.id);

SELECT * FROM all_users_with_all_orders
WHERE user_id = 10;


-- розбір дз

--- Знайти всі телефони, які купував юзер з id 11
-- Не використовуючи JOINів, за допомогою виразів підзапитів

-- варіант без JOIN'ів
SELECT * FROM products AS p
WHERE p.id = ANY (
    SELECT product_id FROM orders_to_products AS otp 
    WHERE otp.order_id = SOME (
        SELECT id FROM orders AS o
        WHERE customer_id = 10
    )
);


--варіант з JOIN'ами
SELECT * FROM products AS p
INNER JOIN orders_to_products AS otp
ON otp.product_id = p.id
INNER JOIN orders AS o
ON otp.order_id = o.id
WHERE o.customer_id = 11;