CREATE TABLE employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  department VARCHAR(100)
);

INSERT INTO employee (name, email, department) VALUES
('Alice Smith', 'alice@example.com', 'Engineering'),
('Bob Johnson', 'bob@example.com', 'Marketing');
