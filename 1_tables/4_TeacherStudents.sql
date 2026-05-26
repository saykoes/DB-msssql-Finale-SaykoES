CREATE TABLE TeacherStudents(
TeacherStudentId INT IDENTITY(1,1) NOT NULL,
TeacherId INT NOT NULL,
StudentId INT NOT NULL,
CONSTRAINT PK_TeacherStudents PRIMARY KEY (TeacherStudentId),
CONSTRAINT FK_TeachersStudents_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
CONSTRAINT FK_TeachersStudents_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
); 

