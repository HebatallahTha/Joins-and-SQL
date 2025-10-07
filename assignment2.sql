--CIS 111 03 Hebatallah Tharhan Assigment 2 upload
USE Cis111_MurachCollege
--Query 1
Select CourseNumber, CourseDescription, DepartmentName
From Courses
Join Departments --using the join
	On Departments.DepartmentID = Courses.DepartmentID --must have on when using join
Order by DepartmentName, CourseNumber ASC;

--Query 2
Select LastName, FirstName, CourseNumber, CourseDescription
From Instructors
	Join Courses
	On Courses.InstructorID = Instructors.InstructorID
	Where Instructors.Status = 'P' --the stauts must be P
	Order By LastName, FirstName ASC;
--Query 3
Select DepartmentName, CourseDescription, FirstName, LastName
From Departments d
	Join Courses c
		On d.DepartmentID = c.DepartmentID
	Join Instructors i
		On c.InstructorID = i.InstructorID
	Where CourseUnits = 3 --CourseUnit must be 3!
	Order By DepartmentName, CourseDescription ASC;
--Query 4 
Select DepartmentName, CourseDescription, LastName, FirstName 
From Departments d
	Join Courses c
		on d.DepartmentID = c.DepartmentID
	Join StudentCourses sc
		on c.CourseID = sc.CourseID --make sure not to use s instead of sc because of the same letter misuse that I did before
	Join Students s
		on sc.StudentID = s.StudentID
	Where DepartmentName ='English' --eng dept
	Order by DepartmentName, CourseDescription ASC;
--Query 5 
Select LastName, FirstName, CourseDescription
From Instructors
	Left Join Courses
		On Instructors.InstructorID = Courses.InstructorID
		-- Number 6 instructor id is missing!
		Order by LastName, FirstName;

--Query 6
Select 'UNDERGRAD' as Status, FirstName, LastName, EnrollmentDate, GraduationDate --use a similar approach or qr 8 the select ' '
From Students
Where GraduationDate is Null

Union           --heres the union where we kind of seperate the undergrad and grad

Select 'GRADUATED' as Status, FirstName, LastName, EnrollmentDate, GraduationDate
From Students
Where GraduationDate is not Null --meaning they did graduate
Order by EnrollmentDate;

--Query 7
Select d.DepartmentName, c.CourseID
From Departments d
	Left Join Courses c
		on d.DepartmentID = c.DepartmentID
Where c.CourseID is Null; 

--Query 8
Select d.DepartmentName as InstructorDept, LastName, FirstName, CourseDescription, de.DepartmentName as CourseDept
From Instructors i
	 Join Departments d
		on i.DepartmentID = d.DepartmentID
	 Join Courses c
		on i.InstructorID= c.InstructorID
	 Join Departments de
		on c.DepartmentID = de.DepartmentID
Where d.DepartmentID != de.DepartmentID; --the doesnt equal is the same as the doesnt equal in c++ which is cool! 


