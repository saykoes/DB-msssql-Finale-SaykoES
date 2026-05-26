CREATE TABLE Courses(
CourseId INT IDENTITY(1,1) NOT NULL,
CourseName NVARCHAR(256),
CourseDescription NVARCHAR(MAX),
CourseLevelId INT,
CONSTRAINT PK_Courses PRIMARY KEY (CourseId),
CONSTRAINT FK_Courses_CourseLevels FOREIGN KEY (CourseLevelId) REFERENCES CourseLevels(CourseLevelId),
); 

