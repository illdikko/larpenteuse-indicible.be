<?php

function insertContactMessage($arien, $data) {
    try {
        $stmt = db()->prepare("INSERT INTO message 
            (nom, prenom, email, sujet, contenu, date_de_reception, is_read) 
            VALUES (:nom, :prenom, :email, :sujet, :contenu, NOW(), 0)");

        return $stmt->execute([
            ':nom' => $data['nom'],
            ':prenom' => $data['prenom'],
            ':email' => $data['email'],
            ':sujet' => $data['sujet'],
            ':contenu' => $data['contenu']
        ]);

    } catch(PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        return false;
    }
}

?>
