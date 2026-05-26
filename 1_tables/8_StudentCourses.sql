CREATE TABLE StudentCourses(
StudentCourseId INT IDENTITY(1,1) NOT NULL,
StudentId INT NOT NULL,
CourseId INT NOT NULL,
CONSTRAINT PK_StudentCourses PRIMARY KEY (StudentCourseId),
CONSTRAINT FK_StudentCourses_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
CONSTRAINT FK_StudentCourses_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
); 

