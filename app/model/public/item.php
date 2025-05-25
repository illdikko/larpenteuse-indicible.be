<?php

require_once __DIR__ . "/../../config/db.php";

//Même requête que pour le catalogue... où est l'erreur? Il fallait préciser la recherche par slug.
function getItem($pdo, $slug) {
    try {
        $stmt = $pdo->prepare("SELECT * FROM item WHERE slug=:slug");
        $stmt->execute(['slug'=> $slug]);
        $results = $stmt->fetch();
        
        // Add debug information
        error_log("Item found with slug: " . $slug);
        error_log("SQL Query: SELECT * FROM item WHERE slug=:slug");
        
        return $results;
    } catch(PDOException $e) {
        error_log("Error fetching item: " . $e->getMessage());
        error_log("No item found with slug: " . $slug);

        return null;
    }
}