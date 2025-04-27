-- Operator

id (PK)
nom
prénom
username
email
role (admin, visiteur)
last_login
created_at
deleted_at

--Tag

id (PK)
label
slug

--Item

id (PK)
type (bota, zoo, brol)
label
slug
date_de_mise_en_vente
created_at
updated_at
description
primary_picture
secondary_picture
prix
operator_id (FK)

--Message

id (PK)
date_de_réception
nom
prénom
email
téléphone
contenu
is_read

--Collection

id (PK)
label
description
created_at
Relations

--Item_Tag

item_id (FK) référence Item(id)
tag_id (FK) référence Tag(id)

--Collection_Item

collection_id (FK) référence Collection(id)
item_id (FK) référence Item(id)


OPERATOR -- 1:N -- ITEM : "gère"
ITEM -- 1:N -- TAG : "a"
TAG -- 1:N -- ITEM : "est attribué à"
COLLECTION -- N:N -- ITEM : "contient" 