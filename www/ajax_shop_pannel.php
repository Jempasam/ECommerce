<?php
    include "func.php";
    if(GET_exist('n'))$number=GET_num('n');
    else $number=16;
    
    if(GET_exist('s'))
    {
        $number=$number+GET_num('s');
        $start=GET_num('s');
    }
    else $start=0;
    
    if(GET_exist('on'))
    {
        $order='ORDER BY C.id_produit DESC';
    }
    else $order='';

    $query_offset=$start;
    $query="SELECT * FROM produit C ".$order." LIMIT ".$number;

    include 'shop_pannel.php';
?>