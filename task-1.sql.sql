-- 1. DATABASE & TABLE SETUP
CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    grade VARCHAR(2),
    math_score INT,
    science_score INT,
    english_score INT
);

-- 2. INSERTING STUDENT DATA
INSERT INTO students (student_id, name, age, gender, grade, math_score, science_score, english_score)
VALUES 
(1, 'Ranjan', 15, 'M', '10', 100, 98, 95),
(2, 'Ahana', 16, 'F', '10', 75, 70, 78),
(3, 'Siri', 14, 'F', '9', 99, 68, 86),
(4, 'Deepak', 15, 'M', '10', 95, 90, 83),
(5, 'Aishwarya', 15, 'F', '10', 100, 85, 93),
(6, 'Varun', 13, 'M', '8', 90, 78, 70),
(7, 'Gaurav', 14, 'M', '9', 95, 99, 89),
(8, 'Ajay', 14, 'M', '8', 89, 100, 83),
(9, 'Keerthana', 13, 'F', '8', 100, 88, 90),
(10, 'Veer', 13, 'M', '8', 100, 88, 90);

-- 3. ANALYSIS QUERIES
SELECT * FROM students;

-- Average score in each subject
SELECT AVG(math_score) AS AvgMath, AVG(science_score) AS AvgScience, AVG(english_score) AS AvgEnglish FROM students;

-- Top performer (highest total score)
SELECT name, (math_score + science_score + english_score) AS TotalScore 
FROM students 
ORDER BY TotalScore DESC 
LIMIT 1;

-- Count students per grade
SELECT grade, COUNT(*) AS StudentCount FROM students GROUP BY grade;

-- Avg score by gender
SELECT gender, AVG((math_score + science_score + english_score) / 3) AS AvgTotal FROM students GROUP BY gender;

-- Students with Math > 80
SELECT name, math_score FROM students WHERE math_score > 80;

-- Update a student's grade
UPDATE students SET grade = '11' WHERE name = 'Ranjan';