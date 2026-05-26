CREATE TABLE Assignments(
AssignmentId INT IDENTITY(1,1) NOT NULL,
CourseGroupId INT NOT NULL,
AssignmentName NVARCHAR(256) NOT NULL,
AssignmentDescription NVARCHAR(MAX) NULL,
AssignmentTypeId INT NOT NULL,
CONSTRAINT PK_Assignments PRIMARY KEY (AssignmentId),
CONSTRAINT FK_Assignments_CourseGroups FOREIGN KEY (CourseGroupId) REFERENCES CourseGroups(CourseGroupId),
CONSTRAINT FK_Assignments_AssignmentTypes FOREIGN KEY (AssignmentTypeId) REFERENCES AssignmentTypes(AssignmentTypeId),
); 

