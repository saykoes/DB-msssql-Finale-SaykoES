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
