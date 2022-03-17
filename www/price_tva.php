<?php
    include "price.php";
    echo '<span style="font-size:0.9em;color:grey;" class="price" --currency="€">';
    if($price!=$base_price)echo '<span style="text-decoration: line-through;">'.$base_price.'</span> <span>'.$price.'</span>';
    else echo '<span>'.$price.'</span>';
    echo '</span><span style="font-size:0.8em;color:grey;">hors taxes</span>';
?>