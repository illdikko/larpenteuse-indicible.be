<?php
// Access items through the $data array
$items = $data['items'] ?? [];
?>

<?php if (!empty($items)): ?>

    <?php foreach ($items as $item): ?>
        <article class="item-card" data-item-slug="">
            <img class="item-img" src="/images/<?= $item['slug']; ?>/<?= $item['primary_picture']; ?>"
                alt="<?= $item['label']; ?>">
            <a href="/item/<?= $item['slug']; ?>">
                <h2 class="item-card-title"><?= $item['label']; ?></h2>
            </a>
            <p class="item-description"><?= $item['description']; ?></p>
            <p class="item-price"><?= number_format((float) $item['prix'], 2, ',', ' '); ?> €</p>
        </article>
    <?php endforeach; ?>

<?php else: ?>
    <p>No items found.</p>
<?php endif; ?>