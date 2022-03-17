<!DOCTYPE html>
<?php
    include "func.php";
    if(!isvalid($_POST['f_addresse']))echo '<meta http-equiv="refresh" content="0;URL=index.php">';
    else if(!isvalid($_POST['f_codepostal']))echo '<meta http-equiv="refresh" content="0;URL=index.php">';
    else if(!isvalid($_POST['f_prenom']))echo '<meta http-equiv="refresh" content="0;URL=index.php">';
    else if(!isvalid($_POST['f_nom']))echo '<meta http-equiv="refresh" content="0;URL=index.php">';
    else if(COOKIE_key('session_token')==GET_key('sid'))
    {
        $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
        $compte='NULL';
        if(COOKIE_exist('token'))
        {
            $result=mysqli_query($db, "SELECT * FROM compte WHERE token='".COOKIE_key('token')."'");
            if(!$result);
            else $compte=mysqli_fetch_array($result)['id_compte'];
        }
        $query="INSERT INTO commande
                                    (panier,addresse,codepostal,prenom,nom,compte)
                                    VALUES
                                    ('".getpanier()."','".$_POST['f_addresse']."',".$_POST['f_codepostal'].",'".$_POST['f_prenom']."','".$_POST['f_nom']."',".$compte.")";
        mysqli_query($db, $query) or die('Error querying database.');

        echo '<meta http-equiv="refresh" content="0;URL=message.php?m=Commande effectuée">';
        setcookie("panier",null, ['expires' => time()+30*3600*24,'samesite' => 'None']);
        include "set_panier.php";
    }
    else echo '<meta http-equiv="refresh" content="0;URL=index.php">';
?>