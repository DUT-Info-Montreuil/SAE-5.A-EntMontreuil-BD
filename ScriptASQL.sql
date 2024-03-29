drop schema if exists ent cascade;
-- Créez le schéma "ent"
CREATE SCHEMA ent;

-- Définissez le schéma "ent" comme schéma par défaut
SET search_path TO ent;

CREATE TABLE Roles(
    id SERIAL,
    name VARCHAR(32),
    PRIMARY KEY (id)
);

CREATE TABLE Users(
    id SERIAL,
    username VARCHAR(32),
    password VARCHAR(200),
    last_name VARCHAR(32),
    first_name VARCHAR(32),
    email VARCHAR(32),
    id_Role BIGINT,
    PRIMARY KEY(id),
    isAdmin BOOLEAN,
    isTTManager BOOLEAN,
    FOREIGN KEY(id_Role) REFERENCES Roles(id)
);

CREATE TABLE Teachers(
    id SERIAL,
    initial VARCHAR(32),
    desktop VARCHAR(32),
    id_User BIGINT ,
    PRIMARY KEY(id),
    FOREIGN KEY (id_User) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Degrees(
    id SERIAL,
    name VARCHAR(32),
    PRIMARY KEY(id)
);

CREATE UNIQUE INDEX degrees_name_unique ON Degrees (LOWER(name));

CREATE TABLE Promotions(
    id SERIAL,
    year INTEGER,
    level INTEGER CHECK (level >= 1 AND level <= 3),
    id_Degree BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(id_Degree) REFERENCES Degrees(id),
    CONSTRAINT unique_year_degree_level_combination UNIQUE (year,level, id_Degree)
);

CREATE TABLE Trainings(
    id SERIAL,
    name VARCHAR(32),
    id_Promotion BIGINT,
    semester BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_Promotion) REFERENCES Promotions(id)
);


CREATE TABLE Resources(
    id SERIAL,
    name VARCHAR(32),
    id_Training BIGINT,
    color VARCHAR(7),
    PRIMARY KEY(id),
    FOREIGN KEY(id_Training) REFERENCES Trainings(id)
);

CREATE TABLE TD(
    id SERIAL,
    name VARCHAR(32),
    id_Promotion BIGINT,
    id_Training BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(id_Promotion) REFERENCES Promotions(id),
    FOREIGN KEY(id_Training) REFERENCES Trainings(id),
    CONSTRAINT unique_name_promotion_combination UNIQUE (name, id_Promotion)
);


CREATE TABLE TP(
    id SERIAL,
    name VARCHAR(32),
    id_Td BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(id_Td) REFERENCES TD(id),
    CONSTRAINT unique_name_td_combination UNIQUE (name, id_Td)
);

CREATE TABLE Materials(
    id SERIAL,
    equipment VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE UNIQUE INDEX materials_equipment_unique ON Materials (LOWER(equipment));


CREATE TABLE Classroom(
    id SERIAL,
    name VARCHAR(32),
    capacity INTEGER,
    PRIMARY KEY (id)
);
CREATE UNIQUE INDEX Classroom_name_unique ON Classroom (LOWER(name));

CREATE TABLE CONTAINS (
    id_materials BIGINT,
    id_classroom BIGINT,
    quantity INTEGER,
    PRIMARY KEY (id_materials, id_classroom),
    FOREIGN KEY (id_materials) REFERENCES Materials(id),
    FOREIGN KEY (id_classroom) REFERENCES Classroom(id),
    UNIQUE (id_materials, id_classroom)
);




CREATE TABLE Courses(
    id SERIAL,
    startTime TIME,
    endTime TIME,
    dateCourse DATE,
    control BOOLEAN,
    id_Resource BIGINT,
    id_Tp BIGINT,
    id_Td BIGINT,
    id_Promotion BIGINT,
    id_Training BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_Training) REFERENCES Trainings(id),
    FOREIGN KEY (id_Resource) REFERENCES Resources(id),
    FOREIGN KEY (id_Tp) REFERENCES TP(id),
    FOREIGN KEY (id_Td) REFERENCES TD(id),
    FOREIGN KEY (id_Promotion) REFERENCES Promotions(id)
);


CREATE TABLE Courses_Classrooms(
    id_Course BIGINT,
    id_Classroom BIGINT,
    PRIMARY KEY (id_Course,id_Classroom),
    FOREIGN KEY (id_Classroom) REFERENCES Classroom(id) ON DELETE CASCADE,
    FOREIGN KEY (id_Course) REFERENCES Courses(id) ON DELETE CASCADE
);

CREATE TABLE Courses_Teachers(
    id_Course BIGINT,
    id_Teacher BIGINT,
    PRIMARY KEY (id_Course, id_Teacher),
    FOREIGN KEY (id_Course) REFERENCES Courses(id) ON DELETE CASCADE,
    FOREIGN KEY (id_Teacher) REFERENCES Teachers(id) ON DELETE CASCADE
);


CREATE TABLE Students (
    id SERIAL,
    apprentice BOOLEAN,
    ine VARCHAR(32),
    nip VARCHAR(32),
    id_User BIGINT ,
    id_Td  BIGINT ,
    id_Tp  BIGINT ,
    id_Promotion BIGINT ,
    PRIMARY KEY (id),
    FOREIGN KEY (id_User) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (id_Td) REFERENCES TD(id),
    FOREIGN KEY (id_Tp) REFERENCES TP(id),
    FOREIGN KEY (id_Promotion) REFERENCES Promotions(id)
);


CREATE TABLE Absences(
    id_Student BIGINT ,
    id_Course BIGINT ,
    reason VARCHAR(32),
    document BYTEA, -- Utilisation de BYTEA pour stocker un document binaire
    justify BOOLEAN,
    PRIMARY KEY (id_Student, id_Course),
    FOREIGN KEY (id_Student) REFERENCES Students(id),
    FOREIGN KEY (id_Course) REFERENCES Courses(id)
);

CREATE TABLE Logs(
    id SERIAL,
    id_User BIGINT,
    modification VARCHAR(100),
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id_User) REFERENCES Users(id)
);

CREATE TABLE Reminders(
    id SERIAL,
    id_User BIGINT,
    title VARCHAR(50),
    reminder_text VARCHAR(255),
    reminder_date TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(id_User) REFERENCES Users(id)
);

CREATE TABLE Commentary(
    id SERIAL,
    id_User BIGINT,
    id_Promotion BIGINT,
    date DATE,
    title VARCHAR(50),
    comment_text TEXT,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(id_User) REFERENCES Users(id),
    FOREIGN KEY(id_Promotion) REFERENCES Promotions(id)
);

CREATE TABLE Settings(
    id_User BIGINT,
    notification_mail BOOLEAN,
    notification_website BOOLEAN,
    PRIMARY KEY(id_User),
    FOREIGN KEY(id_User) REFERENCES Users(id) ON DELETE CASCADE
);

create table Notifications
(
    id           serial
        primary key,
    id_user      bigint                                 not null
        references ent.users,
    content      text                                   not null,
    is_read      boolean                  default false not null,
    created_at   timestamp with time zone default CURRENT_TIMESTAMP,
    title        text                                   not null,
    icon         text,
    "icon-color" text,
    route        text
);

--supprime chaque absences de l'étudiant supprimer
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

--met id_user a null dans la table logs quand l'users associé est supprimé
CREATE OR REPLACE FUNCTION update_logs_on_user_delete()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE ent.Logs
    SET id_User = NULL
    WHERE id_User = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_update_logs_on_user_delete
BEFORE DELETE ON Users
FOR EACH ROW
EXECUTE FUNCTION update_logs_on_user_delete();

--met id_user a null dans la table reminders quand l'users associé est supprimé
CREATE OR REPLACE FUNCTION update_reminders_on_user_delete()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE ent.Reminders
    SET id_User = NULL
    WHERE id_User = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_update_reminders_on_user_delete
BEFORE DELETE ON Users
FOR EACH ROW
EXECUTE FUNCTION update_reminders_on_user_delete();

--supprime les commentaires de l'enseignant associé quand l'user est supprimé
CREATE OR REPLACE FUNCTION delete_commentary_on_user_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM ent.Commentary
    WHERE id_User = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_delete_commentary_on_user_delete
BEFORE DELETE ON Users
FOR EACH ROW
EXECUTE FUNCTION delete_commentary_on_user_delete();



-- ajoute les settings a true a chaque fois qu'un users est ajouté
CREATE OR REPLACE FUNCTION insert_settings_on_user_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO ent.Settings (id_User, notification_mail, notification_website)
    VALUES (NEW.id, TRUE, TRUE);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_settings_trigger
AFTER INSERT ON ent.Users
FOR EACH ROW
EXECUTE FUNCTION insert_settings_on_user_insert();

-- met id_role a 3 quand un role est supprimer, pour tous les utilisateurs qui avait ce role
CREATE OR REPLACE FUNCTION update_users_role()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE ent.Users
    SET id_role = 3 
    WHERE id_role = OLD.id; 

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER on_delete_role
BEFORE DELETE ON ent.Roles
FOR EACH ROW
EXECUTE FUNCTION update_users_role();

-- insert nécessaire a l'api
INSERT INTO Roles (name) VALUES ('étudiant');
INSERT INTO Roles (name) VALUES ('enseignant');
INSERT INTO Roles (name) VALUES ('utilisateur');
