-- 1. Обновление бюджета фильма Iron Man:

SELECT * FROM phase_one p WHERE p.title = 'Iron Man';
-- найдено: 1
UPDATE phase_one p SET p.budget_mln = 143.00 WHERE p.title = 'Iron Man' LIMIT 1;
-- обновлено: 1

-- 2. Обновление бюджета фильма The Incredible Hulk:

SELECT * FROM phase_one p WHERE p.title = 'The Incredible Hulk';
-- найдено: 1
UPDATE phase_one p SET p.budget_mln = 155.00 WHERE p.title = 'The Incredible Hulk' LIMIT 1;
-- обновлено: 1

-- 3. Обновление бюджета фильма The Avengers:

SELECT * FROM phase_one p WHERE p.title = 'The Avengers';
-- найдено: 1
UPDATE phase_one p SET p.budget_mln = 225.00 WHERE p.title = 'The Avengers' LIMIT 1;
-- обновлено: 1

-- 4. Обновление кассовых сборов фильма The Avengers:

SELECT * FROM phase_one p WHERE p.title = 'The Avengers';
-- найдено: 1
UPDATE phase_one p SET p.box_office_mln = 1521.84 WHERE p.title = 'The Avengers' LIMIT 1;
-- обновлено: 1

-- 5. Обновление кассовых сборов фильмов 2008 года на 1%:

SELECT * FROM phase_one p WHERE p.release_year = 2008;
-- найдено: 2
UPDATE phase_one p SET p.box_office_mln = p.box_office_mln * 1.01 WHERE p.release_year = 2008 LIMIT 2;
-- обновлено: 2

-- 6. Обновление бюджета фильмов 2011 года на 4%:

SELECT * FROM phase_one p WHERE p.release_year = 2011;
-- найдено: 2
UPDATE phase_one p SET p.budget_mln = p.budget_mln * 1.04 WHERE p.release_year = 2011 LIMIT 2;
-- обновлено: 2

