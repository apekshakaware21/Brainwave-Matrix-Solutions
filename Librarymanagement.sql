create database Librarymanagement;
use Librarymanagement;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(50),
    PublicationYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    BookID INT,
    QuantityAvailable INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(8, 2),
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Authors VALUES (1, 'George Orwell', 'UK');
INSERT INTO Authors VALUES (2, 'J.K. Rowling', 'UK');
INSERT INTO Authors VALUES (3, 'Mark Twain', 'USA');
INSERT INTO Authors VALUES (4, 'Jane Austen', 'UK');
INSERT INTO Authors VALUES (5, 'F. Scott Fitzgerald', 'USA');
INSERT INTO Authors VALUES (6, 'Agatha Christie', 'UK');
INSERT INTO Authors VALUES (7, 'Harper Lee', 'USA');
INSERT INTO Authors VALUES (8, 'J.R.R. Tolkien', 'UK');

INSERT INTO Books VALUES (1, '1984', 1, 'Dystopian', 1949);
INSERT INTO Books VALUES (2, 'Harry Potter and the Sorcerer''s Stone', 2, 'Fantasy', 1997);
INSERT INTO Books VALUES (3, 'The Adventures of Tom Sawyer', 3, 'Adventure', 1876);
INSERT INTO Books VALUES (4, 'Pride and Prejudice', 4, 'Romance', 1813);
INSERT INTO Books VALUES (5, 'The Great Gatsby', 5, 'Classic', 1925);
INSERT INTO Books VALUES (6, 'Murder on the Orient Express', 6, 'Mystery', 1934);
INSERT INTO Books VALUES (7, 'To Kill a Mockingbird', 7, 'Drama', 1960);
INSERT INTO Books VALUES (8, 'The Hobbit', 8, 'Fantasy', 1937);

INSERT INTO Members VALUES (1, 'Alice Johnson', 'alice@example.com', '123-456-7890');
INSERT INTO Members VALUES (2, 'Bob Smith', 'bob@example.com', '987-654-3210');
INSERT INTO Members VALUES (3, 'Carol White', 'carol@example.com', '456-789-0123');
INSERT INTO Members VALUES (4, 'David Brown', 'david@example.com', '789-012-3456');
INSERT INTO Members VALUES (5, 'Eve Green', 'eve@example.com', '321-654-0987');
INSERT INTO Members VALUES (6, 'Frank Black', 'frank@example.com', '567-890-1234');
INSERT INTO Members VALUES (7, 'Grace Kelly', 'grace@example.com', '678-901-2345');
INSERT INTO Members VALUES (8, 'Henry Adams', 'henry@example.com', '890-123-4567');

INSERT INTO Staff VALUES (1, 'Emma Brown', 'Librarian');
INSERT INTO Staff VALUES (2, 'John Doe', 'Assistant Librarian');
INSERT INTO Staff VALUES (3, 'Anna Lee', 'Clerk');
INSERT INTO Staff VALUES (4, 'Paul Walker', 'Manager');
INSERT INTO Staff VALUES (5, 'Nina Hope', 'Receptionist');
INSERT INTO Staff VALUES (6, 'Gary Wilson', 'Archivist');
INSERT INTO Staff VALUES (7, 'Leo King', 'Supervisor');
INSERT INTO Staff VALUES (8, 'Olivia Scott', 'Assistant Manager');

INSERT INTO Transactions VALUES (1, 1, 1, '2024-01-10', '2024-01-20');
INSERT INTO Transactions VALUES (2, 2, 2, '2024-02-01', NULL);
INSERT INTO Transactions VALUES (3, 3, 3, '2024-01-15', '2024-01-30');
INSERT INTO Transactions VALUES (4, 4, 4, '2024-02-10', NULL);
INSERT INTO Transactions VALUES (5, 5, 5, '2024-03-01', '2024-03-15');
INSERT INTO Transactions VALUES (6, 6, 6, '2024-03-05', NULL);
INSERT INTO Transactions VALUES (7, 7, 7, '2024-03-10', '2024-03-25');
INSERT INTO Transactions VALUES (8, 8, 8, '2024-03-15', NULL);

INSERT INTO Publishers VALUES (1, 'Penguin Books', 'contact@penguin.com');
INSERT INTO Publishers VALUES (2, 'Bloomsbury', 'info@bloomsbury.com');
INSERT INTO Publishers VALUES (3, 'HarperCollins', 'info@harpercollins.com');
INSERT INTO Publishers VALUES (4, 'Simon & Schuster', 'contact@simon.com');
INSERT INTO Publishers VALUES (5, 'Hachette Livre', 'info@hachette.com');
INSERT INTO Publishers VALUES (6, 'Macmillan Publishers', 'contact@macmillan.com');
INSERT INTO Publishers VALUES (7, 'Scholastic', 'info@scholastic.com');
INSERT INTO Publishers VALUES (8, 'Oxford University Press', 'contact@oup.com');

INSERT INTO Inventory VALUES (1, 1, 5);
INSERT INTO Inventory VALUES (2, 2, 3);
INSERT INTO Inventory VALUES (3, 3, 4);
INSERT INTO Inventory VALUES (4, 4, 6);
INSERT INTO Inventory VALUES (5, 5, 2);
INSERT INTO Inventory VALUES (6, 6, 7);
INSERT INTO Inventory VALUES (7, 7, 1);
INSERT INTO Inventory VALUES (8, 8, 8);

INSERT INTO Fines VALUES (1, 1, 5.00, 'Paid');
INSERT INTO Fines VALUES (2, 2, 3.50, 'Unpaid');
INSERT INTO Fines VALUES (3, 3, 7.00, 'Paid');
INSERT INTO Fines VALUES (4, 4, 2.50, 'Unpaid');
INSERT INTO Fines VALUES (5, 5, 4.00, 'Paid');
INSERT INTO Fines VALUES (6, 6, 6.00, 'Unpaid');
INSERT INTO Fines VALUES (7, 7, 8.00, 'Paid');
INSERT INTO Fines VALUES (8, 8, 1.50, 'Unpaid');

SELECT * FROM Inventory
SELECT * FROM Fines
SELECT * FROM Books
SELECT * FROM Authors
SELECT * FROM Members
SELECT * FROM Staff
SELECT * FROM Transactions
SELECT * FROM Publishers

-- 1. Retrieve all books from the Fantasy genre
SELECT * FROM Books WHERE Genre = 'Fantasy';

-- 2. List all members with email addresses
SELECT Name, Email FROM Members WHERE Email IS NOT NULL;

-- 3. Count total number of books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- 4. Find books published before 1950
SELECT * FROM Books WHERE PublicationYear < 1950;

-- 5. Find members who have borrowed books
SELECT DISTINCT Members.Name FROM Members
JOIN Transactions ON Members.MemberID = Transactions.MemberID;

-- 6. Retrieve books with no author assigned
SELECT * FROM Books WHERE AuthorID IS NULL;

-- 7. Find overdue transactions
SELECT * FROM Transactions WHERE ReturnDate IS NULL AND IssueDate < '2024-02-15';

-- 8. Display total fines collected
SELECT SUM(Amount) AS TotalFines FROM Fines;

-- 9. Retrieve inventory where books are available
SELECT * FROM Inventory WHERE QuantityAvailable > 0;

-- 10. List all authors from the UK
SELECT * FROM Authors WHERE Country = 'UK';

-- 11. Retrieve the latest published book
SELECT * FROM Books ORDER BY PublicationYear DESC ;

-- 12. Find members who have paid fines
SELECT Members.Name FROM Members
JOIN Fines ON Members.MemberID = Fines.MemberID WHERE PaymentStatus = 'Paid';

-- 13. List books that have been borrowed but not yet returned
SELECT Books.Title FROM Books
JOIN Transactions ON Books.BookID = Transactions.BookID WHERE ReturnDate IS NULL;

-- 14. Calculate average fine amount
SELECT AVG(Amount) AS AverageFine FROM Fines;

-- 15. Display staff names in alphabetical order
SELECT Name FROM Staff ORDER BY Name ASC;




