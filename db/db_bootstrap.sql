CREATE DATABASE cool_db;
GRANT ALL PRIVILEGES ON cool_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

-- grant all privileges on cool_db.* to 'webapp'@'%';

USE cool_db;


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

CREATE TABLE Lecture(
    LectureID varchar(255),
    ClassID varchar(255),
    Topic varchar(255),
    primary key (LectureID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Question(
    QuestionID varchar(255),
    Question varchar(255),
    ClassID varchar(255),
    LectureID varchar(255),
    Starred BOOLEAN,
    Anonymous BOOLEAN,
    StudentName varchar(255),
    PRIMARY KEY (QuestionID),
    FOREIGN KEY (ClassID) References Class(ClassID),
    FOREIGN KEY (LectureID) REFERENCES Lecture(LectureID)
);


CREATE TABLE Asking(
    AskID varchar(255),
    StudentID varchar(255),
    QuestionID varchar(255),
    PRIMARY KEY (AskID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);



CREATE TABLE Answer(
    AnswerID varchar(255),
    Answer varchar(255),
    ResponderName varchar(255),
    QuestionID varchar(255),
    primary key (AnswerID),
    FOREIGN KEY (QuestionID) References Question(QuestionID)
);




insert into Class (ClassName, Instructor, ClassID) values ('Database Design', 'Rebekkah Castletine', 1);
insert into Class (ClassName, Instructor, ClassID) values ('Calculus', 'Joe Jonston', 2);
insert into Class (ClassName, Instructor, ClassID) values ('Algorithms', 'John Doe', 3);


insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df000118', 'Melita Mc Carroll');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df000119', 'Buckie Lorie');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011a', 'Julina Wilkins');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011b', 'Sella Winspire');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011c', 'Pamela Pitchford');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011d', 'Biddy Gloves');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011e', 'Krisha Boliver');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df00011f', 'Westley Colliver');
insert into Student (ClassID, StudentID, StudentName) values (1, '637edebdfc13ae57df000120', 'Enrichetta Chapling');

insert into Lecture (LectureID, ClassID, Topic) values ('637edf68fc13ae198a0002aa', 1, 'SQL');
insert into Lecture (LectureID, ClassID, Topic) values ('637edf68fc13ae198a0002ac', 1, 'ER Diagrams');
insert into Lecture (LectureID, ClassID, Topic) values ('637edf68fc13ae198a0002ae', 1, 'DBMS');
insert into Lecture (LectureID, ClassID, Topic) values ('637edf68fc13ae198a0002b0', 1, 'Flask API');

insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ('637edf68fc13ae198a0002a9', 'What is...?', 1, '637edf68fc13ae198a0002aa', false, true, 'Joe');
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ('637edf68fc13ae198a0002ab', 'What is...?', 1, '637edf68fc13ae198a0002ac', false, true, 'John');
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ('637edf68fc13ae198a0002ad', 'What is...?', 1, '637edf68fc13ae198a0002ae', true, false, 'James');
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ('637edf68fc13ae198a0002af', 'What is...?', 1, '637edf68fc13ae198a0002b0', false, true, 'Melita');
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ('637edf68fc13ae198a0002a5', 'What is an inner join?', 1, '637edf68fc13ae198a0002aa', false, true, 'Anonymous Student');
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ('637edf68fc13ae198a0002a3', 'What is this lecture about?', 1, '637edf68fc13ae198a0002aa', false, true, 'Anonymous Student');

insert into Asking (AskID, StudentID, QuestionID) values ('637edff8fc13ae3eb9000028', '637edebdfc13ae57df000118', '637edf68fc13ae198a0002a9');
insert into Asking (AskID, StudentID, QuestionID) values ('637edff8fc13ae3eb900002b', '637edebdfc13ae57df000119', '637edf68fc13ae198a0002ab');
insert into Asking (AskID, StudentID, QuestionID) values ('637edff8fc13ae3eb900002e', '637edebdfc13ae57df00011a', '637edf68fc13ae198a0002ad');
insert into Asking (AskID, StudentID, QuestionID) values ('637edff8fc13ae3eb9000031', '637edebdfc13ae57df00011b', '637edf68fc13ae198a0002af');
insert into Asking (AskID, StudentID, QuestionID) values ('637edff8fc13ae3eb9000027', '637edebdfc13ae57df000120', '637edf68fc13ae198a0002a5');
insert into Asking (AskID, StudentID, QuestionID) values ('637edff8fc13ae3eb9000010', '637edebdfc13ae57df000120', '637edf68fc13ae198a0002a3');

insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values ('637ee069fc13ae4cc900050a', 'Answer is ...', 'Vicki Brunnstein', '637edf68fc13ae198a0002a9');
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values ('637ee069fc13ae4cc900050c', 'Answer is ...', 'Inness Dubbin', '637edf68fc13ae198a0002ab');
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values ('637ee069fc13ae4cc900050e', 'Answer is ...', 'Annissa Hessle', '637edf68fc13ae198a0002ad');
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values ('637ee069fc13ae4cc9000510', 'Answer is ...', 'Wilek Kennaway', '637edf68fc13ae198a0002af');
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values ('637ee069fc13ae4cc900050b', 'Answer is ...', 'Vicki Brunnstein', '637edf68fc13ae198a0002a5');
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values ('637ee069fc13ae4cc900050d', 'No Answer', 'No Answer', '637edf68fc13ae198a0002a3');