-- 1. Обновление дат рождения клиентов:

SELECT * FROM clients c WHERE (c.name, c.lastname) IN (('Gary', 'Harrison'), ('Michael', 'Atwood'), ('Amy', 'Majors'), ('Katherine', 'Smith'));
-- найдено: 4
UPDATE clients c SET c.dbirth = CASE
    WHEN c.id = 782 THEN '1930-10-21'
    WHEN c.id = 297 THEN '1934-04-12'
    WHEN c.id = 240 THEN '1975-08-01'
    WHEN c.id = 306 THEN '1959-09-22'
END
WHERE (c.name, c.lastname) IN (('Gary', 'Harrison'), ('Michael', 'Atwood'), ('Amy', 'Majors'), ('Katherine', 'Smith')) LIMIT 4;
-- обновлено: 2

-- 2. Удаление номера телефона у клиентов с годом рождения ранее 1933 года:

SELECT * FROM clients c WHERE c.dbirth < '1933-01-01';
-- найдено: 13
UPDATE clients c SET c.phone = NULL WHERE c.dbirth < '1933-01-01' LIMIT 13;
-- обновлено: 13

-- 3. Исправление имени и пола клиента John Ohara:

SELECT * FROM clients c WHERE c.name = 'John' AND c.lastname = 'Ohara';
-- найдено: 1
UPDATE clients c SET c.name = 'Johanna', c.gender = 'F' WHERE c.name = 'John' AND c.lastname = 'Ohara' LIMIT 1;
-- обновлено: 1

-- 4. Замена номеров телефонов:

SELECT * FROM clients c WHERE (c.name, c.lastname) IN (('Humberto', 'Hoosier'), ('Irene', 'Schreiber'), ('Donna', 'Wallace'));
-- найдено: 3
UPDATE clients c SET c.phone = CASE
    WHEN c.name = 'Humberto' AND c.lastname = 'Hoosier' THEN '9447103'
    WHEN c.name = 'Irene' AND c.lastname = 'Schreiber' THEN '9447102'
    WHEN c.name = 'Donna' AND c.lastname = 'Wallace' THEN '9447101'
END
WHERE (c.name, c.lastname) IN (('Humberto', 'Hoosier'), ('Irene', 'Schreiber'), ('Donna', 'Wallace')) LIMIT 3;
-- обновлено: 3

-- 5. Удаление клиентов с ID 215, 340, 449, 470, 607:

SELECT * FROM clients c WHERE c.id IN (215, 340, 449, 470, 607);
-- найдено: 4
DELETE FROM clients c WHERE c.id IN (215, 340, 449, 470, 607) LIMIT 5;
-- удалено: 4

-- 6. Удаление клиентов мужского пола с датой рождения с 01.01.1941 по 30.04.1941 и с 10.09.1972 по 15.09.1972:

SELECT * FROM clients c WHERE c.gender = 'M' AND (c.dbirth BETWEEN '1941-01-01' AND '1941-04-30' OR c.dbirth BETWEEN '1972-09-10' AND '1972-09-15');
-- найдено: 2
DELETE FROM clients c WHERE c.gender = 'M' AND (c.dbirth BETWEEN '1941-01-01' AND '1941-04-30' OR c.dbirth BETWEEN '1972-09-10' AND '1972-09-15') LIMIT 5;
-- удалено: 2
