CREATE TABLE StudentAssignmentCriterias(
StudentAssignmentCriteriaId INT IDENTITY(1,1) NOT NULL,
StudentAssignmentId INT NOT NULL,
AssignmentCriteriaId INT NOT NULL,
StudentAssignmentCriteriaScore DECIMAL(5,2) NULL,
CONSTRAINT PK_StudentAssignmentCriterias PRIMARY KEY (StudentAssignmentCriteriaId),
CONSTRAINT FK_StudentAssignmentCriterias_StudentAssignments FOREIGN KEY (StudentAssignmentId) REFERENCES StudentAssignments(StudentAssignmentId),
CONSTRAINT FK_StudentAssignmentCriterias_AssignmentCriterias FOREIGN KEY (AssignmentCriteriaId) REFERENCES AssignmentCriterias(AssignmentCriteriaId),
); 

