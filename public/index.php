<?php

define('SITE_ROOT', __DIR__ . '/../');
$uri_parts = explode('/', $_SERVER['REQUEST_URI']);
array_shift($uri_parts);

if(empty($uri_parts[0])){
    $controller = 'home';
}
else{
    $controller = $uri_parts[0];
}

if(empty($uri_parts[1])){
    $action = 'index';
}
else{
    $action = $uri_parts[1];
}

$controller_path = SITE_ROOT . "app/controller/public/$controller.php";

if(file_exists($controller_path)){
    include($controller_path);

    if(function_exists($action)){
        // echo "$controller has function $action";

        if($action == 'send') {
            // Include database connection
            require_once SITE_ROOT . 'app/config/db.php';
            // Call the function with required parameters
            call_user_func($action, $pdo, $_POST);
        } else {
            // Call function without parameters for other actions
            call_user_func($action);
        }
    } else {
        http_response_code(404);
        exit("404 Function « {$action} » in Controller « {$controller} » does not exist");
    }
}
else{
    http_response_code(404);
    exit("404 Controller « {$controller} » non trouvé");
}

function render($partial, $data = [])
{
    $skeleton = SITE_ROOT . 'app/view/public/skeleton.html';
    $partial = SITE_ROOT . 'app/view/public/' . $partial;

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