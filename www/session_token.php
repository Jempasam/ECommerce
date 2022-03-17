<?php
    if(!isset($_COOKIE['session_token']))
    {
        setcookie( "session_token", hash('sha256',uniqid()), ['expires' => time()+30*60,'samesite' => 'Strict'] );
    }
    else
    {
        setcookie( "session_token", $_COOKIE['session_token'], ['expires' => time()+30*60,'samesite' => 'Strict'] );
    }
?>
