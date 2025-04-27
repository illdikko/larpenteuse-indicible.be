<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    <pre> 
    <?php
    var_dump('_GET:',$_GET);
    var_dump('_SERVER:', $_SERVER['REQUEST_URI']);
    
    $uri_parts = explode('/', $_SERVER['REQUEST_URI']);
    var_dump($uri_parts);

    array_shift($uri_parts);
    var_dump($uri_parts);

    $controller= $uri_parts[0];
    $action=$uri_parts[1];
    
    $controller_path=__DIR__."/../app/controller/public/$controller.php";
    var_dump($controller_path);
    if(file_exists($controller_path)){
        include $controller_path;

        if(function_exists($action)){
            echo "$controller has function $action";
        }else{
            echo "404 Controller not found.";
        }
};


    
    ?>
</pre>

    <H1>L'Arpenteuse</H1>
</body>
</html>