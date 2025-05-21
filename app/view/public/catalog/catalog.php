<?php
// Access items through the $data array
$items = $data['items'] ?? [];
?>

<?php if (!empty($items)): ?>

    <?php foreach ($items as $item): ?>
        <article class="item-card">
            <img class="item-img" src="/assets/images/<?php echo $item['primary_picture']; ?>"
                alt="<?php echo $item['label']; ?>">
            <a href="<?php echo $item['slug']; ?>"><h2 class="item-card-title"><?php echo $item['label']; ?></h2></a>
            <p class="item-description"><?php echo $item['description']; ?></p>
            <p class="item-price"><?php echo number_format((float) $item['prix'], 2, ',', ' '); ?> €</p>
        </article>
    <?php endforeach; ?>

<?php else: ?>
    <p>No items found.</p>
<?php endif; ?>