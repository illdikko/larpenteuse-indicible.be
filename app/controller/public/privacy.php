<?php

function index(){
      $data = [
        'head_title' => 'Privacy Policy - L\'Arpenteuse de l\'Indicible'
    ];
    render('/privacy.php', $data);
}