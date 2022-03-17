<?php
    include "func.php";
    if( isset($_COOKIE['session_token']) && $_COOKIE['session_token']==$_GET['sid'] )
    {
        $new_article=GET_num('produit');

        if(panier_exist() and getpanier()!="")
            $new_cookie=getpanier().';'.$new_article.':1';
        else
            $new_cookie=$new_article.':1';

        for($i=0; $i<4; ++$i)
        {
            if(GET_exist('param'.$i))
            {
                $new_cookie.=':'.GET_num('param'.$i);
            }
            else break;
        }

        setcookie("panier",$new_cookie, ['expires' => time()+30*3600*24,'samesite' => 'Strict']);
        include "set_panier.php";
    }
    echo '<meta http-equiv="refresh" content="0;URL=pannier2.php">';
?>