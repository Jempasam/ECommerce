<!DOCTYPE html>
<?php
    include "func.php";
    $parameters="";
    if(GET_letters('o')!="")
    {
        $parameters="o=".GET_letters('o');
    }
    if(GET_num('c')!="")
    {
        if($parameters!="")$parameters.="&";
        $parameters.="c=".GET_num('c');
    }
    if(GET_exist('p'))
    {
        if($parameters!="")$parameters.="&";
        $parameters.="p";
    }

    echo '<meta http-equiv="refresh" content="0;URL=search.php?'.$parameters.'">';
?>
