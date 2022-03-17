<?php
    setcookie("token",null, ['expires' => time()+30*3600*24,'samesite' => 'None']);
    setcookie("panier",null, ['expires' => time()+30*3600*24,'samesite' => 'None']);
?>
<meta http-equiv="refresh" content="0;URL=login.php">