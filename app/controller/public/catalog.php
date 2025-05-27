<?php

function index() {
    include_once (__DIR__."/../../model/public/catalog.php");

    $items = getItem(db());
    
    // Prepare data array for render function
    $data = [
        'head_title' => 'Catalogue - L\'Arpenteuse de l\'Indicible', // This will replace %%HEAD_TITLE%% in skeleton
        'items' => $items // This will be available in the view
    ];
    
    render('catalog/catalog.php', $data);
}

