-- 1. Поиск клиентов по имени:

-- а)
SELECT * FROM clients c WHERE c.name = 'Robert';
-- б)
SELECT * FROM clients c WHERE c.name = 'Jeffrey';
-- в)
SELECT * FROM clients c WHERE c.name = 'John';
-- г)
SELECT * FROM clients c WHERE c.name = 'Richard';
-- д)
SELECT * FROM clients c WHERE c.name = 'David';
-- е)
SELECT * FROM clients c WHERE c.name IN ('Robert', 'Jeffrey', 'John', 'Richard', 'David');

-- 2. Поиск клиентов по полу:

-- а)
SELECT * from clients c WHERE c.gender = 'M';
-- б)
SELECT * from clients c WHERE c.gender = 'F';

-- 3. Поиск клиентов, их номеров телефона по фамилии:

-- а)
SELECT c.name, c.lastname, c.phone FROM clients c WHERE c.lastname = 'Williams'; 
-- б)
SELECT c.name, c.lastname, c.phone FROM clients c WHERE c.lastname = 'Jones'; 
-- в)
SELECT c.name, c.lastname, c.phone FROM clients c WHERE c.lastname = 'Brown'; 
-- г)
SELECT c.name, c.lastname, c.phone FROM clients c WHERE c.lastname = 'Miller'; 
-- д)
SELECT c.name, c.lastname, c.phone FROM clients c WHERE c.lastname IN ('Williams', 'Jones', 'Brown', 'Miller'); 

-- 4. Поиск клиентов, их даты рождения и пола по имени или фамилии:

-- а)
SELECT c.name, c.lastname, c.dbirth, c.gender FROM clients c WHERE c.name = 'Kelly' OR c.lastname = 'Kelly';
-- б)
SELECT c.name, c.lastname, c.dbirth, c.gender FROM clients c WHERE 'Thomas' = c.name OR 'Thomas' = c.lastname;
-- в)
SELECT c.name, c.lastname, c.dbirth, c.gender FROM clients c WHERE 'Clark' IN (c.name, c.lastname);
-- г)
SELECT c.name, c.lastname, c.dbirth, c.gender FROM clients c WHERE 'Joseph' IN (c.name, c.lastname);

-- 5. Поиск клиентов, их даты рождения и номера телефона по полному имени:

-- а)
SELECT c.name, c.lastname, c.dbirth, c.phone FROM clients c WHERE c.name = 'Tom' AND c.lastname = 'Brown';
-- б)
SELECT c.name, c.lastname, c.dbirth, c.phone FROM clients c WHERE (c.name, c.lastname) = ('Janet', 'Silberstein');
-- в)
SELECT CONCAT(c.name, ' ', c.lastname) AS fullname, c.dbirth, c.phone FROM clients c WHERE CONCAT(c.name, c.lastname) = 'JohnFoster';


