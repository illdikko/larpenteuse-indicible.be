<?php

function index(){
      $data = [
        'head_title' => 'Termes et conditions - L\'Arpenteuse de l\'Indicible'
    ];
    render('/terms.php',$data);
}