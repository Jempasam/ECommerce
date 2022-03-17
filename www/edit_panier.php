<?php
    include "func.php";
    if( COOKIE_exist('session_token') and GET_exist('sid') and COOKIE_key('session_token')==GET_key('sid') )
    {
        if(GET_exist('f') and GET_letters('f')=='a')
        {
            $new_article=GET_num('produit');

            if(panier_exist() and getpanier()!="") $new_cookie=getpanier().';'.$new_article.':1';
            else $new_cookie=$new_article.':1';

            for($i=0; $i<4; ++$i)
            {
                if(GET_exist('param'.$i)) $new_cookie.=':'.GET_num('param'.$i);
                else break;
            }
            
            setcookie("panier",$new_cookie, ['expires' => time()+30*3600*24,'samesite' => 'Strict']);
        }
        else if( GET_exist('f') and (GET_letters('f')=='u' or GET_letters('f')=='d') )
        {
            if(GET_exist('n')){
                if(GET_letters('f')=='u') $count=GET_num('n');
                if(GET_letters('f')=='d') $count=-GET_num('n');
            }else{
                if(GET_letters('f')=='u') $count=1;
                if(GET_letters('f')=='d') $count=-1;
            }
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
                        if($infos_produit[1]+$count>0)
                        {
                            $new_cookie.=($infos_produit[0]).':'.($infos_produit[1]+$count);
                            for($i=2; $i<count($infos_produit); ++$i)
                            $new_cookie.=':'.$infos_produit[$i];
                            $new_cookie.=';';
                        }
                    }
                    else $new_cookie.=$info_produit.';';
                    ++$num;
                }
                $new_cookie=substr($new_cookie,0,-1);
                setcookie("panier",$new_cookie, ['expires' => time()+30*3600*24,'samesite' => 'Strict']);
            }
        }
        include "set_panier.php";
    }
?>