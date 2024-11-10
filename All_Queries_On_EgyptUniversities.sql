USE EgyptianUniversitiesDB;
GO
-- Select all universities
SELECT * FROM Universities;


-- Select all Departments
SELECT * FROM Departments;


-- Select all Faculties
SELECT * FROM Faculties;


-- Select all FacultyStaff
SELECT * FROM FacultyStaff;


-- Select all Programs
SELECT * FROM Programs;


-- Select all Students
SELECT * FROM Students;


-- Select universities located in Cairo
SELECT * FROM Universities WHERE Location = 'Cairo';


-- List all faculties within Cairo University (assumes UniversityID = 1 for Cairo University)
SELECT * FROM Faculties WHERE UniversityID = 1;


-- List all departments in the Faculty of Computers and Artificial Intelligence at Cairo University (assumes FacultyID = 1 for this faculty)
SELECT * FROM Departments WHERE FacultyID = 1;


-- List all programs in the Computer Science department (assumes DepartmentID = 1 for Computer Science)
SELECT * FROM Programs WHERE DepartmentID = 1;


-- Retrieve all faculty staff in the Artificial Intelligence department (assumes DepartmentID = 2 for Artificial Intelligence)
SELECT * FROM FacultyStaff WHERE DepartmentID = 2;


-- Retrieve all students enrolled in a specific program (e.g., BSc in Computer Science, ProgramID = 1)
SELECT * FROM Students WHERE ProgramID = 1;


-- Count the total number of universities
SELECT COUNT(*) AS TotalUniversities FROM Universities;


-- Count the number of faculties per university
SELECT UniversityID, COUNT(*) AS FacultyCount 
FROM Faculties 
GROUP BY UniversityID;


-- Count the number of departments per faculty
SELECT FacultyID, COUNT(*) AS DepartmentCount 
FROM Departments 
GROUP BY FacultyID;


-- Count the number of programs offered in each department
SELECT DepartmentID, COUNT(*) AS ProgramCount 
FROM Programs 
GROUP BY DepartmentID;


-- List all students enrolled in each program with their enrollment year
SELECT ProgramID, EnrollmentYear, COUNT(*) AS StudentCount 
FROM Students 
GROUP BY ProgramID, EnrollmentYear;


-- Retrieve the number of students per program, sorted by program name
SELECT Programs.ProgramName, COUNT(Students.StudentID) AS StudentCount
FROM Students
JOIN Programs ON Students.ProgramID = Programs.ProgramID
GROUP BY Programs.ProgramName
ORDER BY StudentCount DESC;


-- List all faculty and their positions in each department
SELECT FacultyStaff.StaffName, FacultyStaff.Position, Departments.DepartmentName 
FROM FacultyStaff
JOIN Departments ON FacultyStaff.DepartmentID = Departments.DepartmentID;


-- Find the university with the highest number of faculties
SELECT TOP 1 Universities.UniversityName, COUNT(Faculties.FacultyID) AS FacultyCount
FROM Universities
JOIN Faculties ON Universities.UniversityID = Faculties.UniversityID
GROUP BY Universities.UniversityName
ORDER BY FacultyCount DESC;


-- Retrieve all programs with a duration of 4 years
SELECT * FROM Programs WHERE Duration = 4;


-- List all students who enrolled in 2021, along with their program name and department
SELECT Students.FirstName, Students.LastName, Students.EnrollmentYear, Programs.ProgramName, Departments.DepartmentName
FROM Students
JOIN Programs ON Students.ProgramID = Programs.ProgramID
JOIN Departments ON Programs.DepartmentID = Departments.DepartmentID
WHERE Students.EnrollmentYear = 2021;


-- List all faculties along with their corresponding university names
SELECT Faculties.FacultyName, Universities.UniversityName 
FROM Faculties
JOIN Universities ON Faculties.UniversityID = Universities.UniversityID;


-- List all departments along with their corresponding faculty names and university names
SELECT Departments.DepartmentName, Faculties.FacultyName, Universities.UniversityName
FROM Departments
JOIN Faculties ON Departments.FacultyID = Faculties.FacultyID
JOIN Universities ON Faculties.UniversityID = Universities.UniversityID;


-- Retrieve the staff count in each department
SELECT DepartmentID, COUNT(*) AS StaffCount
FROM FacultyStaff
GROUP BY DepartmentID;


-- Find all students who are enrolled in a "Cybersecurity" program (assumes program name includes 'Cybersecurity')
SELECT Students.FirstName, Students.LastName
FROM Students
JOIN Programs ON Students.ProgramID = Programs.ProgramID
WHERE Programs.ProgramName LIKE '%Cybersecurity%';


-- Find all students and their universities
SELECT Students.FirstName, Students.LastName, Universities.UniversityName
FROM Students
JOIN Programs ON Students.ProgramID = Programs.ProgramID
JOIN Departments ON Programs.DepartmentID = Departments.DepartmentID
JOIN Faculties ON Departments.FacultyID = Faculties.FacultyID
JOIN Universities ON Faculties.UniversityID = Universities.UniversityID;


-- Retrieve all professors in the database
SELECT * FROM FacultyStaff WHERE Position = 'Professor';


-- Get the full list of students along with their program and university
SELECT Students.FirstName, Students.LastName, Programs.ProgramName, Universities.UniversityName
FROM Students
JOIN Programs ON Students.ProgramID = Programs.ProgramID
JOIN Departments ON Programs.DepartmentID = Departments.DepartmentID
JOIN Faculties ON Departments.FacultyID = Faculties.FacultyID
JOIN Universities ON Faculties.UniversityID = Universities.UniversityID;


-- Find the average duration of programs per department
SELECT DepartmentID, AVG(Duration) AS AvgProgramDuration
FROM Programs
GROUP BY DepartmentID;


-- List all unique positions of faculty staff
SELECT DISTINCT Position FROM FacultyStaff;


-- List the top 3 departments with the most students
SELECT TOP 3 Departments.DepartmentName, COUNT(Students.StudentID) AS StudentCount
FROM Students
JOIN Programs ON Students.ProgramID = Programs.ProgramID
JOIN Departments ON Programs.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName
ORDER BY StudentCount DESC;


-- Find the faculty with the most departments
SELECT TOP 1 Faculties.FacultyName, COUNT(Departments.DepartmentID) AS DepartmentCount
FROM Faculties
JOIN Departments ON Faculties.FacultyID = Departments.FacultyID
GROUP BY Faculties.FacultyName
ORDER BY DepartmentCount DESC;


-- Get a list of faculties along with the count of departments, programs, and faculty staff members in each faculty
SELECT 
    f.FacultyName,
    COUNT(DISTINCT d.DepartmentID) AS NumberOfDepartments,
    COUNT(DISTINCT p.ProgramID) AS NumberOfPrograms,
    COUNT(DISTINCT fs.StaffID) AS NumberOfFacultyStaff
FROM 
    Faculties f
    LEFT JOIN Departments d ON f.FacultyID = d.FacultyID
    LEFT JOIN Programs p ON d.DepartmentID = p.DepartmentID
    LEFT JOIN FacultyStaff fs ON d.DepartmentID = fs.DepartmentID
GROUP BY 
    f.FacultyName
ORDER BY 
    f.FacultyName;


-- Find universities offering the highest number of programs and display their count
SELECT 
    u.UniversityName,
    COUNT(p.ProgramID) AS NumberOfPrograms
FROM 
    Universities u
    INNER JOIN Faculties f ON u.UniversityID = f.UniversityID
    INNER JOIN Departments d ON f.FacultyID = d.FacultyID
    INNER JOIN Programs p ON d.DepartmentID = p.DepartmentID
GROUP BY 
    u.UniversityName
ORDER BY 
    NumberOfPrograms DESC;


-- List programs along with professors in each program's department
SELECT 
    p.ProgramName,
    fs.StaffName AS ProfessorName,
    fs.Position
FROM 
    Programs p
    INNER JOIN Departments d ON p.DepartmentID = d.DepartmentID
    INNER JOIN FacultyStaff fs ON d.DepartmentID = fs.DepartmentID
WHERE 
    fs.Position = 'Professor'
ORDER BY 
    p.ProgramName;


-- Retrieve detailed academic information for each student
SELECT 
    s.FirstName + ' ' + s.LastName AS StudentName,
    u.UniversityName,
    f.FacultyName,
    d.DepartmentName,
    p.ProgramName,
    s.EnrollmentYear
FROM 
    Students s
    INNER JOIN Programs p ON s.ProgramID = p.ProgramID
    INNER JOIN Departments d ON p.DepartmentID = d.DepartmentID
    INNER JOIN Faculties f ON d.FacultyID = f.FacultyID
    INNER JOIN Universities u ON f.UniversityID = u.UniversityID
ORDER BY 
    StudentName;

-- Get departments with the highest number of students enrolled in their programs
SELECT 
    d.DepartmentName,
    COUNT(s.StudentID) AS NumberOfStudents
FROM 
    Departments d
    INNER JOIN Programs p ON d.DepartmentID = p.DepartmentID
    INNER JOIN Students s ON p.ProgramID = s.ProgramID
GROUP BY 
    d.DepartmentName
ORDER BY 
    NumberOfStudents DESC;


-- Identify professors who are associated with the same number of programs within their departments
SELECT 
    fs.StaffName AS ProfessorName,
    COUNT(DISTINCT p.ProgramID) AS NumberOfProgramsSupervised
FROM 
    FacultyStaff fs
    INNER JOIN Departments d ON fs.DepartmentID = d.DepartmentID
    INNER JOIN Programs p ON d.DepartmentID = p.DepartmentID
WHERE 
    fs.Position = 'Professor'
GROUP BY 
    fs.StaffName
HAVING 
    COUNT(DISTINCT p.ProgramID) > 1
ORDER BY 
    NumberOfProgramsSupervised DESC;


-- Find departments offering multiple programs
SELECT 
    d.DepartmentName,
    COUNT(p.ProgramID) AS NumberOfPrograms
FROM 
    Departments d
    INNER JOIN Programs p ON d.DepartmentID = p.DepartmentID
GROUP BY 
    d.DepartmentName
HAVING 
    COUNT(p.ProgramID) > 1
ORDER BY 
    NumberOfPrograms DESC;

-- Find faculty staff members whose listed position does not match any department they are assigned to
SELECT 
    fs.StaffName,
    fs.Position,
    d.DepartmentName
FROM 
    FacultyStaff fs
    INNER JOIN Departments d ON fs.DepartmentID = d.DepartmentID
WHERE 
    fs.Position NOT LIKE '%' + d.DepartmentName + '%'
ORDER BY 
    fs.StaffName;




