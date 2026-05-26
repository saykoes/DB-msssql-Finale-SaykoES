CREATE TABLE StudentAssignmentAttachments(
StudentAssignmentAttachmentId INT IDENTITY(1,1) NOT NULL,
StudentAssignmentId INT NOT NULL,
StudentAssignmentAttachmentName NVARCHAR(256) NOT NULL,
StudentAssignmentAttachmentPath NVARCHAR(MAX) NOT NULL,
CONSTRAINT PK_StudentAssignmentAttachments PRIMARY KEY (StudentAssignmentAttachmentId),
CONSTRAINT FK_StudentAssignmentAttachments_StudentAssignments FOREIGN KEY (StudentAssignmentId) REFERENCES StudentAssignments(StudentAssignmentId),
); 

