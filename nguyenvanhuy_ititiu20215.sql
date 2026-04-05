CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 1. Department Table
CREATE TABLE Department (
    DepartmentID VARCHAR(30) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Lecturer Table
CREATE TABLE Lecturer (
    LecturerID VARCHAR(30) PRIMARY KEY,
    LecturerName VARCHAR(100) NOT NULL,
    DepartmentID VARCHAR(30),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- 3. Course Table
CREATE TABLE Course (
    CourseID VARCHAR(30) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    LecturerID VARCHAR(30),
    FOREIGN KEY (LecturerID) REFERENCES Lecturer(LecturerID)
);

-- 4. Student Table
CREATE TABLE Student (
    StudentID VARCHAR(30) PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    DoB DATE,
    Major VARCHAR(50)
);

-- 5. Register Table (Many-to-Many Relationship)
CREATE TABLE Register (
    StudentID VARCHAR(30),
    CourseID VARCHAR(30),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE Student MODIFY COLUMN StudentID VARCHAR(20);
ALTER TABLE Register MODIFY COLUMN StudentID VARCHAR(20);
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Department VALUES ('IT', 'School of Computer Science');
INSERT INTO Lecturer VALUES ('L01', 'Dr. N.V.Sinh', 'IT');
INSERT INTO Course VALUES ('IT001', 'Web Application', 'L01');
INSERT INTO Student VALUES ('ITITIU20215', 'Nguyen Van Huy', '2002-08-08', 'Computer Science');
INSERT INTO Register VALUES ('ITITIU20215', 'IT001');

SELECT * FROM Student;
SELECT * FROM Register;