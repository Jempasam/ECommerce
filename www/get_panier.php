<?php
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');

    setcookie(
                "token",
                mysqli_fetch_array(mysqli_query($db, "SELECT * FROM compte WHERE token='".GET_key('token')."'"))['panier'],
                ['expires' => time()+30*3600*24,'samesite' => 'Strict']
             );
?>
