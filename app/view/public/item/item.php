<main>
    <div classe="caroussel">

        <!-- Modifier ensuite pour un caroussel dynamique : autant de div que d'images pour l'item -->
        <div class="carousel-picture">
            <img src="/images/<?= $data['item']['slug'] ?>/<?= $data['item']['primary_picture'] ?>" alt="Photo de l'article 1">
        </div>
        <div class="carousel-picture">
            <img src="/api/placeholder/800/600" alt="Photo de l'article 2">
        </div>

        <!-- flèches précédent/suivant -->
        <div class="carousel-controls">
            <button class="carousel-control" id="prev">&lt;</button>
            <button class="carousel-control" id="next">&gt;</button>
        </div>

        <!-- petites billes au bas du caroussel indiquant le nombre total de photos + celle sur laquelle on se trouve dans la série -->
        <div class="carousel-indicators" id="indicators">
            <!-- Indicateurs ajoutés dynamiquement via JavaScript -->
        </div>

    </div>

    <h2><?php echo $data['item']['label']; ?></h2>
    <p><?php echo $data['item']['prix']; ?></p>
    <p><?php echo $data['item']['description']; ?></p>
</main>