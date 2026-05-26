CREATE TABLE StudentAssignmentLogs(
StudentAssignmentLogId INT IDENTITY(1,1) NOT NULL,
StudentAssignmentId INT NOT NULL,
StudentAssignmentLog NVARCHAR(MAX) NOT NULL,
StudentAssignmentLogDateTime DATETIME2(3) NOT NULL
	CONSTRAINT DF_StudentAssignmentsLogs_DateTime DEFAULT SYSUTCDATETIME(), -- Auto DateTime
CONSTRAINT PK_StudentAssignmentLogs PRIMARY KEY (StudentAssignmentLogId),
CONSTRAINT FK_StudentAssignmentLogs_StudentAssignments FOREIGN KEY (StudentAssignmentId) REFERENCES StudentAssignments(StudentAssignmentId),
); 

