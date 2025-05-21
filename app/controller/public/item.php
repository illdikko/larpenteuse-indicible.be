<?php

function index(){
    render('item/item.php');
}

/* Si ma fonction render doit appeler la vue correspondante , ici item.php, comment rendre dynamique?
ex :  l'item s'appelle Statue de Cthulhu, le slug est statue-de-cthlhu, l'URL devrait donc être SITE_ROOT.statue-de-cthulhu
item.php n'est pas vraiment appelé tel quel*/