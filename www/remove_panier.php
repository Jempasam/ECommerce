<?php
    include "func.php";

    if( COOKIE_exist('session_token') && COOKIE_key('session_token')==GET_key('sid') )
    {
        if(GET_exist('n'))$count=GET_num('n');
        else $count=1;
        if(panier_exist())
        {
            $to_remove=GET_num('num');
            $new_cookie="";

            $panier=explode(";",getpanier());
            $num=0;
            if(count($panier)>0)
            foreach($panier as $info_produit)
            {
                if($to_remove==$num)
                {
                    $infos_produit=explode(':',$info_produit);
                    if($infos_produit[1]>$count)
                    {
                        $new_cookie.=($infos_produit[0]).':'.($infos_produit[1]-$count);
                        for($i=2; $i<count($infos_produit); ++$i)
                        $new_cookie.=':'.$infos_produit[$i];
                        $new_cookie.=';';
                    }
                }
                else
                {
                    $new_cookie.=$info_produit.';';
                }
                ++$num;
            }
            $new_cookie=substr($new_cookie,0,-1);
            setcookie("panier",$new_cookie, ['expires' => time()+30*3600*24,'samesite' => 'Strict']);
            include "set_panier.php";
        }
    }
    echo '<meta http-equiv="refresh" content="0;URL=pannier2.php">';
?>