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

