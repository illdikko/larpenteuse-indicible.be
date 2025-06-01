-- Lien vers le SVG : https://www.mermaidchart.com/raw/05cc7831-ce67-4e51-92a0-f43bcb950f7a?theme=light&version=v0.1&format=svg

-- Table Operator
CREATE TABLE Operator (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prénom VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email  VARCHAR(255),
    `role` ENUM ('admin','visiteur') NOT NULL,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);
    
-- Table Tag
CREATE TABLE Tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100) NOT NULL,
    slug VARCHAR(255) UNIQUE
);

-- Table Item
CREATE TABLE Item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `type` ENUM('bota', 'zoo','brol') NOT NULL,
    label VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    date_de_mise_en_vente TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `description` TEXT,
    primary_picture TEXT,
    secondary_picture TEXT,
    prix DECIMAL(10, 2) NOT NULL,
    operator_id INT,
    FOREIGN KEY (operator_id) REFERENCES Operator(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table Item_Tag
CREATE TABLE Item_Tag(
    item_id INT,
    tag_id INT,
    FOREIGN KEY (item_id) REFERENCES Item(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tag(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table Message
CREATE TABLE Message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_de_réception TIMESTAMP NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prénom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    téléphone VARCHAR(20),
    contenu TEXT NOT NULL,
    is_read TINYINT(1) DEFAULT 0
);

-- Table Collection
CREATE TABLE Collection(
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255),
    `description` TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    operator_id INT,
    FOREIGN KEY (operator_id) REFERENCES Operator(id) ON DELETE SET NULL ON UPDATE CASCADE

);

-- Table Collection_Item
CREATE TABLE Collection_Item(
    collection_id INT,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES Item(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (collection_id) REFERENCES Collection(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table connexions --
CREATE TABLE login_attempts (
     id INT AUTO_INCREMENT PRIMARY KEY,
     user_id INT,
     attempt_time DATETIME,
     FOREIGN KEY (user_id) REFERENCES operator(id) );



-- -- Table Moyen de paiement
-- CREATE TABLE Moyens_de_paiement (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     type ENUM('chèque', 'cash', 'carte', 'virement', 'paypal') NOT NULL
-- );

-- -- Table Client
-- CREATE TABLE Client (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     nom VARCHAR(100) NOT NULL,
--     prénom VARCHAR(100) NOT NULL,
--     rue VARCHAR(255) NOT NULL,
--     numéro VARCHAR(10) NOT NULL,
--     complément VARCHAR(255),
--     zip VARCHAR(10) NOT NULL,
--     ville VARCHAR(100) NOT NULL,
--     pays VARCHAR(100) NOT NULL,
--     token VARCHAR(100)
-- );

-- -- Table Vente
-- CREATE TABLE Vente (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     date_de_la_vente TIMESTAMP NOT NULL,
--     prix_total DECIMAL(10, 2) NOT NULL,
--     client_id INT,
--     moyen_de_paiement_id INT,
--     FOREIGN KEY (client_id) REFERENCES Client(id),
--     FOREIGN KEY (moyen_de_paiement_id) REFERENCES Moyens_de_paiement(id)
-- );

-- -- Table Vente_détail
-- CREATE TABLE Vente_détail (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     article_id INT,
--     prix_article DECIMAL(10, 2) NOT NULL,
--     FOREIGN KEY (article_id) REFERENCES Article(id)
-- );

