-- ///////////
-- TABLES ////
-- ///////////

-- Drop all CONSTRAINT
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
               N' DROP CONSTRAINT ' + QUOTENAME(name) + N';' + NCHAR(13)
FROM sys.foreign_keys;

EXEC sp_executesql @sql;

DROP TABLE IF EXISTS [StudentAssignmentLogs];
DROP TABLE IF EXISTS [Users];
DROP TABLE IF EXISTS [Students];
DROP TABLE IF EXISTS [StudentActivityLogs];
DROP TABLE IF EXISTS [Teachers];
DROP TABLE IF EXISTS [TeacherStudents];
DROP TABLE IF EXISTS [CourseLevels];
DROP TABLE IF EXISTS [Courses];
DROP TABLE IF EXISTS [StudentCourseRequests];
DROP TABLE IF EXISTS [StudentCourses];
DROP TABLE IF EXISTS [TeacherCourses];
DROP TABLE IF EXISTS [CourseGroups];
DROP TABLE IF EXISTS [StudyMaterials];
DROP TABLE IF EXISTS [StudyMaterialAttachments];
DROP TABLE IF EXISTS [AssignmentTypes];
DROP TABLE IF EXISTS [Assignments];
DROP TABLE IF EXISTS [AssignmentAttachments];
DROP TABLE IF EXISTS [AssignmentCriterias];
DROP TABLE IF EXISTS [StudentAssignments];
DROP TABLE IF EXISTS [StudentAssignmentAttachments];
DROP TABLE IF EXISTS [StudentAssignmentCriterias];