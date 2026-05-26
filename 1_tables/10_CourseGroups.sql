CREATE TABLE CourseGroups(
CourseGroupId INT IDENTITY(1,1) NOT NULL,
CourseId INT NOT NULL,
ParentCourseGroupId INT NULL,
CourseGroupName NVARCHAR(256),
CourseGroupDescription NVARCHAR(MAX),
CONSTRAINT PK_CourseGroups PRIMARY KEY (CourseGroupId),
CONSTRAINT FK_CourseGroups_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
CONSTRAINT FK_CourseGroups_ParentCourseGroups FOREIGN KEY (ParentCourseGroupId) REFERENCES CourseGroups(CourseGroupId),
); 

