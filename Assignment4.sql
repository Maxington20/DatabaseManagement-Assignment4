--Assignment 4
--Max Herrington

--1
PRINT'***QUESTION 1***'
PRINT''

DELETE
FROM PERSON
WHERE number = 7424476

DELETE 
FROM Course
WHERE number = 'BUS1070' OR number = 'LIBS1010'


--2
PRINT'***QUESTION 2***'
PRINT''

SELECT pc.courseNumber, (SELECT hours FROM Course WHERE number = pc.courseNumber) AS 'Hours',
	(SELECT credits FROM Course WHERE number = pc.courseNumber) AS 'Credits', 
	(SELECT name FROM Course WHERE number = pc.courseNumber) AS 'Name'
FROM ProgramCourse pc
WHERE pc.programCode IN (SELECT code FROM Program WHERE acronym = 'ITID') AND pc.semester = 1
ORDER BY pc.courseNumber


--3
PRINT'***QUESTION 3***'
PRINT''

SELECT  DISTINCT py.studentNumber,
	(SELECT firstName FROM Person WHERE number = py.studentNumber) AS 'First Name',
	(SELECT lastName FROM Person WHERE number = py.studentNumber) AS 'Last Name'
FROM Payment py
WHERE py.paymentMethodId IN (SELECT id FROM PaymentMethod WHERE id = 3 OR id = 2)
	AND py.amount > 1000 
ORDER BY 'Last Name'



--4
PRINT'***QUESTION 4***'
PRINT''

SELECT 
	(SELECT firstName FROM Person WHERE number = sp.studentNumber) AS 'First Name',
	(SELECT lastName FROM Person WHERE number = SP.studentNumber) AS 'Last Name'
FROM StudentProgram sp
WHERE sp.studentNumber IN (SELECT Student.number FROM Student WHERE student.isInternational = 1) 
	AND sp.studentNumber IN (SELECT Person.number FROM Person)
	AND sp.programCode IN (SELECT Program.code FROM Program WHERE Program.credentialCode IN 
		(SELECT Credential.code FROM Credential WHERE code = 'OCGC'))
	AND sp.programStatusCode = 'A'
ORDER BY 'Last Name'



--5
PRINT'***QUESTION 5***'
PRINT''

INSERT INTO Person
VALUES (7424476,'TANEJA','INDU','FLAT NO.100 TRIVENI APARTMENTS PITAM PURA','NEW DELHI',NULL,'IND','110034',
	'0141-6610242','94324060195','iteneja@conestogac.on.ca','iteneja@bsnl.co.in','1989-10-07 00:00:00.000')

SELECT* 
FROM Person
WHERE person.number = 7424476



--6
PRINT'***QUESTION 6***'
PRINT''

INSERT INTO Student
VALUES(7424476,1,'N','N',0,1130.00,'442 GIBSON ST N','KITCHENER','ON','CAN','N2M 4T4','(226) 147-2985')

SELECT number, isInternational,academicStatusCode,financialStatusCode,sequentialNumber,balance
FROM Student
WHERE Student.number = 7424476

SELECT localStreet
FROM Student
WHERE number = 7424476

SELECT localCity, localPostalCode
FROM Student
WHERE number = 7424476


--7
PRINT'***QUESTION 7***'
PRINT''

INSERT INTO StudentProgram
VALUES(7424476,'0066C',1,'A')

SELECT studentNumber,programCode,semester,programStatusCode
FROM StudentProgram
WHERE studentNumber = 7424476


--8
PRINT'***QUESTION 8***'
PRINT''

INSERT INTO	CourseStudent
VALUES (62,7424476,0)

SELECT CourseOfferingId,studentNumber,finalMark
FROM CourseStudent
WHERE studentNumber = 7424476


--9
PRINT'***QUESTION 9***'
PRINT''

INSERT INTO Course(number,hours,credits,name,frenchName)
VALUES('LIBS1010',45,3,'Critical Thinking Skills','Pensée Critique')

SELECT*
FROM Course
WHERE number = 'LIBS1010'


--10
PRINT'***QUESTION 10***'
PRINT''

INSERT INTO Course
VALUES('BUS1070',45,3,'Introduction To Human Relations','Introduction aux relations humaines')

SELECT*
FROM Course
WHERE number = 'BUS1070'


--11
PRINT'***QUESTION 11***'
PRINT''

UPDATE IncidentalFee
SET amountPerSemester = 100
WHERE id = 5

BEGIN TRANSACTION
UPDATE IncidentalFee
SET amountPerSemester = 150
ROLLBACK

SELECT *
FROM IncidentalFee
WHERE id = 5


--12
PRINT'***QUESTION 12***'
PRINT''

BEGIN TRANSACTION
UPDATE IncidentalFee
SET amountPerSemester = 200
WHERE id = 5
COMMIT

SELECT*
FROM IncidentalFee
WHERE id = 5






