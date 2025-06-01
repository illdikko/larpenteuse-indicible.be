<?php

function createAdminOperator($username, $password) {
    require_once 'authentication.php';
    $hashedPassword = hashPassword($password);
    
    $query = "INSERT INTO Operator (username, password, role) VALUES (?, ?, 'admin')";
    $stmt = db()->prepare($query);
    return $stmt->execute([$username, $hashedPassword]);
}


function updateOperatorPassword($operatorId, $newPassword) {
    require_once 'authentication.php';
    $hashedPassword = hashPassword($newPassword);
    
    $query = "UPDATE Operator SET password = ? WHERE id = ?";
    $stmt = db()->prepare($query);
    return $stmt->execute([$hashedPassword, $operatorId]);
}