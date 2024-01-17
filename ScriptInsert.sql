-- Insertion des degrés
INSERT INTO ent.Degrees (name) VALUES ('INFO');
INSERT INTO ent.Degrees (name) VALUES ('GACO');
INSERT INTO ent.Degrees (name) VALUES ('QLIO');
INSERT INTO ent.Degrees (name) VALUES ('INFO-COM');

SET search_path TO ent;
-- Insertion des utilisateurs
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin,isTTManager, id_Role) VALUES ('admin', 'password', 'Prénom', 'Nom', 'admin@example.com', true,true, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin,isTTManager, id_Role) VALUES ('responsable_edt', 'password', 'Prénom', 'Nom', 'responsable_edt@example.com', false,true, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin,isTTManager, id_Role) VALUES ('etudiant1', 'password', 'Prénom', 'Nom', 'etudiant1@example.com', false,false, 1);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin,isTTManager, id_Role) VALUES ('etudiant2', 'password', 'Prénom', 'Nom', 'etudiant2@example.com', false,false, 1);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin,isTTManager, id_Role) VALUES ('enseignant1', 'password', 'Mario', 'CATALDI', 'enseignant1@example.com', false,true, 2);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin,isTTManager, id_Role) VALUES ('enseignant2', 'password', 'Amelie', 'GOLVEN', 'enseignant2@example.com', true,false, 2);

-- Insertion des enseignants
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('MC', 'A1-07', 5);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('AGO', 'A1-07', 6);

-- Insertion des promotions
INSERT INTO Promotions (year, level, id_Degree) VALUES (2022, 3, 1);
INSERT INTO Promotions (year, level, id_Degree) VALUES (2022, 1, 2);

-- Insertion des formations
INSERT INTO Trainings (name, id_Promotion,semester) VALUES ('Parcours A', 1,1);
INSERT INTO Trainings (name, id_Promotion,semester) VALUES ('Parcours C', 1,1);
INSERT INTO Trainings (name, id_Promotion,semester) VALUES ('Parcours Initial', 2,1);

-- Insertion des ressources
INSERT INTO Resources (name, id_Training, color) VALUES ('Anglais', 1, '#40E0D0');
INSERT INTO Resources (name, id_Training, color) VALUES ('Communication', 1, '#800080');
INSERT INTO Resources (name, id_Training, color) VALUES ('Modélisations', 1 , '#FA8072');
INSERT INTO Resources (name, id_Training, color) VALUES ('Analyse de donnés', 2, '#FFD700');
INSERT INTO Resources (name, id_Training, color) VALUES ('IA', 2, '#E6E6FA');
INSERT INTO Resources (name, id_Training, color) VALUES ('NoSQL', 2, '#808000');
INSERT INTO Resources (name, id_Training, color) VALUES ('Culture juridique', 3, '#00FFFF');
INSERT INTO Resources (name, id_Training, color) VALUES ('Langue vivante 1', 3, '#4B0082');
INSERT INTO Resources (name, id_Training, color) VALUES ('Fondamentaux du marketing', 3, '#FF7F50');

-- Insertion des TD
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 1, 1);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDB', 1, 2);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 2, 3);

-- Insertion des TP
INSERT INTO TP (name, id_Td) VALUES ('TPA1', 1);
INSERT INTO TP (name, id_Td) VALUES ('TPA2', 1);
INSERT INTO TP (name, id_Td) VALUES ('TPA', 2);
INSERT INTO TP (name, id_Td) VALUES ('TPA', 3);

-- Insertion des matériaux
INSERT INTO Materials (equipment) VALUES ('Ordinateur portable');
INSERT INTO Materials (equipment) VALUES ('Grand écran');
INSERT INTO Materials (equipment) VALUES ('Ordinateur fixe');
INSERT INTO Materials (equipment) VALUES ('Vidéoprojecteur');

-- Insertion des classes
INSERT INTO Classroom (name, capacity) VALUES ('A2-05', 30);
INSERT INTO Classroom (name, capacity) VALUES ('A2-04', 15);
INSERT INTO Classroom (name, capacity) VALUES ('Amphi 1', 100);
INSERT INTO Classroom (name, capacity) VALUES ('Amphi 2', 100);

-- Insertion des matériaux dans les salles
INSERT INTO CONTAINS (id_materials, id_classroom, quantity) VALUES (1, 1, 30);
INSERT INTO CONTAINS (id_materials, id_classroom, quantity) VALUES (4, 1, 1);
INSERT INTO CONTAINS (id_materials, id_classroom, quantity) VALUES (3, 2, 30);
INSERT INTO CONTAINS (id_materials, id_classroom, quantity) VALUES (4, 2, 1);
INSERT INTO CONTAINS (id_materials, id_classroom, quantity) VALUES (4, 3, 1);
INSERT INTO CONTAINS (id_materials, id_classroom, quantity) VALUES (4, 4, 1);

-- Insertion des cours
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Training) VALUES ('09:00', '10:00', '2023-12-15', false, 1, NULL, NULL, 1, NULL);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Training) VALUES ('10:00', '11:00', '2023-12-15', false, 2, NULL, NULL, 1, NULL);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Training) VALUES ('13:00', '15:00', '2023-12-15', false, 3, NULL, NULL, NULL, 1);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Training) VALUES ('13:00', '15:00', '2023-12-15', true, 4, NULL, NULL, NULL, 2);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Training) VALUES ('09:00', '16:00', '2023-12-16', false, 7, NULL, NULL, 2, NULL);

-- Isertion des salles dans les cours
INSERT INTO Courses_Classrooms (id_Course, id_Classroom) VALUES (1, 3);
INSERT INTO Courses_Classrooms (id_Course, id_Classroom) VALUES (2, 3);
INSERT INTO Courses_Classrooms (id_Course, id_Classroom) VALUES (3, 1);
INSERT INTO Courses_Classrooms (id_Course, id_Classroom) VALUES (3, 2);
INSERT INTO Courses_Classrooms (id_Course, id_Classroom) VALUES (4, 3);
INSERT INTO Courses_Classrooms (id_Course, id_Classroom) VALUES (5, 4);

-- Isertion des enseignants dans les cours
INSERT INTO Courses_Teachers (id_Course, id_Teacher) VALUES (1, 1);
INSERT INTO Courses_Teachers (id_Course, id_Teacher) VALUES (2, 1);
INSERT INTO Courses_Teachers (id_Course, id_Teacher) VALUES (3, 1);
INSERT INTO Courses_Teachers (id_Course, id_Teacher) VALUES (4, 2);
INSERT INTO Courses_Teachers (id_Course, id_Teacher) VALUES (5, 1);
INSERT INTO Courses_Teachers (id_Course, id_Teacher) VALUES (5, 2);

-- Insertion des étudiants
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES ('12345678','7894558A03', true, 3, 1, 1, 1);
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES ('87654321','3216549J05', false, 4, 3, 4, 2);

-- Insertion des absences
INSERT INTO Absences (id_Student, id_Course, reason, document, justify) VALUES (1, 1, 'COVID-19', NULL, true);
INSERT INTO Absences (id_Student, id_Course, reason, document, justify) VALUES (1, 2, 'COVID-19', NULL, true);

-- Insertion des logs
INSERT INTO Logs (id_User, modification) VALUES (1, 'Ajout de l utilisateur étudiant1');
INSERT INTO Logs (id_User, modification) VALUES (1, 'Ajout de l utilisateur étudiant2');

-- Insertion des rappels
INSERT INTO Reminders (id_User, title, reminder_text, reminder_date) VALUES (3, 'DEVOIR', 'Finir le devoir de modélisation', '2023-12-15 09:00:00');
INSERT INTO Reminders (id_User, title, reminder_text, reminder_date) VALUES (1, 'RÉUNION', 'Rappel pour la réunion', '2023-12-26 13:00:00');
