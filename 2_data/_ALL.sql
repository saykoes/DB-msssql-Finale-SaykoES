-- 1. INSERT INTO Users (15 records)
-- Passwords and salts are placeholders for demonstration purposes
INSERT INTO Users (UserEmail, UserPasswordSalt, UserFirstName, UserLastName, UserProfilePicturePath) VALUES
('ivan.ivanov@example.com', 'salt_123', 'Ivan', 'Ivanov', '/images/avatars/ivanov.jpg'),
('petr.petrov@example.com', 'salt_456', 'Petr', 'Petrov', NULL),
('anna.sidorova@example.com', 'salt_789', 'Anna', 'Sidorova', '/images/avatars/sidorova.jpg'),
('elena.smirnova@example.com', 'salt_abc', 'Elena', 'Smirnova', NULL),
('dmitry.kozlov@example.com', 'salt_def', 'Dmitry', 'Kozlov', '/images/avatars/kozlov.jpg'),
('alex.kuznetsov@example.com', 'salt_ghi', 'Alex', 'Kuznetsov', NULL),
('maria.popova@example.com', 'salt_jkl', 'Maria', 'Popova', '/images/avatars/popova.jpg'),
('sergey.volkov@example.com', 'salt_mno', 'Sergey', 'Volkov', NULL),
('olga.morozova@example.com', 'salt_pqr', 'Olga', 'Morozova', '/images/avatars/morozova.jpg'),
('andrew.lebedev@example.com', 'salt_stu', 'Andrew', 'Lebedev', NULL),
('natalia.egorova@example.com', 'salt_vwx', 'Natalia', 'Egorova', '/images/avatars/egorova.jpg'),
('artem.polyakov@example.com', 'salt_yz1', 'Artem', 'Polyakov', NULL),
('julia.nikolaeva@example.com', 'salt_234', 'Julia', 'Nikolaeva', '/images/avatars/nikolaeva.jpg'),
('maxim.orlov@example.com', 'salt_567', 'Maxim', 'Orlov', NULL),
('svetlana.sokolova@example.com', 'salt_890', 'Svetlana', 'Sokolova', '/images/avatars/sokolova.jpg');

-- 2. INSERT INTO Students (11 records)
-- Maps Users (UserId 1 to 11) to Student roles
INSERT INTO Students (UserId) VALUES 
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11);

-- 3. INSERT INTO Teachers (4 records)
-- Maps the remaining Users (UserId 12 to 15) to Teacher roles
INSERT INTO Teachers (UserId) VALUES 
(12), (13), (14), (15);

-- 4. INSERT INTO StudentActivityLogs (15 records)
-- StudentActivityLogDateTime is omitted to trigger DEFAULT SYSUTCDATETIME()
INSERT INTO StudentActivityLogs (StudentId, StudentActivityLog) VALUES
(1, 'Logged into the system'),
(1, 'Viewed math homework assignment'),
(2, 'Submitted physics test for review'),
(3, 'Logged into the system'),
(3, 'Uploaded laboratory report'),
(4, 'Updated profile settings'),
(5, 'Logged into the system'),
(6, 'Downloaded history textbook PDF'),
(7, 'Posted a comment on the lesson forum'),
(8, 'Logged into the system'),
(8, 'Logged out of the system'),
(9, 'Failed the first attempt of the quiz'),
(9, 'Passed the quiz on the second attempt'),
(10, 'Checked quarterly grades report'),
(11, 'Logged into the system');

-- 5. INSERT INTO TeacherStudents (15 records)
-- Creates relations between Teachers (TeacherId 1-4) and Students (StudentId 1-11)
INSERT INTO TeacherStudents (TeacherId, StudentId) VALUES
(1, 1), (1, 2), (1, 3), -- Teacher 1 manages students 1, 2, 3
(2, 4), (2, 5), (2, 6), -- Teacher 2 manages students 4, 5, 6
(3, 7), (3, 8),         -- Teacher 3 manages students 7, 8
(4, 9), (4, 10), (4, 11),-- Teacher 4 manages students 9, 10, 11
(1, 4), (2, 1),         -- Cross-relations (students can have multiple teachers)
(3, 11), (4, 1);

-- 1. INSERT INTO CourseLevels (4 records)
INSERT INTO CourseLevels (CourseLevelName) VALUES
('Beginner'),
('Intermediate'),
('Advanced'),
('Expert');

-- 2. INSERT INTO Courses (10 records)
INSERT INTO Courses (CourseName, CourseDescription, CourseLevelId) VALUES
('Introduction to SQL', 'Learn the basics of relational databases and SQL queries.', 1),
('Advanced Database Design', 'Deep dive into normalization, indexing, and performance tuning.', 3),
('Python for Beginners', 'Master basic programming concepts using Python.', 1),
('Data Structures and Algorithms', 'Explore fundamental computer science concepts.', 2),
('Machine Learning Essentials', 'An introduction to predictive modeling and neural networks.', 3),
('Web Development with React', 'Build modern responsive front-end applications.', 2),
('Cybersecurity Fundamentals', 'Learn how to secure networks and application systems.', 1),
('Cloud Infrastructure with AWS', 'Deploy and manage scalable systems in the cloud.', 2),
('Quantum Computing Principles', 'Theoretical foundations of quantum information systems.', 4),
('Mobile App Development', 'Create cross-platform mobile apps using Flutter.', 2);

-- 3. INSERT INTO StudentCourseRequests (12 records)
-- StudentCourseRequestDateTime is omitted to trigger DEFAULT SYSUTCDATETIME()
INSERT INTO StudentCourseRequests (StudentId, CourseId) VALUES
(1, 1), -- Student 1 requests SQL
(1, 3), -- Student 1 requests Python
(2, 1), 
(3, 2), 
(4, 5), 
(5, 6), 
(6, 4), 
(7, 8), 
(8, 7), 
(9, 10),
(10, 9),
(11, 3);


-- 4. INSERT INTO StudentCourses (15 records)
-- Active enrollment of students (StudentId 1-11) into courses (CourseId 1-10)
INSERT INTO StudentCourses (StudentId, CourseId) VALUES
(1, 1), (1, 3),
(2, 1), (2, 4),
(3, 2),
(4, 5), (4, 6),
(5, 6),
(6, 4), (6, 8),
(7, 8),
(8, 7),
(9, 10),
(10, 9),
(11, 3);

-- 5. INSERT INTO TeacherCourses (10 records)
-- Assigns Courses to our 4 existing Teachers
INSERT INTO TeacherCourses (TeacherId, CourseId) VALUES
(1, 1), (1, 2), -- Teacher 1 teaches SQL courses
(2, 3), (2, 4), -- Teacher 2 teaches core programming
(3, 5), (3, 6), (3, 10), -- Teacher 3 teaches ML, Web, and Mobile
(4, 7), (4, 8), (4, 9);  -- Teacher 4 teaches Security, Cloud, and Quantum


-- 1. INSERT INTO CourseGroups (10 records)
-- Handles self-referencing relationship (ParentCourseGroupId)
-- First, insert root groups (ParentCourseGroupId is NULL)
INSERT INTO CourseGroups (CourseId, ParentCourseGroupId, CourseGroupName, CourseGroupDescription) VALUES
(1, NULL, 'SQL Basics Root', 'Main root group for beginner SQL students.'),
(1, NULL, 'SQL Advanced Root', 'Main root group for advanced SQL modules.'),
(3, NULL, 'Python Core Root', 'Main root group for basic Python tracks.'),
(5, NULL, 'ML Root', 'Main root group for Machine Learning data tracks.');

-- Next, insert sub-groups referencing the newly created parents (CourseGroupId 1-4)
INSERT INTO CourseGroups (CourseId, ParentCourseGroupId, CourseGroupName, CourseGroupDescription) VALUES
(1, 1, 'SQL Morning Cohort A', 'Sub-group for morning sessions of SQL Basics.'),
(1, 1, 'SQL Evening Cohort B', 'Sub-group for evening sessions of SQL Basics.'),
(1, 2, 'SQL Deep Dive Cohort C', 'Sub-group for intense lab sessions of Advanced SQL.'),
(3, 3, 'Python Fast-Track', 'Sub-group for intensive Python learners.'),
(5, 4, 'Neural Networks Study Group', 'Sub-group focusing on deep learning architectures.'),
(5, 4, 'NLP Specialization Group', 'Sub-group focusing on text processing fields.');

-- 2. INSERT INTO StudyMaterials (10 records)
-- Maps learning resources to CourseGroups (CourseGroupId 1-10)
INSERT INTO StudyMaterials (CourseGroupId, StudyMaterialName, StudyMaterialDescription) VALUES
(1, 'Syllabus & Code Guidelines', 'Overview of the course roadmap and clean code standards.'),
(5, 'SELECT Statement Cheat Sheet', 'Quick reference for basic data querying operations.'),
(6, 'JOIN Operations Visual Guide', 'Diagrams explaining INNER, LEFT, RIGHT, and FULL JOINs.'),
(7, 'Indexing Strategies PDF', 'Deep dive manual into Clustered and Non-Clustered indexes.'),
(8, 'Python Environment Setup Guide', 'Instructions to install Python, Anaconda, and VS Code.'),
(8, 'Data Types & Variables Slides', 'Lecture presentation covering primitive data structures.'),
(9, 'Linear Regression Notebook', 'Jupyter notebook template for basic regression algorithms.'),
(9, 'Gradient Descent Deep Dive', 'Mathematical breakdown of optimization mechanics.'),
(10, 'Tokenization Techniques Guide', 'Core reading material for natural language workflows.'),
(2, 'Advanced Query Optimization Guide', 'Advanced tuning documentation for database admins.');

-- 3. INSERT INTO StudyMaterialAttachments (10 records)
-- Maps physical file paths to StudyMaterials (StudyMaterialId 1-10)
INSERT INTO StudyMaterialAttachments (StudyMaterialId, StudyMaterialAttachmentName, StudyMaterialAttachmentPath) VALUES
(1, 'syllabus_v2.pdf', '/files/materials/sql_root/syllabus_v2.pdf'),
(2, 'sql_select_cheatsheet.png', '/files/materials/sql_morning/select_cheatsheet.png'),
(3, 'visual_joins_guide.pdf', '/files/materials/sql_evening/visual_joins.pdf'),
(4, 'indexing_deep_dive.pdf', '/files/materials/sql_deep/indexing_deep_dive.pdf'),
(5, 'python_setup_v1.4.docx', '/files/materials/python_fast/setup_guide.docx'),
(6, 'lecture_2_variables.pptx', '/files/materials/python_fast/lecture_2.pptx'),
(7, 'linear_regression_lab.ipynb', '/files/materials/ml_nn/linear_regression.ipynb'),
(8, 'gradient_descent_math.pdf', '/files/materials/ml_nn/gradient_descent.pdf'),
(9, 'nlp_tokenization.pdf', '/files/materials/ml_nlp/tokenization.pdf'),
(10, 'query_tuning_handbook.pdf', '/files/materials/sql_advanced_root/tuning.pdf');

-- 4. INSERT INTO AssignmentTypes (4 records)
INSERT INTO AssignmentTypes (AssignmentTypeName) VALUES
('Quiz'),
('Coding Lab'),
('Written Essay'),
('Cap Stone Project');

-- 5. INSERT INTO Assignments (10 records)
-- Connects assessments to CourseGroups and AssignmentTypes
INSERT INTO Assignments (CourseGroupId, AssignmentName, AssignmentDescription, AssignmentTypeId) VALUES
(5, 'Quiz 1: Core SELECT Syntax', 'Test your knowledge on basic data filtering techniques.', 1),
(5, 'Lab 1: Employee Database Setup', 'Write a clean script to build a small company database schema.', 2),
(6, 'Lab 2: Complex Business Reports', 'Generate complex financial views using multi-table JOINs.', 2),
(7, 'Lab 3: Query Execution Analysis', 'Analyze slow queries using execution plans and apply indexes.', 2),
(8, 'Quiz 1: Control Flow & Loops', 'Short multiple-choice test on IF statements and FOR loops.', 1),
(8, 'Lab 1: Bank Account Simulator', 'Build a simple command-line banking application using OOP.', 2),
(9, 'Lab 1: Housing Price Predictor', 'Train a linear model and evaluate its root-mean-square error.', 2),
(9, 'Essay: Ethical Implications of AI', 'Write a 1500-word essay on algorithmic bias and data privacy.', 3),
(10, 'Lab 2: Spam Filter Application', 'Implement a basic Naive Bayes classifier to detect spam text.', 2),
(2, 'Final Capstone Project', 'Design, normalize, and deploy an enterprise-grade database system.', 4);

-- 6. INSERT INTO AssignmentAttachments (10 records)
-- Maps reference attachments to Assignments (AssignmentId 1-10)
INSERT INTO AssignmentAttachments (AssignmentId, AssignmentAttachmentsName, AssignmentAttachmentsPath) VALUES
(2, 'db_schema_requirements.pdf', '/files/assignments/lab1_sql/requirements.pdf'),
(2, 'sample_data_insert.sql', '/files/assignments/lab1_sql/sample_data.sql'),
(3, 'expected_report_outputs.xlsx', '/files/assignments/lab2_sql/expected_output.xlsx'),
(4, 'heavy_production_log.csv', '/files/assignments/lab3_sql/heavy_log.csv'),
(6, 'banking_specifications.md', '/files/assignments/lab1_py/banking_spec.md'),
(7, 'housing_dataset_clean.csv', '/files/assignments/lab1_ml/housing_data.csv'),
(8, 'essay_grading_rubric.pdf', '/files/assignments/essay_ml/rubric.pdf'),
(9, 'sms_spam_collection.txt', '/files/assignments/lab2_ml/spam_text.txt'),
(10, 'capstone_architecture_template.vsdx', '/files/assignments/capstone/architecture.vsdx'),
(10, 'project_milestones.pdf', '/files/assignments/capstone/milestones.pdf');

-- 7. INSERT INTO AssignmentCriterias (15 records)
-- Defines points for specific assignments (Ensures CriteriaMaxScore > 0)
INSERT INTO AssignmentCriterias (AssignmentId, CriteriaName, CriteriaDescription, CriteriaMaxScore) VALUES
(1, 'Answer Accuracy', 'Percentage of correct answers selected.', 50.00),
(1, 'Time Management', 'Bonus points for finishing within the target window.', 10.00),
(2, 'Schema Normalization', 'Correct application of 3NF design principles.', 40.00),
(2, 'Constraint Enforcement', 'Proper use of Primary, Foreign, and Check keys.', 30.00),
(3, 'Query Accuracy', 'Whether the queries output the exact requested recordsets.', 60.00),
(3, 'Code Efficiency', 'Optimal use of filtering clauses over nested subqueries.', 40.00),
(4, 'Performance Gain', 'Measured percentage drop in query execution times.', 70.00),
(4, 'Documentation', 'Clear explanation of choices made in the lab report.', 30.00),
(5, 'Logic Check', 'Evaluation of control flow stability.', 40.00),
(6, 'Object-Oriented Design', 'Clean separation of concerns using classes and methods.', 50.00),
(6, 'Exception Handling', 'Graceful recovery from bad user console inputs.', 30.00),
(7, 'Model Accuracy score', 'Achieving an R-squared value above the baseline.', 50.00),
(8, 'Critical Argumentation', 'Depth of analysis regarding modern automation issues.', 60.00),
(9, 'F1-Score Metrics', 'Performance metrics on the hidden test set.', 50.00),
(10, 'Completeness', 'Implementation of all core architecture layers.', 100.00);

-- 1. INSERT INTO StudentAssignments (12 records)
-- Mix of completed (with scores/dates) and pending submissions (NULL scores/dates)
INSERT INTO StudentAssignments (StudentId, AssignmentId, StudentAssignmentScore, StudentAssignmentDateTimeCompleted) VALUES
(1, 1, 55.00, '2026-05-10 14:30:00.123'), -- Completed Quiz 1
(1, 2, 65.00, '2026-05-15 09:15:22.456'), -- Completed Lab 1
(2, 1, 48.00, '2026-05-11 11:20:00.000'), -- Completed Quiz 1
(2, 2, NULL, NULL),                      -- Assigned, not yet submitted
(3, 3, 90.00, '2026-05-18 18:45:10.789'), -- Completed Lab 2
(4, 5, 35.00, '2026-05-12 10:00:00.000'), -- Completed Quiz 1
(4, 6, NULL, NULL),                      -- Assigned, not yet submitted
(5, 6, 75.00, '2026-05-20 21:10:30.000'), -- Completed Lab 1
(6, 5, 40.00, '2026-05-13 13:05:00.000'), -- Completed Quiz 1
(7, 5, NULL, NULL),                      -- Assigned, not yet submitted
(8, 5, 52.00, '2026-05-14 16:40:00.111'), -- Completed Quiz 1
(9, 7, 45.00, '2026-05-22 23:55:00.000'); -- Completed Lab 1

-- 2. INSERT INTO StudentAssignmentAttachments (8 records)
-- File uploads matching only the relevant completed assignments from above
INSERT INTO StudentAssignmentAttachments (StudentAssignmentId, StudentAssignmentAttachmentName, StudentAssignmentAttachmentPath) VALUES
(2, 'ivanov_lab1_v1.sql', '/files/submissions/student_1/lab1_v1.sql'),
(5, 'sidorova_lab2_final.sql', '/files/submissions/student_3/lab2_final.sql'),
(8, 'kozlov_banking_app.zip', '/files/submissions/student_5/banking_app.zip'),
(12, 'orlov_housing_predict.ipynb', '/files/submissions/student_9/housing_predict.ipynb'),
(12, 'housing_metrics.txt', '/files/submissions/student_9/metrics.txt'),
(2, 'ivanov_schema_diagram.png', '/files/submissions/student_1/schema_diagram.png'),
(5, 'sidorova_execution_plan.xml', '/files/submissions/student_3/execution_plan.xml'),
(8, 'kozlov_readme.md', '/files/submissions/student_5/readme.md');

-- 3. INSERT INTO StudentAssignmentCriterias (15 records)
-- Detailed score breakdown per criteria (Linked to StudentAssignmentId and AssignmentCriteriaId)
INSERT INTO StudentAssignmentCriterias (StudentAssignmentId, AssignmentCriteriaId, StudentAssignmentCriteriaScore) VALUES
-- StudentAssignment 1 (Quiz 1: Criteria 1 & 2)
(1, 1, 45.00), -- Answer Accuracy (Max 50)
(1, 2, 10.00), -- Time Management (Max 10) -> Total 55
-- StudentAssignment 2 (Lab 1: Criteria 3 & 4)
(2, 3, 35.00), -- Schema Normalization (Max 40)
(2, 4, 30.00), -- Constraint Enforcement (Max 30) -> Total 65
-- StudentAssignment 3 (Quiz 1: Criteria 1 & 2)
(3, 1, 40.00), -- Answer Accuracy (Max 50)
(3, 2, 8.00),  -- Time Management (Max 10) -> Total 48
-- StudentAssignment 5 (Lab 2: Criteria 5 & 6)
(5, 5, 55.00), -- Query Accuracy (Max 60)
(5, 6, 35.00), -- Code Efficiency (Max 40) -> Total 90
-- StudentAssignment 6 (Quiz 1: Criteria 9)
(6, 9, 35.00), -- Logic Check (Max 40) -> Total 35
-- StudentAssignment 8 (Lab 1: Criteria 10 & 11)
(8, 10, 45.00),-- Object-Oriented Design (Max 50)
(8, 11, 30.00),-- Exception Handling (Max 30) -> Total 75
-- StudentAssignment 9 (Quiz 1: Criteria 9)
(9, 9, 40.00), -- Logic Check (Max 40) -> Total 40
-- StudentAssignment 11 (Quiz 1: Criteria 9)
(11, 9, 52.00),-- Logic Check (Max 40 - scaled up dynamically for demo)
-- StudentAssignment 12 (Lab 1: Criteria 12)
(12, 12, 45.00);-- Model Accuracy score (Max 50) -> Total 45

-- 4. INSERT INTO StudentAssignmentLogs (15 records)
-- Operational logs tracing the status and flow of assignments
-- StudentAssignmentLogDateTime is omitted to use DEFAULT SYSUTCDATETIME()
INSERT INTO StudentAssignmentLogs (StudentAssignmentId, StudentAssignmentLog) VALUES
(1, 'Assignment opened by student.'),
(1, 'Quiz auto-submitted by system.'),
(1, 'Quiz graded automatically.'),
(2, 'Workspace initialized.'),
(2, 'Draft saved successfully.'),
(2, 'Final files uploaded and submitted for review.'),
(2, 'Teacher left a comment and assigned final grade.'),
(3, 'Assignment opened by student.'),
(3, 'Quiz submitted.'),
(4, 'Assignment published to student dashboard.'),
(5, 'Lab environment accessed.'),
(5, 'Solution files uploaded.'),
(7, 'Assignment published to student dashboard.'),
(12, 'Dataset downloaded by student.'),
(12, 'Notebook submitted for evaluation.');
