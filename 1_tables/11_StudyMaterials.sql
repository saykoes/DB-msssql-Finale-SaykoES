CREATE TABLE StudyMaterials(
StudyMaterialId INT IDENTITY(1,1) NOT NULL,
CourseGroupId INT NOT NULL,
StudyMaterialName NVARCHAR(256) NOT NULL,
StudyMaterialDescription NVARCHAR(MAX),
CONSTRAINT PK_StudyMaterials PRIMARY KEY (StudyMaterialId),
CONSTRAINT FK_StudyMaterials_CourseGroups FOREIGN KEY (CourseGroupId) REFERENCES CourseGroups(CourseGroupId),
); 

