<?php
    include "func.php";
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
    
    if(isValid($_POST['mdp']) && filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
    {
        $result=mysqli_query($db, "SELECT * FROM compte WHERE mail='".$_POST['email']."' AND token='".hash('sha256',$_POST['email'].';'.$_POST['mdp']."toucan")."'") or die('Error querying database.');
        if(mysqli_num_rows($result)!=0)
        {
            $user=mysqli_fetch_array($result);
            setcookie("token",$user['token'], ['expires' => time()+6*3600,'samesite' => 'Strict']);
            setcookie("panier",$user['panier'], ['expires' => time()+30*3600*24,'samesite' => 'Strict']);
            echo '<meta http-equiv="refresh" content="0;URL=index.php">';
        }
        else echo '<meta http-equiv="refresh" content="0;URL=login.php?message=Les identifiants sont invalides">';
    }
    else echo '<meta http-equiv="refresh" content="0;URL=login.php?message=Les identifiants sont invalides">';
?>
