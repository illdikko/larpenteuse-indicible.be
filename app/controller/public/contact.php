<?php
// Access items through the $data array
?>

<?php
require_once __DIR__ . "/../../model/public/contact.php";

function cleanInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    return $data;
}

function index()
{
    $data = [];
    $data['head_title'] = 'Contact - L\'Arpenteuse de l\'Indicible';
    $data['post_data'] = [
        'nom' => '',
        'prenom' => '',
        'email' => '',
        'sujet'=> '',
        'contenu' => ''
    ];
    render('contact/form.php', $data);
    // include SITE_ROOT . 'app/view/public/contact/form.php';

}

function send(db(), $formData)
{
    // Clean and validate input data
    $cleanData = [
        'nom' => cleanInput($formData['nom'] ?? ''),
        'prenom' => cleanInput($formData['prenom'] ?? ''),
        'email' => cleanInput($formData['email'] ?? ''),
        'sujet' => cleanInput($formData['sujet'] ?? ''),
        'contenu' => cleanInput($formData['contenu'] ?? '')
    ];

    // Validate required fields
    $errors = [];
    if (empty($cleanData['nom'])) $errors[] = "Le nom est requis";
    if (empty($cleanData['prenom'])) $errors[] = "Le prénom est requis";
    if (empty($cleanData['email'])) {
        $errors[] = "L'email est requis";
    } elseif (!filter_var($cleanData['email'], FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Format d'email invalide";
    }
    if (empty($cleanData['sujet'])) $errors[] = "Le sujet est requis";

    if (empty($cleanData['contenu'])) $errors[] = "Le message est requis";

    if (!empty($errors)) {
        $data = [];
        $data['error'] = implode(', ', $errors);
        $data['post_data'] = $formData;
        $data['head_title'] = 'Contact - Error';
        render('contact/form.php', $data);
        return;
    }

    // Call model function to insert data
    if (insertContactMessage(db(), $cleanData)) {
        render('contact/success.php');
    } else {
        $data = [];
        $data['error'] = "Une erreur est survenue lors de l'envoi du message";
        $data['post_data'] = $formData;
        $data['head_title'] = 'Contact - Error';
        render('contact/form.php', $data);
    }
}
?>