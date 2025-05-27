<?php

require_once __DIR__ . '/../../model/public/item.php';

function index(){
    

    // Récupérer le slug depuis l'URL
    $uri_parts = explode('/', $_SERVER['REQUEST_URI']);
    $slug = $uri_parts[2] ?? null;

    if (!$slug){
        header('Location: /catalog');
        exit;
    }

    $item = getItem(db(), $slug);

    if (!$item) {
        // Gérer le cas où l'item n'existe pas
        header('HTTP/1.0 404 Not Found');
        render('404.php');
        return;
    }

    $data = [
        'head_title' => 'Accueil - L\'Arpenteuse de l\'Indicible',
        'item' => $item
    ];

    render('item/item.php', $data);
}