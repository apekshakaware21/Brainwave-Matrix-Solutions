# Brainwave-Matrix-Solutions

Welcome to my Repository of SQL Database 

<h1><b>Task 1 :- Library Management System - SQL Database</b></h1>

<h2>Project Overview</h2>

The Library Management System is a Relational Database Management System (RDBMS) designed to efficiently manage library operations, including book records, user information, and book transactions. This project demonstrates the use of SQL Server Management Studio (SSMS) for designing and implementing a structured relational database.

<h2>Features</h2>

Book Management: Stores details about books, including title, author, genre, and publication year.

User Management: Maintains records of library members with contact details.

Transaction Handling: Tracks book issues and returns with timestamps.

Relational Database Schema: Ensures data integrity through relationships among tables.

Database Design

Tables:

Books

BookID (Primary Key)

Title

AuthorID (Foreign Key referencing Authors table)

Genre

PublicationYear

Authors

AuthorID (Primary Key)

Name

Email

Users

<h2>UserID (Primary Key)</h2>

Name

Email

Transactions

TransactionID (Primary Key)

BookID (Foreign Key referencing Books table)

UserID (Foreign Key referencing Users table)

IssueDate

ReturnDate

----------------------------------------------------------------------------------------

Task 2 :- School Database Management System - SQL Database

Project Overview

The School Database Management System is a Relational Database Management System (RDBMS) designed to efficiently manage school operations, including student records, teacher information, courses, and class schedules. This project demonstrates the use of SQL Server Management Studio (SSMS) for designing and implementing a structured relational database.

Features

Student Management: Stores details about students, including name, age, and contact information.

Teacher Management: Maintains records of teachers along with their assigned courses.

Course Management: Keeps track of available courses and enrolled students.

Class Scheduling: Manages class timetables and room assignments.

Relational Database Schema: Ensures data integrity through relationships among tables.

Database Design

Tables:

Students

StudentID (Primary Key)

Name

Age

Email

Teachers

TeacherID (Primary Key)

Name

Email

Subject

Courses

CourseID (Primary Key)

CourseName

TeacherID (Foreign Key referencing Teachers table)

Enrollments

EnrollmentID (Primary Key)

StudentID (Foreign Key referencing Students table)

CourseID (Foreign Key referencing Courses table)

EnrollmentDate

ClassSchedule

ScheduleID (Primary Key)

CourseID (Foreign Key referencing Courses table)

RoomNumber

TimeSlot
