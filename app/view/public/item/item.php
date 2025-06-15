<main data-item-slug="<?= $data['item']['slug']; ?>">
    <div class="carousel">
        <div class="carousel-container">
            <div class="carousel-picture active">
                <img src="/images/<?= $data['item']['slug'] ?>/<?= $data['item']['primary_picture'] ?>" alt="Photo de l'article 1">
            </div>
            <div class="carousel-picture">
                <img src="/images/<?= $data['item']['slug'] ?>/<?= $data['item']['secondary_picture'] ?>" alt="Photo de l'article 2">
            </div>

            <div class="carousel-controls">
                <button class="carousel-control" id="prev">&lt;</button>
                <button class="carousel-control" id="next">&gt;</button>
            </div>

            <div class="carousel-indicators" id="indicators"></div>
        </div>
    </div>
    
    <h2><?= $data['item']['label']; ?></h2>
    <p><?= $data['item']['prix']; ?></p>
    <p><?= $data['item']['description']; ?></p>

    <button class="add-to-cart">Ajouter au panier</button>
    <button class="sub-from-cart">Retirer du panier</button>
</main>