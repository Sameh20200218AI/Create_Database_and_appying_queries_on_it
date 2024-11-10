-- Create the database
CREATE DATABASE EgyptianUniversitiesDB;
GO

USE EgyptianUniversitiesDB;
GO

-- Create Universities Table
CREATE TABLE Universities (
    UniversityID INT PRIMARY KEY IDENTITY(1,1),
    UniversityName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Website VARCHAR(100)
);

-- Create Faculties Table
CREATE TABLE Faculties (
    FacultyID INT PRIMARY KEY IDENTITY(1,1),
    FacultyName VARCHAR(100) NOT NULL,
    UniversityID INT,
    FOREIGN KEY (UniversityID) REFERENCES Universities(UniversityID) ON DELETE CASCADE
);

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID) ON DELETE CASCADE
);

-- Create Programs Table
CREATE TABLE Programs (
    ProgramID INT PRIMARY KEY IDENTITY(1,1),
    ProgramName VARCHAR(100) NOT NULL,
    Duration INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE
);

-- Create FacultyStaff Table
CREATE TABLE FacultyStaff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    StaffName VARCHAR(100),
    Position VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE
);

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentYear INT, -- Use INT for storing year
    ProgramID INT,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID) ON DELETE CASCADE
);

-- Insert data into Universities
INSERT INTO Universities (UniversityName, Location, Website) VALUES
('Cairo University', 'Cairo', 'www.cu.edu.eg'),
('Ain Shams University', 'Cairo', 'www.asu.edu.eg'),
('Alexandria University', 'Alexandria', 'www.alexu.edu.eg'),
('Mansoura University', 'Mansoura', 'www.mans.edu.eg'),
('Assiut University', 'Assiut', 'www.aun.edu.eg'),
('Zagazig University', 'Zagazig', 'www.zu.edu.eg'),
('Helwan University', 'Cairo', 'www.helwan.edu.eg'),
('Beni Suef University', 'Beni Suef', 'www.bsu.edu.eg'),
('Suez Canal University', 'Ismailia', 'www.suezuniv.edu.eg'),
('South Valley University', 'Qena', 'www.svu.edu.eg');


-- Insert data into Faculties
INSERT INTO Faculties (FacultyName, UniversityID) VALUES
('Faculty of Computers and Artificial Intelligence', 1),
('Faculty of Engineering', 1),
('Faculty of Computers and Artificial Intelligence', 2),
('Faculty of Engineering', 2),
('Faculty of Computers and Artificial Intelligence', 3),
('Faculty of Engineering', 3),
('Faculty of Computer Science', 4),
('Faculty of Computers and Informations', 5),
('Faculty of Computers and Artificial Intelligence', 6),
('Faculty of Computers and Artificial Intelligence', 7);


-- Insert data into Departments
INSERT INTO Departments (DepartmentName, FacultyID) VALUES
('Computer Science', 1),
('Artificial Intelligence', 1),
('Data Science', 1),
('Cybersecurity', 1),
('Computer Science', 3),
('Artificial Intelligence', 3),
('Information Systems', 4),
('Cybersecurity', 4),
('Computer Science', 5),
('Information Systems', 7);

-- Insert data into Programs
INSERT INTO Programs (ProgramName, Duration, DepartmentID) VALUES
('BSc in Computer Science', 4, 1),
('BSc in Artificial Intelligence', 4, 2),
('MSc in Data Science', 2, 3),
('PhD in Cybersecurity', 4, 4),
('BSc in Computer Science', 4, 5),
('MSc in AI and Robotics', 2, 6),
('BSc in Information Systems', 4, 7),
('PhD in Cybersecurity', 4, 8),
('MSc in Computer Science', 2, 9),
('BSc in Information Systems', 4, 10);

-- Insert data into FacultyStaff
INSERT INTO FacultyStaff (StaffName, Position, DepartmentID) VALUES
('Dr. Ahmed Mahmoud', 'Professor', 1),
('Dr. Sara Hussein', 'Associate Professor', 2),
('Dr. Mohamed Youssef', 'Lecturer', 3),
('Dr. Mona Khalil', 'Assistant Professor', 4),
('Dr. Hani Farouk', 'Professor', 5),
('Dr. Tamer Salah', 'Lecturer', 6),
('Dr. Dina Reda', 'Professor', 7),
('Dr. Fadi Emad', 'Assistant Professor', 8),
('Dr. Khaled Samy', 'Lecturer', 9),
('Dr. Reham Gaber', 'Associate Professor', 10);

-- Insert data into Students
INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Ahmed', 'Ali', 2020, 1),
('Mona', 'Ibrahim', 2021, 2),
('Youssef', 'Salem', 2020, 3),
('Sara', 'Nabil', 2019, 4),
('Khaled', 'Ahmed', 2020, 5),
('Hassan', 'Farouk', 2021, 6),
('Heba', 'Magdy', 2022, 7),
('Nour', 'Adel', 2019, 8),
('Omar', 'Khalil', 2022, 9),
('Fatma', 'Youssef', 2021, 10);

-- Insert data into Students table
INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Ahmed', 'Ali', 2020, 1),
('Mona', 'Ibrahim', 2021, 2),
('Youssef', 'Salem', 2020, 3),
('Sara', 'Nabil', 2019, 4),
('Khaled', 'Ahmed', 2020, 5),
('Hassan', 'Farouk', 2021, 6),
('Heba', 'Magdy', 2022, 7),
('Nour', 'Adel', 2019, 8),
('Omar', 'Khalil', 2022, 9),
('Fatma', 'Youssef', 2021, 10),
('Ali', 'Hassan', 2020, 1),
('Laila', 'Saad', 2021, 2),
('Samir', 'Nour', 2022, 3),
('Rana', 'Gaber', 2019, 4),
('Yara', 'Mahmoud', 2021, 5),
('Tarek', 'Sami', 2020, 6),
('Aya', 'Naser', 2022, 7),
('Mustafa', 'Salim', 2019, 8),
('Alaa', 'Omar', 2020, 9),
('Dina', 'Yaseen', 2021, 10);


INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Ahmad', 'Fouad', 2020, 1),
('Reem', 'Ashraf', 2022, 2),
('Karim', 'Mohamed', 2019, 3),
('Hanan', 'Saad', 2021, 4),
('Walid', 'Ali', 2020, 5),
('Ghada', 'Farid', 2021, 6),
('Salma', 'Sameh', 2022, 7),
('Ehab', 'Kamal', 2020, 8),
('Shadi', 'Sami', 2021, 9),
('Lina', 'Ahmed', 2019, 10),
('Basma', 'Osman', 2022, 1),
('Ramy', 'Salah', 2020, 2),
('Samar', 'Younis', 2019, 3),
('Mervat', 'Amin', 2021, 4),
('Kareem', 'Samir', 2020, 5),
('Rania', 'Adly', 2022, 6),
('Hatem', 'Gamil', 2019, 7),
('Nadia', 'Ibrahim', 2021, 8),
('Ziad', 'Helmy', 2020, 9),
('Mariam', 'Ezzat', 2022, 10);

INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Ahmad', 'Samy', 2020, 1),
('Reem', 'Ahmed', 2022, 2),
('Aya', 'Mohamed', 2019, 2),
('Hanan', 'Adly', 2021, 4),
('Wageh', 'Ali', 2020, 5),
('Gina', 'Fahmy', 2021, 3),
('Salama', 'Sameh', 2022, 7),
('Sameh', 'Kamal', 2020, 2),
('Mary', 'Sami', 2021, 9),
('Lamyaa', 'Ahmed', 2019, 1),
('Basmala', 'Osman', 2022, 1),
('Ramy', 'Saad', 2020, 2),
('Samar', 'Helmy', 2019, 4),
('Mervat', 'Adel', 2021, 4),
('Kareem', 'Mostafa', 2020, 5),
('Nabil', 'Adly', 2022, 6),
('Ali', 'Gamil', 2019, 7),
('Nadia', 'Osama', 2021, 8),
('Sameh', 'Raouf', 2020, 9),
('Mariam', 'Nabil', 2022, 7);

-- Insert data into Students with varied names, years, and program IDs
INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Amina', 'Hassan', 2020, 1),
('Nadia', 'Youssef', 2021, 5),
('Yasmine', 'Omar', 2019, 3),
('Tamer', 'Saad', 2022, 4),
('Khaled', 'Sayed', 2020, 5),
('Sally', 'Ezzat', 2021, 1),
('Noha', 'Farouk', 2022, 7),
('Ayman', 'Nabil', 2019, 1),
('Fady', 'Kamel', 2021, 9),
('Rania', 'Maher', 2022, 1),
('Malak', 'Shawky', 2020, 1),
('Hussein', 'Adel', 2022, 2),
('Nourhan', 'Fathy', 2021, 3),
('Gamal', 'Mostafa', 2020, 4),
('Mai', 'Ali', 2019, 1),
('Sara', 'Tarek', 2021, 6),
('Mona', 'Salem', 2022, 7),
('Bassem', 'Samy', 2020, 8),
('Mariam', 'Wahid', 2021, 1),
('Ismail', 'Fouad', 2019, 10);

-- Additional entries
INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Hany', 'Kareem', 2022, 1),
('Dalia', 'Hamza', 2020, 2),
('Ali', 'Gabr', 2021, 3),
('Laila', 'Mostafa', 2019, 4),
('Mohamed', 'Hossam', 2022, 5),
('Farida', 'Ashraf', 2020, 6),
('Rami', 'Osman', 2019, 7),
('Sherif', 'Adham', 2021, 8),
('Dina', 'Raouf', 2022, 9),
('Tala', 'Sabry', 2020, 10),
('Samir', 'Younan', 2021, 1),
('Alaa', 'Nour', 2019, 2),
('Sherine', 'Mounir', 2022, 3),
('Adel', 'Youssef', 2020, 4),
('Ghada', 'Fawzy', 2021, 5),
('Hussein', 'Othman', 2022, 6),
('Shady', 'Gad', 2019, 7),
('Ola', 'Riad', 2021, 8),
('Mina', 'George', 2020, 9),
('Amr', 'Lotfy', 2022, 10);

INSERT INTO Students (FirstName, LastName, EnrollmentYear, ProgramID) VALUES
('Zain', 'Attia', 2021, 1),
('Ramy', 'Rashad', 2022, 2),
('Fouad', 'Younis', 2019, 3),
('Amany', 'Gaber', 2021, 4),
('Soha', 'Sami', 2020, 5),
('Marwan', 'Naguib', 2022, 6),
('Sahar', 'Bishoy', 2019, 7),
('Abdelrahman', 'Helmy', 2021, 8),
('Maged', 'Eid', 2020, 9),
('Yara', 'Khalaf', 2019, 10),
('Hadi', 'Karam', 2021, 1),
('Nahla', 'Bassam', 2022, 2),
('Karim', 'Latif', 2020, 3),
('Dalia', 'Tawfik', 2019, 4),
('Ehab', 'Shaker', 2021, 5),
('Gamil', 'Farid', 2020, 6),
('Nour', 'Hakim', 2022, 7),
('Layla', 'Radwan', 2019, 8),
('Hisham', 'Yousef', 2021, 9),
('Wael', 'Nashed', 2022, 10);

