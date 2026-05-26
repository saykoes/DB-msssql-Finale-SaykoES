CREATE TABLE StudentActivityLogs(
StudentActivityLogId INT IDENTITY(1,1) NOT NULL,
StudentId INT NOT NULL,
StudentActivityLog NVARCHAR(MAX) NOT NULL,
StudentActivityLogDateTime DATETIME2(3) NOT NULL
	CONSTRAINT DF_StudentActivityLogs_DateTime DEFAULT SYSUTCDATETIME(), -- Auto DateTime
CONSTRAINT PK_StudentActivityLogs PRIMARY KEY (StudentActivityLogId),
CONSTRAINT FK_StudentActivityLogs_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
); 

