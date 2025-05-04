<?php

require_once __DIR__ . "/../../config/db.php";

function getItem($pdo) {
    try {
        $stmt = $pdo->prepare("SELECT * FROM item");
        $stmt->execute();
        $results = $stmt->fetchAll();
        
        // Add debug information
        error_log("Number of items found: " . count($results));
        error_log("SQL Query: SELECT * FROM item");
        
        return $results;
    } catch(PDOException $e) {
        error_log("Error fetching items: " . $e->getMessage());
        return [];
    }
}