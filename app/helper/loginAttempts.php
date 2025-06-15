<?php

const MAX_ATTEMPTS = 3;        // Maximum failed attempts
const LOCKOUT_TIME= 900;      // 15 minutes lockout
const ATTEMPT_WINDOW= 3600;   // 1 hour window

function recordFailedAttempt($userId) {
    $query = "INSERT INTO login_attempts (user_id, attempt_time) VALUES (?, NOW())";
    $stmt = db()->prepare($query);
    $stmt->execute([$userId]);
}

function isAccountLocked($userId) {
    $query = "SELECT COUNT(*) as attempts, 
              MAX(attempt_time) as last_attempt 
              FROM login_attempts 
              WHERE user_id = ? 
              AND attempt_time > DATE_SUB(NOW(), INTERVAL ? SECOND)";
    
    $stmt = db()->prepare($query);
    $stmt->execute([$userId, ATTEMPT_WINDOW]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($result['attempts'] >= MAX_ATTEMPTS) {
        $lastAttempt = strtotime($result['last_attempt']);
        $timeSinceLastAttempt = time() - $lastAttempt;
        
        if ($timeSinceLastAttempt < LOCKOUT_TIME) {
            return true;
        }
        
        clearFailedAttempts($userId);
    }
    
    return false;
}

function clearFailedAttempts($userId) {
    $query = "DELETE FROM login_attempts WHERE user_id = ?";
    $stmt = db()->prepare($query);
    $stmt->execute([$userId]);
}