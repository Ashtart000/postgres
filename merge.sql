CREATE TABLE A(
    v char(3),
    t int
);

CREATE TABLE B(
    v char(3)
);

INSERT INTO A VALUES
('XXX', 1),
('XXY', 1),
('XXZ', 1),
('XYX', 2),
('XYY', 2),
('XYZ', 2),
('YXX', 3),
('YXY', 3),
('YXZ', 3);

INSERT INTO B VALUES
('ZXX'), ('XXX'), ('ZXZ'), ('YXZ'), ('YXY'); 


SELECT * FROM A, B; -- Декартова множина

-- UNION - об'єднання
-- (все те, що в множині А + все те, що в множині B, значення, які повторюються - в 1 єкземплярі)

-- INTERSECT (перетин)
-- (все те, що є і в A і в B в одному єкземплярі)

-- Різниця (EXCEPT):
--      A мінус B: все з А мінус спільні елементи для А і B
--      B мінус A: все з B мінус спільні елементи для A і B


SELECT v FROM a 
UNION
SELECT * FROM b;

SELECT v FROM a 
INTERSECT
SELECT * FROM b;

SELECT v FROM a 
EXCEPT
SELECT * FROM b;

SELECT * FROM b 
EXCEPT
SELECT v FROM a;



-------------
INSERT INTO users (first_name,last_name,email,gender,is_subscribe,birthday,foot_size,height)
VALUES (
    'Test 20',
    'Test 20',
    'test20@gmail.com',
    'male',
    true,
    '1985-08-08',
    45,
    1.86
  ),
  (
    'Test 21',
    'Test 21',
    'test21@gmail.com',
    'male',
    true,
    '1985-08-08',
    45,
    1.86
  ),
  (
    'Test 22',
    'Test 22',
    'test22@gmail.com',
    'male',
    true,
    '1985-08-08',
    45,
    1.86
  );

-- Задача: дізнатись id всіх юзерів, які робили замовлення
SELECT id FROM users
INTERSECT
SELECT customer_id FROM orders;

-- Задача: Отримати id юзерів, які ніколи не робили замовлень
SELECT id FROM users
EXCEPT
SELECT customer_id FROM orders;
