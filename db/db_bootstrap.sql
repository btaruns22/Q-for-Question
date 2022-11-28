-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
CREATE DATABASE question_db;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON question_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
USE question_db;

-- Put your DDL 
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

CREATE TABLE Question(
    QuestionID varchar(255),
    Question varchar(255),
    ClassID varchar(255),
    LectureID varchar(255),first_name
    Starred BOOLEAN,
    Anonymous BOOLEAN,
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

CREATE TABLE Lecture(
    LectureID varchar(255),
    ClassID varchar(255),
    Topic varchar(255),
    create_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    primary key (LectureID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

-- Add sample data. 
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Rebekkah Castletine', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Clair Prettejohns', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Chilton Gonsalo', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Oralle Keating', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Giulia Vannah', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Finley Garrat', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Josee Caldecott', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Sheila-kathryn Lamba', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Cathrin Prator', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Ludovico Qualtro', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Vale Laird', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Linnie Pulley', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Reena Ryley', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Gannon Aloigi', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Cindra Niece', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Elladine Allderidge', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Jonis Dael', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Antonie Wye', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Luisa Custed', 1);
insert into Class (ClassName, Instrutor, ClassID) values ('Database Design', 'Mildred Mount', 1);



insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000118, 'Melita Mc Carroll');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000119, 'Buckie Lorie');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00011a, 'Julina Wilkins');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00011b, 'Sella Winspire');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00011c, 'Pamela Pitchford');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00011d, 'Biddy Gloves');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00011e, 'Krisha Boliver');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00011f, 'Westley Colliver');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000120, 'Enrichetta Chapling');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000121, 'Arel Burras');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000122, 'Reinald Jackalin');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000123, 'Sophronia Bargh');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000124, 'Terence Schulke');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000125, 'Nickola Hardie');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000126, 'Alla Lambole');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000127, 'Vick Goulbourne');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000128, 'Edythe Hughlock');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df000129, 'Vilma Caris');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00012a, 'Padget Fairs');
insert into Student (ClassID, StudentID, StudentName) values (1, 637edebdfc13ae57df00012b, 'Florri Habbergham');


insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002a9, 'What is...?', 1, 637edf68fc13ae198a0002aa, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002ab, 'What is...?', 1, 637edf68fc13ae198a0002ac, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002ad, 'What is...?', 1, 637edf68fc13ae198a0002ae, true, false);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002af, 'What is...?', 1, 637edf68fc13ae198a0002b0, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002b1, 'What is...?', 1, 637edf68fc13ae198a0002b2, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002b3, 'What is...?', 1, 637edf68fc13ae198a0002b4, true, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002b5, 'What is...?', 1, 637edf68fc13ae198a0002b6, false, false);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002b7, 'What is...?', 1, 637edf68fc13ae198a0002b8, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002b9, 'What is...?', 1, 637edf68fc13ae198a0002ba, true, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002bb, 'What is...?', 1, 637edf68fc13ae198a0002bc, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002bd, 'What is...?', 1, 637edf68fc13ae198a0002be, false, false);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002bf, 'What is...?', 1, 637edf68fc13ae198a0002c0, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002c1, 'What is...?', 1, 637edf68fc13ae198a0002c2, true, false);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002c3, 'What is...?', 1, 637edf68fc13ae198a0002c4, false, false);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002c5, 'What is...?', 1, 637edf68fc13ae198a0002c6, true, false);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002c7, 'What is...?', 1, 637edf68fc13ae198a0002c8, true, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002c9, 'What is...?', 1, 637edf68fc13ae198a0002ca, true, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002cb, 'What is...?', 1, 637edf68fc13ae198a0002cc, false, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002cd, 'What is...?', 1, 637edf68fc13ae198a0002ce, true, true);
insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous) values (637edf68fc13ae198a0002cf, 'What is...?', 1, 637edf68fc13ae198a0002d0, true, false);


insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000028, 637edff8fc13ae3eb9000029, 637edff8fc13ae3eb900002a);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900002b, 637edff8fc13ae3eb900002c, 637edff8fc13ae3eb900002d);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900002e, 637edff8fc13ae3eb900002f, 637edff8fc13ae3eb9000030);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000031, 637edff8fc13ae3eb9000032, 637edff8fc13ae3eb9000033);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000034, 637edff8fc13ae3eb9000035, 637edff8fc13ae3eb9000036);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000037, 637edff8fc13ae3eb9000038, 637edff8fc13ae3eb9000039);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900003a, 637edff8fc13ae3eb900003b, 637edff8fc13ae3eb900003c);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900003d, 637edff8fc13ae3eb900003e, 637edff8fc13ae3eb900003f);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000040, 637edff8fc13ae3eb9000041, 637edff8fc13ae3eb9000042);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000043, 637edff8fc13ae3eb9000044, 637edff8fc13ae3eb9000045);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000046, 637edff8fc13ae3eb9000047, 637edff8fc13ae3eb9000048);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000049, 637edff8fc13ae3eb900004a, 637edff8fc13ae3eb900004b);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900004c, 637edff8fc13ae3eb900004d, 637edff8fc13ae3eb900004e);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900004f, 637edff8fc13ae3eb9000050, 637edff8fc13ae3eb9000051);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000052, 637edff8fc13ae3eb9000053, 637edff8fc13ae3eb9000054);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000055, 637edff8fc13ae3eb9000056, 637edff8fc13ae3eb9000057);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000058, 637edff8fc13ae3eb9000059, 637edff8fc13ae3eb900005a);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900005b, 637edff8fc13ae3eb900005c, 637edff8fc13ae3eb900005d);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb900005e, 637edff8fc13ae3eb900005f, 637edff8fc13ae3eb9000060);
insert into Asking (AskID, StudentID, QuestionID) values (637edff8fc13ae3eb9000061, 637edff8fc13ae3eb9000062, 637edff8fc13ae3eb9000063);

insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900050a, 'Answer is ...', 'Vicki Brunnstein', 637ee069fc13ae4cc900050b);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900050c, 'Answer is ...', 'Inness Dubbin', 637ee069fc13ae4cc900050d);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900050e, 'Answer is ...', 'Annissa Hessle', 637ee069fc13ae4cc900050f);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000510, 'Answer is ...', 'Wilek Kennaway', 637ee069fc13ae4cc9000511);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000512, 'Answer is ...', 'Ema Aymes', 637ee069fc13ae4cc9000513);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000514, 'Answer is ...', 'Cris Gorries', 637ee069fc13ae4cc9000515);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000516, 'Answer is ...', 'Fallon Jowitt', 637ee069fc13ae4cc9000517);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000518, 'Answer is ...', 'Debor Glanz', 637ee069fc13ae4cc9000519);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900051a, 'Answer is ...', 'Kamilah Wallbutton', 637ee069fc13ae4cc900051b);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900051c, 'Answer is ...', 'Karim Beecroft', 637ee069fc13ae4cc900051d);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900051e, 'Answer is ...', 'Effie Klima', 637ee069fc13ae4cc900051f);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000520, 'Answer is ...', 'Katrinka Bortolazzi', 637ee069fc13ae4cc9000521);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000522, 'Answer is ...', 'Lilly Clewett', 637ee069fc13ae4cc9000523);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000524, 'Answer is ...', 'Bentlee Stirrip', 637ee069fc13ae4cc9000525);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000526, 'Answer is ...', 'Ondrea Morfell', 637ee069fc13ae4cc9000527);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000528, 'Answer is ...', 'Henka Klasing', 637ee069fc13ae4cc9000529);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900052a, 'Answer is ...', 'Gasparo Leith', 637ee069fc13ae4cc900052b);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900052c, 'Answer is ...', 'Dacey Murkitt', 637ee069fc13ae4cc900052d);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc900052e, 'Answer is ...', 'Minta Ferrelli', 637ee069fc13ae4cc900052f);
insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (637ee069fc13ae4cc9000530, 'Answer is ...', 'Homere Drezzer', 637ee069fc13ae4cc9000531);


insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000064, 637ee0e6fc13ae3eb9000065, 'SQL', '2021-12-18 14:50:29');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000066, 637ee0e6fc13ae3eb9000067, 'SQL', '2022-07-17 06:43:49');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000068, 637ee0e6fc13ae3eb9000069, 'SQL', '2022-03-11 05:49:14');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900006a, 637ee0e6fc13ae3eb900006b, 'SQL', '2022-05-20 16:02:17');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900006c, 637ee0e6fc13ae3eb900006d, 'SQL', '2022-07-20 00:24:32');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900006e, 637ee0e6fc13ae3eb900006f, 'SQL', '2022-05-13 20:06:23');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000070, 637ee0e6fc13ae3eb9000071, 'SQL', '2022-07-21 08:26:44');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000072, 637ee0e6fc13ae3eb9000073, 'SQL', '2022-03-16 04:37:29');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000074, 637ee0e6fc13ae3eb9000075, 'SQL', '2021-11-25 03:58:25');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000076, 637ee0e6fc13ae3eb9000077, 'SQL', '2022-04-04 10:23:40');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000078, 637ee0e6fc13ae3eb9000079, 'SQL', '2022-11-16 04:52:29');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900007a, 637ee0e6fc13ae3eb900007b, 'SQL', '2022-04-17 13:12:12');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900007c, 637ee0e6fc13ae3eb900007d, 'SQL', '2022-05-10 18:47:31');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900007e, 637ee0e6fc13ae3eb900007f, 'SQL', '2022-08-04 23:57:20');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000080, 637ee0e6fc13ae3eb9000081, 'SQL', '2022-03-21 04:58:29');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000082, 637ee0e6fc13ae3eb9000083, 'SQL', '2022-04-15 22:42:01');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000084, 637ee0e6fc13ae3eb9000085, 'SQL', '2022-06-19 07:56:56');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000086, 637ee0e6fc13ae3eb9000087, 'SQL', '2022-11-17 19:17:19');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb9000088, 637ee0e6fc13ae3eb9000089, 'SQL', '2022-11-05 17:12:13');
insert into Lecture (LectureID, ClassID, Topic, create_timestamp) values (637ee0e6fc13ae3eb900008a, 637ee0e6fc13ae3eb900008b, 'SQL', '2022-02-27 01:24:42');