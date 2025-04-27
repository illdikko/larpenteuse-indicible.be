-- Étape 3 – Tests relationnels à réaliser

-- Suppressions critiques

-- Supprimez un tag lié à un item . Résultat attendu : Suppression de la ligne correspondante dans Item_Tag. Obtenu : résultat attendu.
DELETE FROM Tag WHERE id = 1;


-- Supprimez un item présent dans une collection Résultat attendu : Suppression de la ligne correspondante dans Collection_Item et Item_Tag. Obtenu : Suppression correcte de la ligne dans Item_Tag. item_id passé en NULL dans Collection_Item (ON DELETE SET NULL). Modification en CASCADE. Un item inexistant ne peut pas rester dans une collection.
DELETE FROM Item WHERE id = 1;

-- Supprimez un operator ayant des messages ou des collections. Résultat attendu : Suppression de la collection,des messages. Obtenus: Pas de suppression de la collection car elle n'est pas liée à un user -> ajout de la clé étrangère operator_id ON DELETE CASCADE. Pas de suppression des messages car la table message ne reprend pas les ID des opérateurs. Pas de modification, les envois de messages peuvent être fait par des personnes non enregistrées parmis les visiteurs.
DELETE FROM Operator WHERE id = 4; --id =1 est un admin, je n'ai pas osé essayer de le supprimer 😬

-- Insertions incohérentes

-- Insertion d’une collection avec un operator_id inexistant. Résultat attendu : Insertion bloquée car operator_id inexistant. Obtenu : Insertion réussie --> bloquer l'insertion si l'operator_id est inexistant. Colonne operator_id mal configurée plus haut. Modifié comme necessaire
INSERT INTO Collection (label, description, operator_id) VALUES ('Collection inexistante', 'Description', 999);

-- Insertion d’un item_tag avec un item_id ou tag_id inexistant Résultat attendu : Insertions bloquées grâce à la contrainte des fk. Obtenu : résultats attendus.
INSERT INTO Item_Tag (item_id, tag_id) VALUES (999, 1);
INSERT INTO Item_Tag (item_id, tag_id) VALUES (1, 999);

-- Insertion de deux items avec le même slug. Résultat attendu:  Insertion impossible car slug a l'attribut UNIQUE. Obtenu : Resultat attendu.
INSERT INTO Item (type, label, slug, date_de_mise_en_vente, description, primary_picture, secondary_picture, prix, operator_id) VALUES
('bota', 'Item Dupliqué 1', 'slug-duplique', '2023-10-07 10:00:00', 'Description 1', 'image1.jpg', 'image1_2.jpg', 100.00, 1),
('bota', 'Item Dupliqué 2', 'slug-duplique', '2023-10-07 11:00:00', 'Description 2', 'image2.jpg', 'image2_2.jpg', 200.00, 2);

-- Insertion de deux operators avec le même email. Résultat attendu : Insertion possible car pas d'attribut UNIQUE sur l'email de l'opérateur. Obtenu : résultats attendus. Il n'est pas utile d'avoir une contrainte sur l'email.
INSERT INTO Operator (nom, prénom, username, email, role) VALUES
('Dupont', 'Jean', 'jdupont1', 'jean.dupont@example.com', 'admin'),
('Martin', 'Sophie', 'smartin2', 'jean.dupont@example.com', 'visiteur');

-- Insertion d’un message vide ou sans email. Résultat attendu : Je n'y ai pas réfléchi. Obtanu : Insertions réussies malgré l'attribut NOT NULL de email et contenu 🤔 configuration mySQL à modifier? -> mode strict activé, je n'ai plus de soucis.
INSERT INTO Message (date_de_réception, nom, prénom, email, téléphone, contenu) VALUES
('2023-10-08 09:00:00', 'Dupont', 'Jean', '', '0475123456', ''),
('2023-10-08 10:00:00', 'Martin', 'Sophie', NULL, '0475654321', 'Contenu du message');

-- Modifications sensibles

-- Modifier un id de tag ou item utilisé ailleurs. Résultat attendu : UPDATE CASCADE : la modification se répercute partout où c'est nécessaire. Obtenu : Résultat attendu.
UPDATE Tag SET id = 999 WHERE id = 2; 
UPDATE Item SET id = 777 WHERE id = 3;

-- Changer le role d’un operator, pour un role inexistant (pas admin, user). Résultat attendu : Echec de l'update. Obtenu : Warning Data truncated. Le role 'inexistant' ne faisant pas partie de l'enum, il n'a pas remplacé le role existant (visitor), mais l'a effacé. Celà est du à l'absence de mode strict de MySQL. Conseil de Claude : activer le mode strict.
UPDATE Operator SET role = 'inexistant' WHERE id = 3;

-- Modifier un slug ou un email. 
UPDATE Item SET slug = 'nouveau-slug' WHERE id = 1; -- La modification se passe comme prévu. J'ai bien une erreur si j'essaie d'appliquer le même slug à un autre item.
UPDATE Operator SET email = 'nouvel.email@example.com' WHERE id = 1; -- idem, pas de problème à signaler.

-- Cas métier à interpréter

-- Supprimer tous les items d’un tag : le tag reste-t-il utile ? Oui, car il pourrait être réutilisé à postériori.
DELETE FROM Item_Tag WHERE tag_id = 1;

-- Supprimer tous les collection_items d’une collection : faut-il la conserver ? Dans la mesure où les collections sont créées par les users, il n'est pas pertinent de conserver une collection vide.
DELETE FROM Collection_Item WHERE collection_id = 1;

-- Créer une collection vide : est-ce logique ? Celà n'a pas de sens. Une collection doit avoir au moins 1 item. L'insertion fonctionne, mais rien n'est créé dans collection_item tant qu'aucun item n'est mis dans la collection.
INSERT INTO Collection (label, description) VALUES ('Collection Vide', 'Description de la collection vide');

-- Supprimer tous les messages d’un utilisateur : reste-t-il des données liées ? Il ne reste aucune données liée à ce message. La table message et la table operator ne sont pas liées, il n'y a aucune incidence l'une sur l'autre, même si le message supprimé contient l'email d'un operator.
DELETE FROM Message WHERE email = 'robert.howard@example.com';
