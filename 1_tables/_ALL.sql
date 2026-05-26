CREATE TABLE Users(
UserId INT IDENTITY(1,1) NOT NULL,
UserEmail NVARCHAR(256) NOT NULL,
UserPasswordSalt NVARCHAR(256) NOT NULL,
UserFirstName NVARCHAR(256) NOT NULL,
UserLastName NVARCHAR(256) NOT NULL,
UserProfilePicturePath NVARCHAR(MAX),
CONSTRAINT PK_Users PRIMARY KEY (UserId),
); 

CREATE TABLE Students(
StudentId INT IDENTITY(1,1) NOT NULL,
UserId INT NOT NULL,
CONSTRAINT PK_Stundents PRIMARY KEY (StudentId),
CONSTRAINT FK_Students_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
); 

CREATE TABLE StudentActivityLogs(
StudentActivityLogId INT IDENTITY(1,1) NOT NULL,
StudentId INT NOT NULL,
StudentActivityLog NVARCHAR(MAX) NOT NULL,
StudentActivityLogDateTime DATETIME2(3) NOT NULL
	CONSTRAINT DF_StudentActivityLogs_DateTime DEFAULT SYSUTCDATETIME(), -- Auto DateTime
CONSTRAINT PK_StudentActivityLogs PRIMARY KEY (StudentActivityLogId),
CONSTRAINT FK_StudentActivityLogs_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
); 

CREATE TABLE Teachers(
TeacherId INT IDENTITY(1,1) NOT NULL,
UserId INT NOT NULL,
CONSTRAINT PK_Teachers PRIMARY KEY (TeacherId),
CONSTRAINT FK_Teachers_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
); 

CREATE TABLE TeacherStudents(
TeacherStudentId INT IDENTITY(1,1) NOT NULL,
TeacherId INT NOT NULL,
StudentId INT NOT NULL,
CONSTRAINT PK_TeacherStudents PRIMARY KEY (TeacherStudentId),
CONSTRAINT FK_TeachersStudents_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
CONSTRAINT FK_TeachersStudents_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
); 

CREATE TABLE CourseLevels(
CourseLevelId INT IDENTITY(1,1) NOT NULL,
CourseLevelName NVARCHAR(256) NOT NULL,
CONSTRAINT PK_CourseLevels PRIMARY KEY (CourseLevelId),
);

CREATE TABLE Courses(
CourseId INT IDENTITY(1,1) NOT NULL,
CourseName NVARCHAR(256),
CourseDescription NVARCHAR(MAX),
CourseLevelId INT,
CONSTRAINT PK_Courses PRIMARY KEY (CourseId),
CONSTRAINT FK_Courses_CourseLevels FOREIGN KEY (CourseLevelId) REFERENCES CourseLevels(CourseLevelId),
); 

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

CREATE TABLE StudentCourses(
StudentCourseId INT IDENTITY(1,1) NOT NULL,
StudentId INT NOT NULL,
CourseId INT NOT NULL,
CONSTRAINT PK_StudentCourses PRIMARY KEY (StudentCourseId),
CONSTRAINT FK_StudentCourses_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
CONSTRAINT FK_StudentCourses_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
); 

CREATE TABLE TeacherCourses(
TeacherCourseId INT IDENTITY(1,1) NOT NULL,
TeacherId INT NOT NULL,
CourseId INT NOT NULL,
CONSTRAINT PK_TeacherCourses PRIMARY KEY (TeacherCourseId),
CONSTRAINT FK_TeacherCourses_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
CONSTRAINT FK_TeacherCourses_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
); 

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

CREATE TABLE StudyMaterials(
StudyMaterialId INT IDENTITY(1,1) NOT NULL,
CourseGroupId INT NOT NULL,
StudyMaterialName NVARCHAR(256) NOT NULL,
StudyMaterialDescription NVARCHAR(MAX),
CONSTRAINT PK_StudyMaterials PRIMARY KEY (StudyMaterialId),
CONSTRAINT FK_StudyMaterials_CourseGroups FOREIGN KEY (CourseGroupId) REFERENCES CourseGroups(CourseGroupId),
); 

CREATE TABLE StudyMaterialAttachments(
StudyMaterialAttachmentId INT IDENTITY(1,1) NOT NULL,
StudyMaterialId INT NOT NULL,
StudyMaterialAttachmentName NVARCHAR(256) NOT NULL,
StudyMaterialAttachmentPath NVARCHAR(MAX) NOT NULL,
CONSTRAINT PK_StudyMaterialAttachments PRIMARY KEY (StudyMaterialAttachmentId),
CONSTRAINT FK_StudyMaterialAttachments_StudyMaterials FOREIGN KEY (StudyMaterialId) REFERENCES StudyMaterials(StudyMaterialId),
); 

CREATE TABLE AssignmentTypes(
AssignmentTypeId INT IDENTITY(1,1) NOT NULL,
AssignmentTypeName NVARCHAR(256) NOT NULL,
CONSTRAINT PK_AssignmentTypes PRIMARY KEY (AssignmentTypeId),
);

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

CREATE TABLE AssignmentAttachments(
AssignmentAttachmentId INT IDENTITY(1,1) NOT NULL,
AssignmentId INT NOT NULL,
AssignmentAttachmentsName NVARCHAR(256) NOT NULL,
AssignmentAttachmentsPath NVARCHAR(MAX) NOT NULL,
CONSTRAINT PK_AssignmentAttachments PRIMARY KEY (AssignmentAttachmentId),
CONSTRAINT FK_AssignmentAttachments_Assignments FOREIGN KEY (AssignmentId) REFERENCES Assignments(AssignmentId),
); 

CREATE TABLE AssignmentCriterias(
AssignmentCriteriaId INT IDENTITY(1,1) NOT NULL,
AssignmentId INT NOT NULL,
CriteriaName NVARCHAR(256) NOT NULL,
CriteriaDescription NVARCHAR(MAX),
CriteriaMaxScore DECIMAL(5,2), -- MAX: 999.99
CONSTRAINT PK_AssignmentCriterias PRIMARY KEY (AssignmentCriteriaId),
CONSTRAINT FK_AssignmentCriterias_Assignments FOREIGN KEY (AssignmentId) REFERENCES Assignments(AssignmentId),
CONSTRAINT CK_AssignmentCriterias_MaxScore CHECK (CriteriaMaxScore > 0),
); 

CREATE TABLE StudentAssignments(
StudentAssignmentId INT IDENTITY(1,1) NOT NULL,
StudentId INT NOT NULL,
AssignmentId INT NOT NULL,
StudentAssignmentScore DECIMAL(5,2) NULL,
StudentAssignmentDateTimeCompleted DateTime2(3) NULL,
CONSTRAINT PK_StudentAssignments PRIMARY KEY (StudentAssignmentId),
CONSTRAINT FK_StudentAssignments_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
CONSTRAINT FK_StudentAssignments_Assignments FOREIGN KEY (AssignmentId) REFERENCES Assignments(AssignmentId),
); 

CREATE TABLE StudentAssignmentAttachments(
StudentAssignmentAttachmentId INT IDENTITY(1,1) NOT NULL,
StudentAssignmentId INT NOT NULL,
StudentAssignmentAttachmentName NVARCHAR(256) NOT NULL,
StudentAssignmentAttachmentPath NVARCHAR(MAX) NOT NULL,
CONSTRAINT PK_StudentAssignmentAttachments PRIMARY KEY (StudentAssignmentAttachmentId),
CONSTRAINT FK_StudentAssignmentAttachments_StudentAssignments FOREIGN KEY (StudentAssignmentId) REFERENCES StudentAssignments(StudentAssignmentId),
); 

CREATE TABLE StudentAssignmentCriterias(
StudentAssignmentCriteriaId INT IDENTITY(1,1) NOT NULL,
StudentAssignmentId INT NOT NULL,
AssignmentCriteriaId INT NOT NULL,
StudentAssignmentCriteriaScore DECIMAL(5,2) NULL,
CONSTRAINT PK_StudentAssignmentCriterias PRIMARY KEY (StudentAssignmentCriteriaId),
CONSTRAINT FK_StudentAssignmentCriterias_StudentAssignments FOREIGN KEY (StudentAssignmentId) REFERENCES StudentAssignments(StudentAssignmentId),
CONSTRAINT FK_StudentAssignmentCriterias_AssignmentCriterias FOREIGN KEY (AssignmentCriteriaId) REFERENCES AssignmentCriterias(AssignmentCriteriaId),
); 

CREATE TABLE StudentAssignmentLogs(
StudentAssignmentLogId INT IDENTITY(1,1) NOT NULL,
StudentAssignmentId INT NOT NULL,
StudentAssignmentLog NVARCHAR(MAX) NOT NULL,
StudentAssignmentLogDateTime DATETIME2(3) NOT NULL
	CONSTRAINT DF_StudentAssignmentsLogs_DateTime DEFAULT SYSUTCDATETIME(), -- Auto DateTime
CONSTRAINT PK_StudentAssignmentLogs PRIMARY KEY (StudentAssignmentLogId),
CONSTRAINT FK_StudentAssignmentLogs_StudentAssignments FOREIGN KEY (StudentAssignmentId) REFERENCES StudentAssignments(StudentAssignmentId),
); 

