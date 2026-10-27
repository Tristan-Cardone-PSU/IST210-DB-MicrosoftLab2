-- Microsoft Learn relational database tutorial schema.
-- Run this only if these tables do not already exist in the lab database.
CREATE TABLE dbo.Person
(
    PersonId INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(128) NOT NULL,
    MiddleInitial NVARCHAR(10),
    LastName NVARCHAR(128) NOT NULL,
    DateOfBirth DATE NOT NULL
);
GO

CREATE TABLE dbo.Student
(
    StudentId INT IDENTITY PRIMARY KEY,
    PersonId INT FOREIGN KEY REFERENCES dbo.Person(PersonId),
    Email NVARCHAR(256)
);
GO

CREATE TABLE dbo.Course
(
    CourseId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Teacher NVARCHAR(256) NOT NULL
);
GO

CREATE TABLE dbo.Credit
(
    StudentId INT FOREIGN KEY REFERENCES dbo.Student(StudentId),
    CourseId INT FOREIGN KEY REFERENCES dbo.Course(CourseId),
    Grade DECIMAL(5, 2) CHECK (Grade <= 100.00),
    Attempt TINYINT,
    CONSTRAINT UQ_studentgrades UNIQUE CLUSTERED (StudentId, CourseId, Grade, Attempt)
);
GO
