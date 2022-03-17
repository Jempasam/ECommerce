 <?php
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');

    $result=mysqli_query($db, "SELECT C.nom FROM categorie C WHERE C.id_categorie=0") or die('Error querying database.');

    mysqli_close($db);
?>
