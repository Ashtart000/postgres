/* Необхідно спроектувати БД поставки товарів.
В БД має зберігатися наступна інформація.

Товари:
- код товару
- назва товару
- ціна

Замовлення на поставку:
- код замовленння
- найменування постачальника
- адреса постачальнику
- номер договору
- дата заключення договору
- найменування товару
- план поставки (кількість в шт)

Фактичні відгрузки товару:
- код відгрузки
- код замовлення
- дата відгрузки
- відгружено товару (шт)

При проектуванні БД потрібно врахувати:
- товар має декілька замовлень на постачання
- замовлення відповідає одному товару
- товару можуть відповідати декілька відгрузок
- у одній відгрузці може бути декілька товарів
- товар не обов'язково має замовлення; кожне замовлення відповідає товару
- товар не обов'язково відгружається замовнику, але кожна відгрузка обов'язково відповідає певному товару

Примітка 1.
ПЛАН ПОСТАВКИ: у вас може бути замовлення, але ви його можете виконати не одразу, а частинами

Примітка 2.
Структура відношень у завданні є орієнтовною)
Таблиці потрібно спроектувати самостійно, не бійтеся нормалізувати, якщо відчуваєте, що це потрібно
*/