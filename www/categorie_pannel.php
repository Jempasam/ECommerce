<?php
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
    $result=mysqli_query($db, $query) or die('Error querying database.');
    if(!isset($param))$param="";

    while ($row = mysqli_fetch_array($result)) {
        $result2=mysqli_query($db, "SELECT * FROM categorie C WHERE C.parent=".$row['id_categorie']) or die('Error querying database.');
        if(mysqli_num_rows($result2)!=0)
        {
            echo '<li class="menu">';
            echo '<a href="search.php?'.$param.'c='.$row['id_categorie'].'">'.$row['nom'].'</a>';
            echo '<ul>';
            while ($row2 = mysqli_fetch_array($result2)) {
                echo '<li><a href="search.php?'.$param.'c='.$row2['id_categorie'].'">'.$row2['nom'].'</a></li>';
            }
            echo '</ul></li>';
        }
        else
        {
            echo '<li><a href="search.php?'.$param.'c='.$row['id_categorie'].'">'.$row['nom'].'</a></li>';
        }
    }

    mysqli_close($db);
?>