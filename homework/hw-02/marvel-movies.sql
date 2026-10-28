DROP TABLE IF EXISTS phase_one;

CREATE TABLE phase_one (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year YEAR NOT NULL,
    in_universe_year YEAR NOT NULL,
    budget_mln DECIMAL(7, 2) NOT NULL,
    box_office_mln DECIMAL(7, 2) NOT NULL,
    profit_mln DECIMAL(7, 2) GENERATED ALWAYS AS (box_office_mln - budget_mln) STORED
);

INSERT INTO phase_one (title, release_year, in_universe_year, budget_mln, box_office_mln) VALUES
('Iron Man', 2008, 2008, 140.00, 585.37),
('The Incredible Hulk', 2008, 2010, 150.00, 264.77),
('Iron Man 2', 2010, 2010, 200.00, 623.93),
('Thor', 2011, 2010, 150.00, 449.33),
('Captain America: The First Avenger', 2011, 1943, 140.00, 370.57),
('The Avengers', 2012, 2012, 220.00, 1518.82);

SELECT 
    title, 
    in_universe_year, 
    release_year, 
    budget_mln, 
    box_office_mln, 
    profit_mln 
FROM phase_one
ORDER BY in_universe_year ASC;