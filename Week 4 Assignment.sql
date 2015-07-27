--1.Create the table.  Each row should minimally include the person’s name, the person’s supervisor, and the person’s job title. 
--Using ID columns is encouraged. 

DROP TABLE if exists Nabila_Corp_Emply;

CREATE TABLE Nabila_Corp_Emply (
	EmplyID serial PRIMARY KEY,
	Emply_Last_Name VARCHAR (20) NOT NULL,
	Emply_First_Name VARCHAR (20) NOT NULL,
	Emploee_title Varchar(5),
	SupervisorID int NULL
);


-- 2. Populate the table with a few sample rows. 


INSERT INTO Nabila_Corp_Emply (EmplyID, Emply_Last_Name, Emply_First_Name, Emploee_title) 
Values ('1','Jobs','Steve','CEO');
INSERT INTO Nabila_Corp_Emply (EmplyID, Emply_Last_Name, Emply_First_Name, Emploee_title, SupervisorID) 
Values ('2','Cook','Tim','VP','1'),
('3','Fields','Bob','VP','1'),
('4','Smith','Katy','VP','1'),
('5','Ive','John','MGR','1'),
('6','Blue','Ian','MGR','2'),
('7','Keys','Nancy','MGR','3'),
('8','Symth','Greg','MGR','4'),
('9','Sky','Bruce','MGR','3'),
('10','Tri','Rose','MGR','2');

-- 3. Provide a single SELECT statement that displays the information in the table, showing who reports to whom. 

SELECT
Supervisor.Emply_Last_Name As "Supervisor Last Name",
Supervisor.Emply_First_Name As "Supervisor First Name",
Supervisor.Emploee_title AS "Supervisor Job Title",
SubSupervisor.Emply_Last_Name As "SubSupervisor Last Name",
SubSupervisor.Emply_First_Name As "SubSupervisor First Name",
SubSupervisor.Emploee_title As "SubSupervisor Job Title",
Employee.Emply_Last_Name As "Employee Last Name",
Employee.Emply_First_Name As "Employee First Name",
Employee.Emploee_title As "Employee Job Title"
FROM Nabila_Corp_Emply AS Supervisor
Inner Join Nabila_Corp_Emply As SubSupervisor
on Supervisor.EmplyID = SubSupervisor.SupervisorID
Left Join Nabila_Corp_Emply As Employee
on SubSupervisor.EmplyID = Employee.SupervisorID
Where Supervisor.Emploee_title = 'CEO'
Order by Supervisor.Emply_Last_Name, SubSupervisor.Emply_Last_Name, Employee.Emply_Last_Name;

