SET search_path TO ent;
-- Insertion des degrés
INSERT INTO Degrees (name) VALUES ('INFO');
INSERT INTO Degrees (name) VALUES ('GAGO');
INSERT INTO Degrees (name) VALUES ('CLIO');
INSERT INTO Degrees (name) VALUES ('INFOCOM');

-- Insertion des utilisateurs
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('admin', 'password', 'Admin', 'Admin', 'admin@example.com', true, 1);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('admin2', 'password', 'Admin2', 'Admin2', 'admin2@example.com', true, 1);

INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('user', 'password', 'User', 'User', 'user@example.com', false, 2);

INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('student', 'password', 'Yanis', 'Hamani', 'yanishamani@example.com', true, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('student2', 'password', 'John', 'Doe', 'john.doe@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('student3', 'password', 'Jane', 'Smith', 'jane.smith@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('student4', 'password', 'Alice', 'Smith', 'alice.smith@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('student5', 'password', 'Bob', 'Johnson', 'bob.johnson@example.com', false, 3);

INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher', 'password', 'Prof', 'Un', 'teacher@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher2', 'password', 'Prof', 'Deux', 'teacher2@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teache4', 'password', 'Prof', 'Quatre', 'teacher4@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher5', 'password', 'Prof', 'Cinq', 'teacher5@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher6', 'password', 'Prof', 'Six', 'teacher6@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher7', 'password', 'Prof', 'Sept', 'teacher7@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher8', 'password', 'Prof', 'Huit', 'teacher8@example.com', false, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher9', 'password', 'Prof', 'Neuf', 'teacher9@example.com', false, 3);

-- Insertion des enseignants
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T1', 'Desk1', 9);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T2', 'Desk2', 10);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T3', 'Desk3', 11);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T4', 'Desk4', 12);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T5', 'Desk5', 13);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T6', 'Desk6', 14);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T7', 'Desk7', 15);
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T8', 'Desk8', 16);

-- Insertion des promotions
INSERT INTO Promotions (year, level, id_Degree) VALUES (2022, 1, 1);
INSERT INTO Promotions (year, level, id_Degree) VALUES (2022, 2, 2);
INSERT INTO Promotions (year, level, id_Degree) VALUES (2023, 1, 1);
INSERT INTO Promotions (year, level, id_Degree) VALUES (2023, 2, 2);

-- Insertion des formations
INSERT INTO Trainings (name, id_Promotion) VALUES ('Formation1', 1);
INSERT INTO Trainings (name, id_Promotion) VALUES ('Formation2', 2);

-- Insertion des ressources
INSERT INTO Resources (name, id_Training) VALUES ('Qualité de Développement', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Qualité Algorithmique', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Programmation Avancée', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Modélisations', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Cryptographie', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Probabilités', 1);
INSERT INTO Resources (name, id_Training) VALUES ('GPO', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Droit', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Economie', 1);
INSERT INTO Resources (name, id_Training) VALUES ('Anglais', 2);
INSERT INTO Resources (name, id_Training) VALUES ('Communication', 2);
INSERT INTO Resources (name, id_Training) VALUES ('Cybersécurité', 2);
INSERT INTO Resources (name, id_Training) VALUES ('IA', 2);
INSERT INTO Resources (name, id_Training) VALUES ('NoSQL', 2);


-- Insertion des TD
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 1, 1);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDB', 1, 2);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 2, 1);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDB', 2, 2);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 3, 1);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDB', 3, 2);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 4, 1);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDB', 4, 2);

-- Insertion des TP
INSERT INTO TP (name, id_Td) VALUES ('TPA1', 1);
INSERT INTO TP (name, id_Td) VALUES ('TPA2', 1);
INSERT INTO TP (name, id_Td) VALUES ('TPB1', 2);
INSERT INTO TP (name, id_Td) VALUES ('TPB2', 2);
INSERT INTO TP (name, id_Td) VALUES ('TPA1', 3);
INSERT INTO TP (name, id_Td) VALUES ('TPA2', 3);
INSERT INTO TP (name, id_Td) VALUES ('TPB1', 4);
INSERT INTO TP (name, id_Td) VALUES ('TPB2', 4);
INSERT INTO TP (name, id_Td) VALUES ('TPA1', 5);
INSERT INTO TP (name, id_Td) VALUES ('TPA2', 5);
INSERT INTO TP (name, id_Td) VALUES ('TPB1', 6);
INSERT INTO TP (name, id_Td) VALUES ('TPB2', 6);
INSERT INTO TP (name, id_Td) VALUES ('TPA1', 7);
INSERT INTO TP (name, id_Td) VALUES ('TPA2', 7);
INSERT INTO TP (name, id_Td) VALUES ('TPB1', 8);
INSERT INTO TP (name, id_Td) VALUES ('TPB2', 8);

-- Insertion des matériaux
INSERT INTO Materials (equipment) VALUES ('Ordinateur portable');
INSERT INTO Materials (equipment) VALUES ('Tableau blanc');
INSERT INTO Materials (equipment) VALUES ('Ordinateur fixe');
INSERT INTO Materials (equipment) VALUES ('Vidéoprojecteur');
INSERT INTO Materials (equipment) VALUES ('Tablette tactile');
INSERT INTO Materials (equipment) VALUES ('Tableau noir');

-- Insertion des classes
INSERT INTO Classroom (name, capacity) VALUES ('A2-05', 30);
INSERT INTO Classroom (name, capacity) VALUES ('A2-04', 30);
INSERT INTO Classroom (name, capacity) VALUES ('A2-03', 30);
INSERT INTO Classroom (name, capacity) VALUES ('A2-01', 30);
INSERT INTO Classroom (name, capacity) VALUES ('A1-01', 26);
INSERT INTO Classroom (name, capacity) VALUES ('Amphi 1', 100);
INSERT INTO Classroom (name, capacity) VALUES ('Amphi 2', 150);
INSERT INTO Classroom (name, capacity) VALUES ('B1-09', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B1-10', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B1-13', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B1-14', 20);
INSERT INTO Classroom (name, capacity) VALUES ('B0-01', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B0-02', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B0-03', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B0-04', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B0-05', 30);
INSERT INTO Classroom (name, capacity) VALUES ('B0-06', 30);


-- Insertion des cours
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('08:00:00', '10:00:00', '2023-11-15', false, 1, NULL, 1, NULL, 1, 1);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('10:30:00', '12:30:00', '2023-11-15', false, 2, NULL, 1, NULL, 2, 1);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('13:30:00', '15:00:00', '2023-11-15', false, 1, NULL, NULL, 1, 3, 6);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('15:00:00', '17:00:00', '2023-11-15', false, 2, 1, NULL, NULL, 4, 2);

INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('09:00:00', '10:00:00', '2023-11-16', false, 1, NULL, NULL, 1, 5, 6);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('10:00:00', '11:00:00', '2023-11-16', false, 2, 1, NULL, NULL, 6, 11);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('11:00:00', '12:30:00', '2023-11-16', false, 1, 1, NULL, NULL, 7, 10);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('13:30:00', '15:30:00', '2023-11-16', false, 2, NULL, 1, NULL, 8, 1);

INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('09:00:00', '13:00:00', '2023-11-17', true, 2, NULL, 1, NULL, 1, 1);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('14:00:00', '15:00:00', '2023-11-17', false, 1, NULL, NULL, 1, 2, 7);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('15:00:00', '16:00:00', '2023-11-17', false, 2, 1, NULL, NULL, 3, 8);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('16:00:00', '17:00:00', '2023-11-17', false, 1, 1, NULL, NULL, 4, 9);

INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('09:30:00', '11:00:00', '2023-11-22', false, 2, NULL, NULL, 1, 5, 6);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('11:00:00', '12:00:00', '2023-11-22', false, 1, NULL, 1, NULL, 6, 13);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('13:30:00', '15:30:00', '2023-11-22', false, 2, 1, NULL, NULL, 7, 2);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('15:30:00', '17:00:00', '2023-11-22', false, 1, 1, NULL, NULL, 8, 3);

INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('10:30:00', '12:30:00', '2023-11-23', true, 2, 1, NULL, NULL, 1, 17);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('13:30:00', '15:00:00', '2023-11-23', false, 1, NULL, NULL, 1, 2, 7);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('15:30:00', '17:30:00', '2023-11-23', true, 2, NULL, 1, NULL, 3, 1);

-- Insertion des étudiants
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (123456,789455, true, 4, 1, 1, 1);
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (987654,321654, true, 5, 1, 1, 1);
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (654789,321789, true, 6, 1, 1, 1);
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (147852,258963, true, 7, 1, 1, 1);
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (963258,852147, true, 8, 1, 1, 1);


-- Insertion des absences
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (1, 1, 'Malade', true);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (1, 13, 'Enterrement', true);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (1, 14, '', false);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (3, 16, '', false);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (4, 4, 'Heure de conduite', true);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (4, 10, '', false);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (5, 10, 'JPO', true);
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (5, 14, '', false);

-- Insertion des logs
INSERT INTO Logs (id_User, modification) VALUES (1, 'Modification 1');
INSERT INTO Logs (id_User, modification) VALUES (1, 'Modification 2');

-- Insertion des rappels
INSERT INTO Reminders (id_user, title, reminder_text, reminder_date) VALUES (1, 'Anglais', 'Rappel pour la réunion', '2023-12-01 09:00:00');
INSERT INTO Reminders (id_user, title, reminder_text, reminder_date) VALUES (2, 'NoSQL', 'Rappel pour examen', '2023-12-02 14:00:00');

-- Insertion des commentaires
INSERT INTO Commentary (id_Teacher, id_Course, comment_text) VALUES (1, 1, 'Très bon travail des étudiants.');
