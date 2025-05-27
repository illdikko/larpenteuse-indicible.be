<?php

function index(){
    $data=['head_title' => 'About - L\'Arpenteuse de l\'Indicible'];
    render('about/about.php', $data);
}

