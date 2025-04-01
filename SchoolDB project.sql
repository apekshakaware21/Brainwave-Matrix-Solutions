CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Students (
StudentID INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
DOB DATE,
Gender CHAR(6),
Address NVARCHAR(255),
Phone NVARCHAR(15),
Email NVARCHAR(100)
);

CREATE TABLE Teachers (
TeacherID INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
Phone NVARCHAR(15),
Email NVARCHAR(100)
);

CREATE TABLE Subjects (
SubjectID INT IDENTITY(1,1) PRIMARY KEY,
SubjectName NVARCHAR(100),
TeacherID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
);

CREATE TABLE Classes (
ClassID INT IDENTITY(1,1) PRIMARY KEY,
ClassName NVARCHAR(50),
TeacherID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
);

CREATE TABLE Attendance (
AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
Date DATE,
Status NVARCHAR(10) CHECK (Status IN ('Present', 'Absent', 'Late'))
);

CREATE TABLE Exams (
ExamID INT IDENTITY(1,1) PRIMARY KEY,
SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
ExamDate DATE,
TotalMarks INT
);

CREATE TABLE Results (
ResultID INT IDENTITY(1,1) PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
ExamID INT FOREIGN KEY REFERENCES Exams(ExamID),
MarksObtained INT
);

CREATE TABLE Fees (
FeeID INT IDENTITY(1,1) PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
Amount DECIMAL(10,2),
DueDate DATE,
Status NVARCHAR(10) CHECK (Status IN ('Paid', 'Unpaid'))
);

INSERT INTO Students (FirstName, LastName, DOB, Gender, Address, Phone, Email)
VALUES 
('John', 'Doe', '2010-05-14', 'Male', '123 Main St', '1234567890', 'john.doe@example.com'),
('Alice', 'Smith', '2009-07-22', 'Female', '456 Oak St', '9876543210', 'alice.smith@example.com'),
('Bob', 'Johnson', '2011-09-10', 'Male', '789 Pine St', '5556667777', 'bob.johnson@example.com'),
('Eve', 'Adams', '2008-11-25', 'Female', '159 Maple St', '4443332222', 'eve.adams@example.com'),
('Chris', 'Miller', '2010-01-30', 'Male', '753 Birch St', '6667778888', 'chris.miller@example.com'),
('Grace', 'Hall', '2009-04-15', 'Female', '852 Walnut St', '7778889999', 'grace.hall@example.com'),
('David', 'Wilson', '2011-06-20', 'Male', '963 Cherry St', '8889990000', 'david.wilson@example.com'),
('Emma', 'Brown', '2008-12-05', 'Female', '357 Elm St', '9990001111', 'emma.brown@example.com');

INSERT INTO Teachers (FirstName, LastName, Phone, Email)
VALUES 
('Michael', 'Clark', '1112223333', 'michael.clark@example.com'),
('Sarah', 'Lewis', '2223334444', 'sarah.lewis@example.com'),
('Tom', 'Anderson', '3334445555', 'tom.anderson@example.com'),
('Nancy', 'Davis', '4445556666', 'nancy.davis@example.com'),
('Peter', 'White', '5556667777', 'peter.white@example.com'),
('Susan', 'Evans', '6667778888', 'susan.evans@example.com'),
('Mark', 'Roberts', '7778889999', 'mark.roberts@example.com'),
('Olivia', 'Taylor', '8889990000', 'olivia.taylor@example.com');

INSERT INTO Subjects (SubjectName, TeacherID)
VALUES 
('Mathematics', 1), ('Science', 2), ('English', 3), ('History', 4),
('Geography', 5), ('Physics', 6), ('Chemistry', 7), ('Biology', 8);

INSERT INTO Classes (ClassName, TeacherID)
VALUES 
('Grade 1', 1), ('Grade 2', 2), ('Grade 3', 3), ('Grade 4', 4),
('Grade 5', 5), ('Grade 6', 6), ('Grade 7', 7), ('Grade 8', 8);

INSERT INTO Attendance (StudentID, Date, Status)
VALUES 
(1, '2025-03-01', 'Present'), (2, '2025-03-01', 'Absent'),
(3, '2025-03-01', 'Present'), (4, '2025-03-01', 'Late'),
(5, '2025-03-01', 'Present'), (6, '2025-03-01', 'Present'),
(7, '2025-03-01', 'Absent'), (8, '2025-03-01', 'Present');

INSERT INTO Exams (SubjectID, ExamDate, TotalMarks)
VALUES 
(1, '2025-04-10', 100), (2, '2025-04-12', 100),
(3, '2025-04-14', 100), (4, '2025-04-16', 100),
(5, '2025-04-18', 100), (6, '2025-04-20', 100),
(7, '2025-04-22', 100), (8, '2025-04-24', 100);

INSERT INTO Results (StudentID, ExamID, MarksObtained)
VALUES 
(1, 1, 85), (2, 2, 78),
(3, 3, 92), (4, 4, 88),
(5, 5, 76), (6, 6, 80),
(7, 7, 89), (8, 8, 95);

INSERT INTO Fees (StudentID, Amount, DueDate, Status)
VALUES 
(1, 500.00, '2025-05-01', 'Paid'),
(2, 500.00, '2025-05-01', 'Unpaid'),
(3, 500.00, '2025-05-01', 'Paid'),
(4, 500.00, '2025-05-01', 'Paid'),
(5, 500.00, '2025-05-01', 'Unpaid'),
(6, 500.00, '2025-05-01', 'Paid'),
(7, 500.00, '2025-05-01', 'Unpaid'),
(8, 500.00, '2025-05-01', 'Paid');

select *from Students 
select *from Teachers
select *from Subjects
select *from Classes
select *from Attendance
select *from Exams
select *from Results
select *from Fees

--1.Retrieve all subjects along with their assigned teachers
SELECT Subjects.SubjectName, Teachers.FirstName, Teachers.LastName
FROM Subjects
JOIN Teachers ON Subjects.TeacherID = Teachers.TeacherID;

--2.Retrieve all classes along with their teachers
SELECT Classes.ClassName, Teachers.FirstName, Teachers.LastName
FROM Classes
JOIN Teachers ON Classes.TeacherID = Teachers.TeacherID;

--3.Get students who are absent on a specific date
SELECT Students.FirstName, Students.LastName, Attendance.Date
FROM Attendance
JOIN Students ON Attendance.StudentID = Students.StudentID
WHERE Attendance.Status = 'Absent' AND Attendance.Date = '2025-03-01';

--4.Count the number of students in the school
SELECT COUNT(*) AS TotalStudents FROM Students;

--5.Retrieve students who scored more than 80 marks in exams
SELECT Students.FirstName, Students.LastName, Results.MarksObtained
FROM Results
JOIN Students ON Results.StudentID = Students.StudentID
WHERE Results.MarksObtained > 80;

--6.Get the total number of teachers
SELECT COUNT(*) AS TotalTeachers FROM Teachers;

--7.Retrieve students with unpaid fees
SELECT Students.FirstName, Students.LastName, Fees.Status
FROM Fees
JOIN Students ON Fees.StudentID = Students.StudentID
WHERE Fees.Status = 'Unpaid';

--8.List all subjects along with their exams
SELECT Subjects.SubjectName, Exams.ExamDate, Exams.TotalMarks
FROM Exams
JOIN Subjects ON Exams.SubjectID = Subjects.SubjectID;

--9.Find students who have a birthday in May
SELECT FirstName, LastName, DOB
FROM Students
WHERE MONTH(DOB) = 5;

--10.Get the average marks obtained in each exam
SELECT ExamID, AVG(MarksObtained) AS AverageMarks
FROM Results
GROUP BY ExamID;

--11.Count the number of students in each attendance status on a specific date
SELECT Status, COUNT(*) AS Total
FROM Attendance
WHERE Date = '2025-03-01'
GROUP BY Status;

--12.Get the total amount of fees collected
SELECT SUM(Amount) AS TotalFeesCollected FROM Fees WHERE Status = 'Paid';

--13.Retrieve the highest marks obtained in each exam
SELECT ExamID, MAX(MarksObtained) AS HighestMarks
FROM Results
GROUP BY ExamID;

--14.Find students who attended school on a specific date
SELECT Students.FirstName, Students.LastName
FROM Attendance
JOIN Students ON Attendance.StudentID = Students.StudentID
WHERE Attendance.Status = 'Present' AND Attendance.Date = '2025-03-01';

--15.List teachers who are not assigned to any subjects
SELECT Teachers.FirstName, Teachers.LastName
FROM Teachers
LEFT JOIN Subjects ON Teachers.TeacherID = Subjects.TeacherID
WHERE Subjects.TeacherID IS NULL;

--16.Retrieve the total number of students per class
SELECT Classes.ClassName, COUNT(Students.StudentID) AS TotalStudents
FROM Classes
JOIN Students ON Students.StudentID BETWEEN 1 AND 8
GROUP BY Classes.ClassName;

--17.Retrieve students who have the same last name
SELECT LastName, COUNT(*) AS StudentCount 
FROM Students 
GROUP BY LastName 
HAVING COUNT(*) > 1;

--18.Retrieve the latest exam
SELECT * FROM Exams ORDER BY ExamDate DESC ;

--19.Find the youngest student in the school
SELECT TOP 1 FirstName, LastName, DOB 
FROM Students 
ORDER BY DOB DESC;

--20.Get the total number of students per gender
SELECT Gender, COUNT(*) AS TotalStudents 
FROM Students 
GROUP BY Gender;



