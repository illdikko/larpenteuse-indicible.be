<?php

function getOperatorByUsername( $username) {
    $query = "SELECT id, username, password, role 
              FROM Operator 
              WHERE username = ? 
              AND deleted_at IS NULL 
              AND role = 'admin' 
              LIMIT 1";
              
    $stmt = db()->prepare($query);
    $stmt->execute([$username]);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function hashPassword($password) {
    return password_hash($password, PASSWORD_DEFAULT);
}