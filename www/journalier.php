<?php
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
    mysqli_query($db, "DELETE FROM promotion
                       WHERE date_fin<CURRENT_DATE") or die('Error querying database.');

    mysqli_query($db, "UPDATE produit
                       SET en_promotion=false") or die('Error querying database.');

    mysqli_query($db, "UPDATE produit
                       SET en_promotion=true
                       WHERE id_produit IN (SELECT id_produit FROM promoted_item)") or die('Error querying database.');

    mysqli_close($db);
?>