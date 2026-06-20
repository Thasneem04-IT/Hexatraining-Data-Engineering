CREATE DATABASE expense_monitoring;

USE expense_monitoring;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DESC users;

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

DESC categories;

CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    description VARCHAR(255),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);


DESC expenses;

INSERT INTO users (full_name, email)
VALUES
('Rahul Kumar', 'rahul@gmail.com'),
('Priya Sharma', 'priya@gmail.com'),
('Amit Singh', 'amit@gmail.com'),
('Sneha Patel', 'sneha@gmail.com'),
('Vikram Rao', 'vikram@gmail.com');


SELECT * FROM users;

INSERT INTO categories (category_name)
VALUES
('Food'),
('Transport'),
('Shopping'),
('Bills'),
('Entertainment'),
('Healthcare');

SELECT * FROM categories;

INSERT INTO expenses
(user_id, category_id, amount, expense_date, description)
VALUES
(1,1,250,'2026-06-01','Lunch'),
(1,2,100,'2026-06-02','Bus Fare'),
(1,3,1500,'2026-06-05','Headphones'),

(2,1,350,'2026-06-03','Dinner'),
(2,4,2500,'2026-06-04','Electricity Bill'),

(3,2,200,'2026-06-06','Metro Ticket'),
(3,5,800,'2026-06-07','Movie Night'),

(4,6,1200,'2026-06-08','Doctor Visit'),
(4,1,400,'2026-06-09','Groceries'),

(5,3,3000,'2026-06-10','New Shoes'),
(5,4,1800,'2026-06-11','Internet Bill');


SELECT * FROM expenses;

UPDATE expenses
SET amount = 300
WHERE expense_id = 1;

SELECT * FROM expenses
WHERE expense_id = 1;


DELETE FROM expenses
WHERE expense_id = 11;


SELECT * FROM expenses;

DELIMITER $$

CREATE PROCEDURE MonthlyCategoryExpense(
    IN p_month INT,
    IN p_year INT
)
BEGIN

    SELECT
        c.category_name,
        SUM(e.amount) AS total_expense
    FROM expenses e
    JOIN categories c
        ON e.category_id = c.category_id
    WHERE MONTH(e.expense_date) = p_month
      AND YEAR(e.expense_date) = p_year
    GROUP BY c.category_name;

END $$

DELIMITER ;


CALL MonthlyCategoryExpense(6, 2026);




SELECT COUNT(*) FROM users;

SELECT COUNT(*) FROM categories;

SELECT COUNT(*) FROM expenses;











