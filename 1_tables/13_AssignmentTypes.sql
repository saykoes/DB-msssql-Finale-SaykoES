CREATE TABLE AssignmentTypes(
AssignmentTypeId INT IDENTITY(1,1) NOT NULL,
AssignmentTypeName NVARCHAR(256) NOT NULL,
CONSTRAINT PK_AssignmentTypes PRIMARY KEY (AssignmentTypeId),
);