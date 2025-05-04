<?php

$host = 'localhost';
$db   = 'atelier_arpenteuse';
$user = 'atelier_arpenteuse';
$pass = 'QIxzS[(R0J7ck)z)';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false
];

$pdo = new PDO($dsn, $user, $pass, $options);