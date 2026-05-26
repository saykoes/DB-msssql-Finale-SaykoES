CREATE TABLE StudentCourseRequests(
StudentCourseRequestId INT IDENTITY(1,1) NOT NULL,
StudentId INT NOT NULL,
CourseId INT NOT NULL,
StudentCourseRequestDateTime DateTime2(3) NOT NULL
	CONSTRAINT DF_StudentCourseRequests_DateTime DEFAULT SYSUTCDATETIME(), -- Auto DateTime
CONSTRAINT PK_StudentCourseRequests PRIMARY KEY (StudentCourseRequestId),
CONSTRAINT FK_StudentCourseRequests_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
CONSTRAINT FK_StudentCourseRequests_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
); 

