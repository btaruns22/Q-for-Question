CREATE DATABASE cool_db;
CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON cool_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;


USE cool_db;



CREATE TABLE test_table (
    name VARCHAR(20),
    color VARCHAR(10)
);

CREATE TABLE Class (
    ClassName varchar(255),
    Instructor varchar(255),
    ClassID varchar(255),
    PRIMARY KEY (ClassID)
);


CREATE TABLE Student(
    ClassID varchar(255),
    StudentID varchar(255),
    StudentName varchar(255),
    PRIMARY KEY (StudentID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);



INSERT INTO test_table
    (name, color)
VALUES
    ('dev','blue'),
    ('pro', 'yellow'),
    ('junior','red');

insert into Class (ClassName, Instructor, ClassID) values ('Database Design', 'Rebekkah Castletine', 1);


insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df000118', 'Melita Mc Carroll');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df000119', 'Buckie Lorie');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011a', 'Julina Wilkins');



