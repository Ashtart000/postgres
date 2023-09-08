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

SELECT * FROM users AS u 
WHERE u.id IN (SELECT customer_id FROM orders AS o
WHERE )
;