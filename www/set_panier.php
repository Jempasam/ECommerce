<?php
    if(COOKIE_exist('token'))
    {
        $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
        
        $result=mysqli_query($db, "UPDATE compte SET panier='".$new_cookie."' WHERE token='".COOKIE_key('token')."'");
    }
?>
