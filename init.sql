CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  gender VARCHAR(100)
);

INSERT INTO Employees (id, name, age, gender) VALUES
(1, 'John', 23, 'male'),
(2, 'Janice', 43, 'female'),
(3, 'Rik', 50, 'male');
