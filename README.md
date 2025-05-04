# larpenteuse-indicible

# Projet CMS MVC PHP

Ce projet est un système de gestion de contenu (CMS) développé avec une architecture MVC (Modèle-Vue-Contrôleur) en PHP. Il a été réalisé dans le cadre d'un projet de fin d'études.
Le cahier des charges peut être trouvé ici : https://github.com/EFP-DEV/1-X75-Atelier/blob/main/README.md .

## 🌟 Fonctionnalités

- **Architecture MVC** structurée et extensible
- **Front-end responsive** adapté à tous les appareils
- **Back-office sécurisé** avec authentification administrateur
- **Gestion complète des contenus** (CRUD)
- **Système de tags** pour organiser et filtrer le contenu
- **Gestion des messages** des visiteurs
- **Visitor token** pour suivre les préférences utilisateurs

## 📋 Prérequis techniques

- Environnement LAMP (Linux, Apache, MySQL, PHP)
- PHP >= 8.2
- MySQL >= 8.0
- Git pour la gestion de versions

## 🏗️ Structure du projet

```
project/
├── app/                    # Logique de l'application
│   ├── controllers/        # Contrôleurs
│   ├── models/             # Modèles
│   ├── services/           # Services métier
│   └── views/              # Vues et templates
├── config/                 # Configuration
├── database/               # Scripts SQL et migrations
├── public/                 # Point d'entrée et assets publics
│   ├── css/                # Styles CSS
│   ├── js/                 # JavaScript
│   ├── images/             # Images
│   └── index.php           # Point d'entrée
├── src/                    # Classes utilitaires et core
│   ├── Core/               # Classes du framework MVC
│   └── Utils/              # Classes utilitaires
└── tests/                  # Tests unitaires et fonctionnels
```

## 💻 Technologies utilisées

- PHP 8.2+ (Architecture MVC personnalisée)
- MySQL 8.0+
- HTML5 sémantique
- CSS3 (Variables CSS et design responsive)
- JavaScript (Amélioration UX/UI, gestion visitor_token)
- Git (Gestion de versions)

## 📝 Planning de développement

Le projet est développé selon les phases suivantes:

1. **Phase 1: Préparation et Conception (8h)**
   - Définition du site et du thème
   - Création des wireframes
   - Mise en place de l'environnement LAMP et Git
   - Implémentation de la structure MVC

2. **Phase 2: Front-End (40h)**
   - Création des templates HTML
   - Développement CSS responsive
   - Implémentation du visitor_token en JavaScript
   - Amélioration UX/UI

3. **Phase 3: Back-Office (24h)**
   - Système d'authentification administrateur
   - CRUD pour les contenus
   - Gestion des tags
   - Interface de gestion des messages

4. **Phase 4: Finalisation (8h)**
   - Tests fonctionnels
   - Documentation du code
   - Mise en place des jeux de données de démonstration

## 🧪 Tests et validation

- HTML validé W3C
- Accessibilité WCAG 2.1 AA
- Tests de performance Lighthouse: 
  - Performance: 85+
  - Accessibilité: 90+
- Compatibilité cross-browser (Chrome, Firefox, Safari)