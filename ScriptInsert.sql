-- Insérer des données dans la table Users
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role)
VALUES
    ('psolanki', '1234', 'Solanki', 'Priyank', 'priyank@iut.univ-paris8.fr', false, 3),
    ('yhamani', '1234', 'Hamani', 'Yanis', 'yanis@iut.univ-paris8.fr', false, 3),
    ('igada', '1234', 'Gada', 'Ismail', 'ismail@iut.univ-paris8.fr', false, 4),
    ('sching', '1234', 'Ching', 'Steven', 'steven@iut.univ-paris8.fr', false, 4),
    ('ecyriaque', '1234', 'Cyriaque', 'Emilio', 'emilio@iut.univ-paris8.fr', true, 1);

-- Insérer des données dans la table Admin
INSERT INTO Admin (id_User) VALUES (5);

-- Insérer des données dans la table Teachers
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('GI', 'B1-06', 3);

-- Insérer des données dans la table Degrees
INSERT INTO Degrees (name) VALUES ('INFO'), ('INFO-COM'), ('GACO'), ('QLIO');

-- Insérer des données dans la table Trainings
INSERT INTO Trainings (name, id_Degree) VALUES ('Parcours A', 1), ('Parcours C', 1);

-- Insérer des données dans la table Promotions
INSERT INTO Promotions (year, level, id_Degree) VALUES (1, 1, 1), (2, 1, 1);

-- Insérer des données dans la table Resources
INSERT INTO Resources (name, id_Promotion) VALUES ('Modélisation', 1), ('Anglais', 1);

-- Insérer des données dans la table TD
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TDA', 1, 1), ('TDA', 2, 1);

-- Insérer des données dans la table TP
INSERT INTO TP (name, id_Td) VALUES ('TP1', 1), ('TP2', 2);

-- Insérer des données dans la table Materials
INSERT INTO Materials (equipment) VALUES ('Ordinateur portable'), ('Tableau blanc');

-- Insérer des données dans la table Classroom
INSERT INTO Classroom (name, capacity) VALUES ('A2-04', 30), ('A2-03', 30);

-- Insérer des données dans la table Courses
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom)
VALUES
    ('09:00:00', '12:00:00', '2023-10-18', true, 1, NULL, NULL, 1, 1, 1),
    ('14:00:00', '16:00:00', '2023-10-19', false, 2, 2, NULL, NULL, 1, 2);

-- Insérer des données dans la table Students
INSERT INTO Students (apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (false, 1, 1, 1, 1), (false, 2, 2, 2, 2);

-- Insérer des données dans la table Absences
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (1, 1, 'Maladie', true), (2, 2, 'Raison personnelle', true);

-- Insérer des données dans la table Logs
INSERT INTO Logs (id_User, modification) VALUES (1, 'Modification 1'), (2, 'Modification 2');

-- Insérer des données dans la table Historique
INSERT INTO Historique (id_User, modification) VALUES (4, 'est devenue responsable emploi du temps');
