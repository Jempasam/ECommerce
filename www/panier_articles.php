<?php include "func.php" ?>
<main id="panier">
    <?php if(!GET_exist('nt')): ?> <h2>Mon panier</h2> <?php endif ?>
    <ul>
        <?php
            $total=0;
            if(panier_exist())
            {
                $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');

                $panier=explode(";",getpanier());
                $num=0;
                if(count($panier)>0)
                foreach($panier as $info_produit)
                {
                    $infos_produit=explode(":",$info_produit);

                    $result=mysqli_query($db, "SELECT * FROM produit WHERE id_produit=".$infos_produit[0]." LIMIT 1") or die('Error querying database.');
                    $article=mysqli_fetch_array($result);
                    echo '<li id="panieritem'.$num.'">
                            <img src="photo/'.$article['photo'].'"/>
                            <div>
                                '.$article['nom'].'
                                <div>';
                    $base_price=$article['prix_ht']; $categorie=$article['id_categorie']; $tva=$article['taux_tva'];
                    include "price.php";
                    echo           '<div>
                                        qté:
                                        <div>'.$infos_produit[1].'</div>';
                    if(!GET_exist('nc')) 
                    {
                        echo                '<a onclick="edit(\'f=d&num='.$num.'&sid='.COOKIE_key('session_token').'\');">';
                        load_svg("down.php");
                        echo                '</a>
                                            <a onclick="edit(\'f=u&num='.$num.'&sid='.COOKIE_key('session_token').'\');">';
                        pload_svg("down.php","rotate(180)");
                        echo                '</a>
                                            <a onclick="edit(\'f=d&num='.$num.'&sid='.COOKIE_key('session_token').'&n=5\');">';
                        load_svg("ddown.php");
                        echo                '</a>
                                            <a onclick="edit(\'f=u&num='.$num.'&sid='.COOKIE_key('session_token').'&n=5\');">';
                        pload_svg("ddown.php","rotate(180)");
                        echo                '</a>';
                    }
                    
                    echo           '</div>';
                    echo        '</div>';
                    echo    '</div>';
                    if(!GET_exist('nc'))
                    {
                        echo                '<a onclick="edit(\'f=d&num='.$num.'&sid='.COOKIE_key('session_token').'&n=9999999\');">';
                        load_svg("trash-can.svg");
                        echo                '</a>';
                    }
                    echo'</li>';
                    ++$num;
                    $total+=$price_tva*$infos_produit[1];
                }
                mysqli_close($db);
            }
        ?>
    </ul>
    <?php if(!GET_exist('np')): ?> <h3>Prix du panier</h3><div class="price" --currency="€" style="display:block;"><?php echo $total ?></div> <?php endif ?>
    
    <?php if(!GET_exist('nb')): ?> <a href="commander.php" target="_PARENT">Commander</a> <?php endif ?>
</main>