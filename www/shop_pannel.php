<?php
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
    $result=mysqli_query($db, $query) or die('Error querying database.');
    $row_num=mysqli_num_rows($result);
    if(!isset($max_article))$max_article=-1;
    
    $i=0;
    if(isset($query_offset))mysqli_data_seek($result,$query_offset);
    while ($row = mysqli_fetch_array($result)) {
            echo '<li>';
            echo '<a href="article.php?produit='.$row['id_produit'].'">';
            echo '<img src="photo/'.$row['photo'].'"/>'.$row['nom'];

            echo '<div class="rating">
                    <span>'.str_repeat('★',$row['note']).'</span><span>'.str_repeat('★',5-$row['note']).'</span>
                  </div>';
        
            $base_price=$row['prix_ht']; $categorie=$row['id_categorie']; $tva=$row['taux_tva'];
            include "price.php";
            
            echo '</a>';
            echo '</li>';
            ++$i; if($i==$max_article)break;
    }

    mysqli_close($db);
?>