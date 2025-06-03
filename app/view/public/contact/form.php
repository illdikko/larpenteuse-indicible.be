<form action="/contact/send" method="POST">
    <div>
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" value="<?= $data['post_data']['nom']; ?>" required>
    </div>
    <div>
        <label for="prenom">Prénom</label>
        <input type="text" name="prenom" id="prenom" value="<?= $data['post_data']['prenom']; ?>" required>
    </div>
    <div>
        <label for="email">Email</label>
        <input type="text" name="email" id="email" value="<?= $data['post_data']['email']; ?>" required>
    </div>

    <div>
        <label for="sujet">Sujet</label>
        <input type="text" name="sujet" id="sujet" value= "<?= $data['post_data']['sujet']; ?>">
    </div>

    <div>
        <label for="contenu">Message</label>
        <textarea name="contenu" id="contenu" required><?= $data['post_data']['contenu']; ?></textarea>
    </div>
    <button type="submit">Send</button>
</form>

<div>
    <!-- Insérer réseaux sociaux -->
</div>