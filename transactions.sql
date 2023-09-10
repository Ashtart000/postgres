/*Механізм транзакцій

1. Атомарність - виконуються або всі запити, або не виконується жоден
2. Узгодженість - транзакція повинна переводити базу даних з одного узгодженого стану в інший
3. Ізоляція - виконання однієї транзакції не повинно впливати на виконання інших транзакцій
4. Стійкість - результати транзакції не мають бути втрачені при відмові системи

*/

--СИНТАКСИС ТРАНЗАКЦІЙ

/*
BEGIN; --Початок транзакції
--Ваші SQL запити (вставка, оновлення даних, видалення....)
--Фіксуємо зміни, якщо все в порядку
COMMIT;

--Якщо сталася помилка або щось пішло не так
ROLLBACK; -- Скасовує транзакцію та відміняє зміни
--Кінець транзакції
*/

--Задача: Реалізувати транзакцію у нашому інтеренет-магазині
--1. Створити нове замовлення (orders)
--2. Наповнити замовлення (orders_to_products)

BEGIN;
INSERT INTO orders (customer_id, status) VALUES 
(10, 'new') RETURNING id;

INSERT INTO orders_to_products (order_id, product_id, quantity) VALUES
(LASTVAL(), 35, 2);

INSERT INTO orders_to_products (order_id, product_id, quantity) VALUES
(LASTVAL(), 36, 1);

INSERT INTO orders_to_products (order_id, product_id, quantity) VALUES
(LASTVAL(), 37, 1);

COMMIT;
ROLLBACK;


SELECT * FROM orders_to_products
WHERE order_id = 612;