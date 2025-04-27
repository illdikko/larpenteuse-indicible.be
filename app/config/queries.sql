--Requêtes utiles


-- ## Requêtes de tri

-- ### Tri par tag

--Le tri par tag pourra être utilisé par l'admin, mais aussi par les visiteurs qui parcourerons la galerie.

-- Récupérer tous les items ayant un tag spécifique (par exemple, tag_id = 1 pour "Ancien Culte")

SELECT Item.* FROM Item
JOIN Item_Tag ON Item.id = Item_Tag.item_id
WHERE Item_Tag.tag_id = 1
ORDER BY Item.label;

-- Récupérer tous les items avec leurs 
-- Les tags pourraient éventuellement apparaitre sur la page de chaque article individuel. Mais récupérer les tags de chaque items pourraient permettre aux admin de s'y retrouver en cas de doute, ou de besoin de refonte.
SELECT Item.*, GROUP_CONCAT(Tag.label) AS tags
FROM Item
LEFT JOIN Item_Tag ON Item.id = Item_Tag.item_id
LEFT JOIN Tag ON Item_Tag.tag_id = Tag.id
GROUP BY Item.id
ORDER BY Item.label;


-- ### Tri par prix

-- Ces tris permettrons aux visiteurs de pouvoir parcourir les articles selon leur souhait, ou leur critère de recherche particulier.

-- Prix croissant
SELECT * FROM Item ORDER BY prix ASC;

-- Prix décroissant
SELECT * FROM Item ORDER BY prix DESC;

-- Items dans une fourchette de prix (artefacts accessibles) -- Il n'est pas prévu pour le moment d'ajouter un tri par fourchette de prix, mais la requête est prête au cas où l'on décide de mettre ce tri en place.
SELECT * FROM Item WHERE prix BETWEEN 50 AND 250 ORDER BY prix;


-- ### Tri par nom (label)

-- Ordre alphabétique
SELECT * FROM Item ORDER BY label ASC;

-- Ordre alphabétique inverse
SELECT * FROM Item ORDER BY label DESC;


-- ### Tri par date de mise en ligne

-- Du plus récent au plus ancien
SELECT * FROM Item ORDER BY date_de_mise_en_vente DESC;

-- Du plus ancien au plus récent
SELECT * FROM Item ORDER BY date_de_mise_en_vente ASC;


-- ## Opérations CRUD pour Operator

-- ### Création

INSERT INTO Operator (nom, prénom, username, email, `role`)
VALUES ('Carter', 'Randolph', 'rcarter', 'randolph.carter@miskatonic.edu', 'admin');


-- ### Lecture

-- Récupérer tous les opérateurs
SELECT * FROM Operator WHERE deleted_at IS NULL;

-- Récupérer un opérateur spécifique
SELECT * FROM Operator WHERE id = 1 AND deleted_at IS NULL;


-- ### Mise à jour

UPDATE Operator
SET nom = 'West', prénom = 'Herbert', email = 'herbert.west@miskatonic.edu'
WHERE id = 1;


-- ### Suppression (logique)

-- Suppression logique (recommandée)
UPDATE Operator SET deleted_at = CURRENT_TIMESTAMP WHERE id = 1;


-- ### Suppression (physique)

-- Suppression physique (définitive)
DELETE FROM Operator WHERE id = 1;


-- ## Opérations CRUD pour Tag

-- Les tags sont créés par les admin uniquement. Ils servent à qualifier les articles présents dans la galerie et serviront de filtre de recherche ppour les visiteurs.
-- bota = cryptobotanique ; zoo = cryptozoologie ; brol = crypto-brol, c a d tout ce qui n'est ny zoo ni bota.

-- ### Création 

INSERT INTO Tag (label, slug)
VALUES ('Necronomicon', 'necronomicon');

INSERT INTO Tag (label, slug)
VALUES ('R''lyeh', 'rlyeh');

INSERT INTO Tag (label, slug)
VALUES ('Manuscrit maudit', 'manuscrit-maudit');


-- ### Lecture

-- Tous les tags
SELECT * FROM Tag;

-- Tag spécifique
SELECT * FROM Tag WHERE id = 1;


-- ### Mise à jour

UPDATE Tag
SET label = 'Culte de Cthulhu', slug = 'culte-cthulhu'
WHERE id = 1;


-- ### Suppression

DELETE FROM Tag WHERE id = 1;


-- ## Opérations CRUD pour Item

-- Utilisée par l'admin pour rajouter des articles à sa galerie.

-- ### Création

INSERT INTO Item (`type`, label, slug, date_de_mise_en_vente, `description`, primary_picture, secondary_picture, prix, operator_id)
VALUES ('bota', 'Champignon phosphorescent de Yuggoth', 'champignon-yuggoth', CURRENT_TIMESTAMP, 
        'Spécimen rare de mycologie extraterrestre, luisant d''une inquiétante lueur verdâtre dans l''obscurité. Provenance: expédition au plateau de Leng.', 
        'img/champignon_yuggoth_1.jpg', 'img/champignon_yuggoth_2.jpg', 199.99, 1);

INSERT INTO Item (`type`, label, slug, date_de_mise_en_vente, `description`, primary_picture, secondary_picture, prix, operator_id)
VALUES ('zoo', 'Spécimen conservé de Shoggoth miniature', 'shoggoth-miniature', CURRENT_TIMESTAMP, 
        'Prétendu spécimen de Shoggoth juvénile conservé dans un bocal d''éther. Probablement une contrefaçon, mais fascinant néanmoins.', 
        'img/shoggoth_jar_1.jpg', 'img/shoggoth_jar_2.jpg', 489.99, 1);
        
INSERT INTO Item (`type`, label, slug, date_de_mise_en_vente, `description`, primary_picture, secondary_picture, prix, operator_id)
VALUES ('brol', 'Fragment de stèle de R''lyeh', 'fragment-stele-rlyeh', CURRENT_TIMESTAMP, 
        'Fragment de pierre noire portant des inscriptions incompréhensibles. Les hiéroglyphes semblent changer légèrement selon l''angle d''observation.', 
        'img/rlyeh_stele_1.jpg', 'img/rlyeh_stele_2.jpg', 1299.99, 2);

-- Associer un tag à l'item
INSERT INTO Item_Tag (item_id, tag_id) 
VALUES (LAST_INSERT_ID(), 2);


-- ### Lecture

-- Tous les items
SELECT * FROM Item;

-- Item spécifique avec ses tags
SELECT Item.*, GROUP_CONCAT(Tag.label) AS tags
FROM Item
LEFT JOIN Item_Tag ON Item.id = Item_Tag.item_id
LEFT JOIN Tag ON Item_Tag.tag_id = Tag.id
WHERE Item.id = 1
GROUP BY Item.id;


-- ### Mise à jour

UPDATE Item
SET label = 'Manuscrit partiel du Necronomicon', `description` = 'Pages détachées d''une copie du XVIIe siècle, texte en latin. Provenance douteuse, mais l''expertise calligraphique suggère son authenticité.', prix = 2499.99
WHERE id = 1;

-- Ajouter un tag
INSERT INTO Item_Tag (item_id, tag_id) VALUES (1, 1);

-- Supprimer un tag
DELETE FROM Item_Tag WHERE item_id = 1 AND tag_id = 3;


-- ### Suppression

-- La suppression de l'item supprimera automatiquement ses relations dans Item_Tag grâce à ON DELETE CASCADE
DELETE FROM Item WHERE id = 1;


-- ## Opérations CRUD pour Collection

-- Les collections sont créées par les visiteurs, à la façon de wishlistes, ou pour retrouver plus facilement plus tard les articles qui leur font de l'oeil.
-- La creation d'un compte visiteur sera obligatoire pour toute personne souhaitant créer une collection.

-- ### Création

INSERT INTO Collection (label, `description`, operator_id)
VALUES ('Artefacts de l''Antarctique', 'Objets rapportés par l''expédition Miskatonic de 1930-1931 dans les montagnes hallucinées de l''Antarctique', 1);

-- Ajouter des items à la collection
INSERT INTO Collection_Item (collection_id, item_id)
VALUES (LAST_INSERT_ID(), 1), (LAST_INSERT_ID(), 2);


-- ### Lecture

-- Toutes les collections
SELECT * FROM Collection;

-- Collection spécifique avec ses items
SELECT Collection.*, GROUP_CONCAT(Item.label) AS items
FROM Collection
LEFT JOIN Collection_Item ON Collection.id = Collection_Item.collection_id
LEFT JOIN Item ON Collection_Item.item_id = Item.id
WHERE Collection.id = 1
GROUP BY Collection.id;


-- ### Mise à jour

UPDATE Collection
SET label = 'Expédition Miskatonic - Antarctique', `description` = 'Collection complète des artefacts récupérés lors de la désastreuse expédition Miskatonic de 1930-1931'
WHERE id = 1;

-- Ajouter un item à la collection
INSERT INTO Collection_Item (collection_id, item_id) VALUES (1, 3);

-- Retirer un item de la collection
DELETE FROM Collection_Item WHERE collection_id = 1 AND item_id = 2;


-- ### Suppression

DELETE FROM Collection WHERE id = 1;


-- ## Opérations pour Message

-- Les messages sont écris pour contacter l'artiste. Il ne sont pas necessairement associés à un compte visiteur.
-- Le gestion des messages se fait par l'admin uniquement. 

-- ### Réception (création)

INSERT INTO Message (date_de_réception, nom, prénom, email, téléphone, contenu)
VALUES (CURRENT_TIMESTAMP, 'Derleth', 'August', 'a.derleth@arkham.com', '6175553214', 
        'Je suis particulièrement intéressé par le fragment de stèle. Les inscriptions correspondent-elles à celles décrites dans le journal d''Angell? Disposez-vous d''une traduction partielle? Je suis prêt à payer plus si vous pouvez garantir sa provenance.');
        
INSERT INTO Message (date_de_réception, nom, prénom, email, téléphone, contenu)
VALUES (CURRENT_TIMESTAMP, 'Tillinghast', 'Crawford', 'tillinghast.c@providence.edu', '4015559876', 
        'Votre spécimen de champignon de Yuggoth m''intéresse pour mes recherches sur les propriétés psychoactives des cryptomycètes. Est-il possible de le voir avant achat? J''aimerais vérifier s''il émet bien les radiations ultraviolettes caractéristiques.');


-- ### Lecture

-- Tous les messages
SELECT * FROM Message ORDER BY date_de_réception DESC;

-- Messages non lus
SELECT * FROM Message WHERE is_read = 0 ORDER BY date_de_réception DESC;

-- Marquer un message comme lu
UPDATE Message SET is_read = 1 WHERE id = 1;


-- ### Suppression

DELETE FROM Message WHERE id = 1;
