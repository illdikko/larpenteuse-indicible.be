<?php

function index() {
    // Si l'utilisateur est déjà connecté, rediriger vers home
    if (isset($_SESSION['admin'])) {
        header('Location: /admin/home');
        exit();
    }
    
    require_once SITE_ROOT . 'app/view/admin/login.php';
}

function authenticate() {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $username = $_POST['username'] ?? '';
        $password = $_POST['password'] ?? '';
        
        if ($username === 'admin' && $password === 'admin') {
            $_SESSION['admin'] = true;
            header('Location: /admin/home');
            exit();
        } else {
            // Redirection avec paramètre d'erreur
            header('Location: /admin/login?error=1');
            exit();
        }
    } else {
        // Si ce n'est pas une requête POST, rediriger vers la page de login
        header('Location: /admin/login');
        exit();
    }
}