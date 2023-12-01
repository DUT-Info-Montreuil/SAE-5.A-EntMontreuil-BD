SET search_path TO ent;
-- Insertion des rôles
INSERT INTO Roles (name) VALUES ('admin');
INSERT INTO Roles (name) VALUES ('user');
INSERT INTO Roles (name) VALUES ('student');
INSERT INTO Roles (name) VALUES ('teacher');

-- Insertion des degrés
INSERT INTO Degrees (name) VALUES ('INFO');
INSERT INTO Degrees (name) VALUES ('GAGO');
INSERT INTO Degrees (name) VALUES ('CLIO');
INSERT INTO Degrees (name) VALUES ('INFOCOM');

-- Insertion des utilisateurs
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('admin', 'password', 'Admin', 'Admin', 'admin@example.com', true, 1);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('user', 'password', 'User', 'User', 'user@example.com', false, 2);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('student', 'password', 'Admin', 'Admin', 'admin@example.com', true, 3);
INSERT INTO Users (username, password, last_name, first_name, email, isAdmin, id_Role) VALUES ('teacher', 'password', 'User', 'User', 'user@example.com', false, 4);

-- Insertion des enseignants
INSERT INTO Teachers (initial, desktop, id_User) VALUES ('T1', 'Desk1', 4);

-- Insertion des formations
INSERT INTO Trainings (name, id_Degree) VALUES ('Formation1', 1);
INSERT INTO Trainings (name, id_Degree) VALUES ('Formation2', 2);

-- Insertion des promotions
INSERT INTO Promotions (year, level, id_Degree) VALUES (2023, 1, 1);
INSERT INTO Promotions (year, level, id_Degree) VALUES (2022, 2, 2);

-- Insertion des ressources
INSERT INTO Resources (name, id_Promotion) VALUES ('Ressource1', 1);
INSERT INTO Resources (name, id_Promotion) VALUES ('Ressource2', 2);

-- Insertion des TD
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TD1', 1, 1);
INSERT INTO TD (name, id_Promotion, id_Training) VALUES ('TD2', 2, 2);

-- Insertion des TP
INSERT INTO TP (name, id_Td) VALUES ('TP1', 1);
INSERT INTO TP (name, id_Td) VALUES ('TP2', 2);

-- Insertion des matériaux
INSERT INTO Materials (equipment) VALUES ('Ordinateur portable');
INSERT INTO Materials (equipment) VALUES ('Tableau blanc');

-- Insertion des classes
INSERT INTO Classroom (name, capacity) VALUES ('Salle1', 30);
INSERT INTO Classroom (name, capacity) VALUES ('Salle2', 40);

-- Insertion des cours
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('08:00:00', '10:00:00', '2023-11-15', true, 1, 1, 1, 1, 1, 1);
INSERT INTO Courses (startTime, endTime, dateCourse, control, id_Resource, id_Tp, id_Td, id_Promotion, id_Teacher, id_classroom) VALUES ('10:30:00', '12:30:00', '2023-11-15', true, 2, 2, 2, 2, 1, 2);

-- Insertion des étudiants
INSERT INTO Students (nip, ine, apprentice, id_User, id_Td, id_Tp, id_Promotion) VALUES (123456,789455, true, 3, 1, 1, 1);

-- Insertion des absences
INSERT INTO Absences (id_Student, id_Course, reason, justify) VALUES (1, 1, 'Malade', false);

-- Insertion des logs
INSERT INTO Logs (id_User, modification) VALUES (1, 'Modification 1');
INSERT INTO Logs (id_User, modification) VALUES (1, 'Modification 2');

-- Insertion des rappels
INSERT INTO Reminder (user_id, reminder_text, reminder_date) VALUES (1, 'Rappel pour la réunion', '2023-12-01 09:00:00');
INSERT INTO Reminder (user_id, reminder_text, reminder_date) VALUES (2, 'Rappel pour examen', '2023-12-02 14:00:00');

-- Insertion des commentaires
INSERT INTO Commentary (teacher_id, course_id, comment_text) VALUES (1, 1, 'Très bon travail des étudiants.');

-- Création du déclencheur
CREATE OR REPLACE FUNCTION delete_absences_on_student_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM ent.Absences WHERE id_Student = OLD.id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER delete_absences_trigger
BEFORE DELETE ON ent.Students
FOR EACH ROW
EXECUTE FUNCTION delete_absences_on_student_delete();


