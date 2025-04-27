-- Insertion des opérateurs
INSERT INTO Operator (nom, prénom, username, email, role) VALUES
('Lovecraft', 'Howard', 'hlovecraft', 'howard.lovecraft@example.com', 'admin'),
('Derleth', 'August', 'aderleth', 'august.derleth@example.com', 'visiteur'),
('Smith', 'Clark Ashton', 'csmith', 'clark.smith@example.com', 'visiteur'),
('Howard', 'Robert E.', 'rhoward', 'robert.howard@example.com', 'visiteur');

-- Insertion des tags
INSERT INTO Tag (label, slug) VALUES
('Anciens', 'anciens'),
('Grand Ancien', 'grand-ancien'),
('Mythes', 'mythes'),
('Artefacts', 'artefacts'),
('Livres Interdits', 'livres-interdits'),
('Créatures', 'créatures');

-- Insertion des items
INSERT INTO Item (type, label, slug, date_de_mise_en_vente, description, primary_picture, secondary_picture, prix, operator_id) VALUES
('bota', 'Grimoire de R\'lyeh', 'grimoire-de-rlyeh', '2023-10-01 10:00:00', 'Un livre maudit contenant des incantations interdites.', 'grimoire_rlyeh.jpg', 'grimoire_rlyeh_2.jpg', 999.99, 1),
('zoo', 'Statuette de Cthulhu', 'statuette-de-cthulhu', '2023-10-02 14:30:00', 'Une statuette représentant le Grand Ancien Cthulhu.', 'statuette_cthulhu.jpg', 'statuette_cthulhu_2.jpg', 499.99, 2),
('brol', 'Amulette de Yog-Sothoth', 'amulette-de-yog-sothoth', '2023-10-03 11:00:00', 'Une amulette protectrice contre les forces du mal.', 'amulette_yog_sothoth.jpg', 'amulette_yog_sothoth_2.jpg', 399.99, 3),
('bota', 'Manuscrit Voynich', 'manuscrit-voynich', '2023-10-04 15:30:00', 'Un manuscrit indéchiffrable aux pouvoirs mystérieux.', 'manuscrit_voynich.jpg', 'manuscrit_voynich_2.jpg', 799.99, 4),
('zoo', 'Figurine de Nyarlathotep', 'figurine-de-nyarlathotep', '2023-10-05 12:45:00', 'Une figurine du Chaos Rampant, Nyarlathotep.', 'figurine_nyarlathotep.jpg', 'figurine_nyarlathotep_2.jpg', 599.99, 1);

-- Lien entre les items et les tags
INSERT INTO Item_Tag (item_id, tag_id) VALUES
(1, 1), -- Grimoire de R'lyeh -> Anciens
(1, 3), -- Grimoire de R'lyeh -> Mythes
(1, 5), -- Grimoire de R'lyeh -> Livres Interdits
(2, 2), -- Statuette de Cthulhu -> Grand Ancien
(2, 4), -- Statuette de Cthulhu -> Artefacts
(3, 4), -- Amulette de Yog-Sothoth -> Artefacts
(3, 6), -- Amulette de Yog-Sothoth -> Créatures
(4, 3), -- Manuscrit Voynich -> Mythes
(4, 5), -- Manuscrit Voynich -> Livres Interdits
(5, 2), -- Figurine de Nyarlathotep -> Grand Ancien
(5, 6); -- Figurine de Nyarlathotep -> Créatures

-- Insertion de collections associées aux users
INSERT INTO Collection (label, description) VALUES
('Artefacts Maudits', 'Une collection d\'objets maudits et interdits.'),
('Livres Occultes', 'Une collection de livres interdits et dangereux.'),
('Figurines Mythiques', 'Une collection de figurines représentant des créatures mythiques.');

-- Insertion des items dans les collections
INSERT INTO Collection_Item (collection_id, item_id) VALUES
(1, 1), -- Grimoire de R'lyeh dans Artefacts Maudits
(1, 2), -- Statuette de Cthulhu dans Artefacts Maudits
(1, 3), -- Amulette de Yog-Sothoth dans Artefacts Maudits
(2, 1), -- Grimoire de R'lyeh dans Livres Occultes
(2, 4), -- Manuscrit Voynich dans Livres Occultes
(3, 2), -- Statuette de Cthulhu dans Figurines Mythiques
(3, 5); -- Figurine de Nyarlathotep dans Figurines Mythiques

-- Insertion de messages envoyés par des opérateurs
INSERT INTO Message (date_de_réception, nom, prénom, email, téléphone, contenu) VALUES
('2023-10-03 09:00:00', 'Lovecraft', 'Howard', 'howard.lovecraft@example.com', '0475123456', 'Attention, ne lisez pas le Grimoire à voix haute!'),
('2023-10-04 10:15:00', 'Derleth', 'August', 'august.derleth@example.com', '0475654321', 'Avez-vous trouvé la statuette de Cthulhu?'),
('2023-10-05 11:30:00', 'Smith', 'Clark Ashton', 'clark.smith@example.com', '0475987654', 'L\'amulette de Yog-Sothoth est-elle toujours disponible?'),
('2023-10-06 12:45:00', 'Howard', 'Robert E.', 'robert.howard@example.com', '0475321654', 'Je cherche des informations sur le Manuscrit Voynich.');