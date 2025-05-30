<?php

define('SITE_ROOT', __DIR__ . '/../../');

// Parse l'URI en retirant les paramètres GET
$request_uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri_parts = explode('/', trim($request_uri, '/'));

// Debug - vous pouvez retirer cette ligne une fois que ça fonctionne
error_log("URI: " . $request_uri);
error_log("URI parts: " . print_r($uri_parts, true));

// Remove 'admin' from path
array_shift($uri_parts);

require_once SITE_ROOT . 'app/config/db.php';

session_start();

// Set default controller and action
$controller = !empty($uri_parts[0]) ? $uri_parts[0] : 'login';
$action = !empty($uri_parts[1]) ? $uri_parts[1] : 'index';

// If logged in and trying to access login page, redirect to home
if (isset($_SESSION['admin']) && $controller === 'login' && $action === 'index') {
    header('Location: /admin/home');
    exit();
}

// Check if user is logged in for non-login pages
if (!isset($_SESSION['admin']) && $controller !== 'login') {
    header('Location: /admin/login');
    exit();
}

$controller_path = SITE_ROOT . "app/controller/admin/$controller.php";

if(file_exists($controller_path)){
    include($controller_path);
    
    if(function_exists($action)){
        call_user_func($action);
    } else {
        http_response_code(404);
        exit("404 Function « {$action} » in Controller « {$controller} » does not exist");
    }
} else {
    http_response_code(404);
    exit("404 Controller « {$controller} » non trouvé");
}

function render($partial, $data = [])
{
    $skeleton = SITE_ROOT . 'app/view/admin/skeleton.html';
    $partial = SITE_ROOT . 'app/view/admin/' . $partial;

    if (empty($data['head_title'])) {
        $data['head_title'] = 'Administration';
    }

    $page = file_get_contents($skeleton);

    ob_start();
    include($partial);
    $partial = ob_get_clean();
    
    if(!empty($data['head_title'])){
        $page = str_replace('%%HEAD_TITLE%%', $data['head_title'], $page);
    }
    $page = str_replace('%%MAIN_CONTENT%%', $partial, $page);
    echo $page;
}
?>