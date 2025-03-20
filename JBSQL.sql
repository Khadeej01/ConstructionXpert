CREATE DATABASE constructionxpert_db;
USE constructionxpert_db;


CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    motDePasse VARCHAR(100) NOT NULL
);


CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    dateDebut DATE,
    dateFin DATE,
    budget DOUBLE
);


CREATE TABLE tache (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    dateDebut DATE,
    dateFin DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);


CREATE TABLE resource (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    quantite INT,
    infoFournisseur VARCHAR(255)
);


CREATE TABLE fournisseur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    contact VARCHAR(255)
);


CREATE TABLE taches_resource (
    tache_id INT,
    resource_id INT,
    quantite_used INT,
    FOREIGN KEY (tache_id) REFERENCES tache(id) ON DELETE CASCADE,
    FOREIGN KEY (resource_id) REFERENCES resource(id) ON DELETE CASCADE,
    PRIMARY KEY (tache_id, resource_id)
);

SELECT * from projects ;
SELECT * from  tache ;
SELECT * from  resource ;


DESCRIBE resource;
ALTER TABLE resource DROP COLUMN infoFournisseur;

ALTER TABLE resource ADD COLUMN task_id INT NOT NULL;
ALTER TABLE resource ADD CONSTRAINT fk_task_id FOREIGN KEY (task_id) REFERENCES tache(id) ON DELETE CASCADE;
