<main>
    <div class="login-container">
        <form action="/admin/login/authenticate" method="POST" class="login-form">
            <h2>Connexion Administration</h2>
            <?php if (isset($_GET['error'])): ?>
                <div class="error-message">Identifiants incorrects</div>
            <?php endif; ?>
            <div class="form-group">
                <label for="username">Nom d'utilisateur</label>
                <input type="text" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Se connecter</button>
        </form>
    </div>
</main>