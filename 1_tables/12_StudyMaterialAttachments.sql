CREATE TABLE StudyMaterialAttachments(
StudyMaterialAttachmentId INT IDENTITY(1,1) NOT NULL,
StudyMaterialId INT NOT NULL,
StudyMaterialAttachmentName NVARCHAR(256) NOT NULL,
StudyMaterialAttachmentPath NVARCHAR(MAX) NOT NULL,
CONSTRAINT PK_StudyMaterialAttachments PRIMARY KEY (StudyMaterialAttachmentId),
CONSTRAINT FK_StudyMaterialAttachments_StudyMaterials FOREIGN KEY (StudyMaterialId) REFERENCES StudyMaterials(StudyMaterialId),
); 

