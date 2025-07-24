CREATE TABLE Employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  gender VARCHAR(100)
);

INSERT INTO Employees (name, age, gender) VALUES
('John', 23, 'male'),
('Janice', 43, 'female'),
('Rik', 50, 'male');
