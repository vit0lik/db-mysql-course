-- 1. Сделайте выборку id и имен клиентов, приведенных:

-- а) к верхнему регистру
SELECT c.id, UPPER(c.name) AS name FROM clients c;
-- б) к нижнему регистру
SELECT c.id, LOWER(c.name) AS name FROM clients c;

-- 2. Фамилия и имя клиента, сокращённый номер телефона:

SELECT
    CONCAT(c.lastname, ' ', c.name) AS full_name,
    CONCAT(LEFT(c.phone, 3), REPEAT('*', LENGTH(c.phone) - 4), RIGHT(c.phone, 1)) AS phone_number
FROM clients c;

-- 3. Клиенты с вхождениями tt, ss, ll в фамилии:

SELECT
    CONCAT(LEFT(c.name, 1), '. ', c.lastname) AS full_name
FROM clients c
WHERE c.lastname REGEXP 'tt|ss|ll';

-- 4. Поиск по номеру телефона:

-- а) начинается на 586
SELECT * FROM clients c WHERE c.phone LIKE '586%';
SELECT * FROM clients c WHERE c.phone REGEXP '^586';
SELECT * FROM clients c WHERE LEFT(c.phone, 3) = '586';
SELECT * FROM clients c WHERE SUBSTRING(c.phone, 1, 3) = '586';

-- б) содержит 657
SELECT * FROM clients c WHERE c.phone LIKE '%657%';
SELECT * FROM clients c WHERE c.phone REGEXP '657';
SELECT * FROM clients c WHERE INSTR(c.phone, '657') > 0;
SELECT * FROM clients c WHERE LOCATE('657', c.phone) > 0;
SELECT * FROM clients c WHERE POSITION('657' IN c.phone) > 0;

-- в) заканчивается на 707
SELECT * FROM clients c WHERE c.phone LIKE '%707';
SELECT * FROM clients c WHERE c.phone REGEXP '707$';
SELECT * FROM clients c WHERE RIGHT(c.phone, 3) = '707';
SELECT * FROM clients c WHERE SUBSTRING(c.phone, -3, 3) = '707';
