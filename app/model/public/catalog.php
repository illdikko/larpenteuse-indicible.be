<?php


function getItem() {
    try {
        $stmt = db()->prepare("SELECT * FROM item");
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