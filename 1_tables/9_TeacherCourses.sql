CREATE TABLE TeacherCourses(
TeacherCourseId INT IDENTITY(1,1) NOT NULL,
TeacherId INT NOT NULL,
CourseId INT NOT NULL,
CONSTRAINT PK_TeacherCourses PRIMARY KEY (TeacherCourseId),
CONSTRAINT FK_TeacherCourses_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
CONSTRAINT FK_TeacherCourses_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
); 

