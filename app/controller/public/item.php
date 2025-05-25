<?php

require_once __DIR__ . '/../../model/public/item.php';
require_once __DIR__ . '/../../config/db.php';
function index(){
    global $pdo;

        // Récupérer le slug depuis l'URL
    $uri_parts = explode('/', $_SERVER['REQUEST_URI']);
    $slug = $uri_parts[2] ?? null;

    if (!$slug){
        header('Location: /catalog');
        exit;
    }

    $item = getItem($pdo, $slug);

    if (!$item) {
        // Gérer le cas où l'item n'existe pas
        header('HTTP/1.0 404 Not Found');
        render('404.php');
        return;
    }

    render('item/item.php', ['item' => $item]);
}

/* Si ma fonction render doit appeler la vue correspondante , ici item.php, comment rendre dynamique?
ex :  l'item s'appelle Statue de Cthulhu, le slug est statue-de-cthlhu, l'URL devrait donc être SITE_ROOT.statue-de-cthulhu
item.php n'est pas vraiment appelé tel quel*/