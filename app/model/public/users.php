<?php
//Il serait possible d'optimiser cette fonction et la fonction createAdminOperator (operators.php) pour mieux respecter la règle DRY.
function createUserOperator($username, $password) {
    require_once 'authentication.php';
    $hashedPassword = hashPassword($password);
    
    $query = "INSERT INTO Operator (username, password, role) VALUES (?, ?, 'user')";
    $stmt = db()->prepare($query);
    return $stmt->execute([$username, $hashedPassword]);
}

//ne respecte pas la règle DRY mais fait sens ici je trouve. (fonction répétée dans operators.php)
function updateOperatorPassword($operatorId, $newPassword) {
    require_once 'authentication.php';
    $hashedPassword = hashPassword($newPassword);
    
    $query = "UPDATE Operator SET password = ? WHERE id = ?";
    $stmt = db()->prepare($query);
    return $stmt->execute([$hashedPassword, $operatorId]);
}