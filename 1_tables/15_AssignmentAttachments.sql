CREATE TABLE AssignmentAttachments(
AssignmentAttachmentId INT IDENTITY(1,1) NOT NULL,
AssignmentId INT NOT NULL,
AssignmentAttachmentsName NVARCHAR(256) NOT NULL,
AssignmentAttachmentsPath NVARCHAR(MAX) NOT NULL,
CONSTRAINT PK_AssignmentAttachments PRIMARY KEY (AssignmentAttachmentId),
CONSTRAINT FK_AssignmentAttachments_Assignments FOREIGN KEY (AssignmentId) REFERENCES Assignments(AssignmentId),
); 

