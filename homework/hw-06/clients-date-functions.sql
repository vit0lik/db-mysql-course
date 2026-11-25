-- 1. Год рождения по каждому клиенту.
SELECT *, YEAR(dbirth) AS birth_year FROM clients;

-- 2. Текущий возраст относительно сегодняшней даты:

-- а) полных лет;
SELECT *, TIMESTAMPDIFF(YEAR, dbirth, CURDATE()) AS age FROM clients;

-- б) лет до конца текущего года.
SELECT *, YEAR(CURDATE()) - YEAR(dbirth) AS age_by_year_end FROM clients;

-- 3. Полных лет каждому клиенту на заданную дату:

-- а) 8 декабря 1992 года;
SELECT *,
    CASE 
        WHEN dbirth <= '1992-12-08'
            THEN TIMESTAMPDIFF(YEAR, dbirth, '1992-12-08')
        ELSE 
            0 
    END AS age_at_date
    FROM clients
ORDER BY dbirth; 

-- б) 15 июля 2024 года.
SELECT *,
    CASE 
        WHEN dbirth <= '2024-07-15'
            THEN TIMESTAMPDIFF(YEAR, dbirth, '2024-07-15')
        ELSE 
            0 
    END AS age_at_date
    FROM clients
ORDER BY dbirth; 

-- 4. Клиенты с днём рождения:

-- а) в ближайшую неделю:
WITH next_birthdays AS (
    SELECT
        c.*,
        CASE
            WHEN TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth) < CURDATE()
                THEN TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth) + INTERVAL 1 YEAR
            ELSE
                TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth)
        END AS next_dbirth
    FROM clients c
)
SELECT *, TIMESTAMPDIFF(DAY, CURDATE(), next_dbirth) AS days_left
FROM next_birthdays
WHERE TIMESTAMPDIFF(DAY, CURDATE(), next_dbirth) <= 7
ORDER BY days_left;

-- б) в ближайшие две недели:
WITH next_birthdays AS (
    SELECT
        c.*,
        CASE
            WHEN TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth) < CURDATE()
                THEN TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth) + INTERVAL 1 YEAR
            ELSE
                TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth)
        END AS next_dbirth
    FROM clients c
)
SELECT *, TIMESTAMPDIFF(DAY, CURDATE(), next_dbirth) AS days_left
FROM next_birthdays
WHERE TIMESTAMPDIFF(DAY, CURDATE(), next_dbirth) <= 14
ORDER BY days_left;

-- в) до конца текущего месяца:
WITH next_birthdays AS (
    SELECT
        c.*,
        CASE
            WHEN TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth) < CURDATE()
                THEN TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth) + INTERVAL 1 YEAR
            ELSE
                TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, c.dbirth, CURDATE()), c.dbirth)
        END AS next_dbirth
    FROM clients c
)
SELECT *, TIMESTAMPDIFF(DAY, CURDATE(), next_dbirth) AS days_left
FROM next_birthdays
WHERE next_dbirth <= LAST_DAY(CURDATE())
ORDER BY days_left;