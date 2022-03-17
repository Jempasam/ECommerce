<!DOCTYPE html>

<?php include "session_token.php" ?>
<?php include "func.php" ?>

<html lang="fr">

<?php include "head.html" ?>

<?php include "svg.html" ?>


<body>
    <?php include "header.php" ?>
    <main class="shop">
        <div id="left_shop_pannel">
            <ul>
                <?php
                    $query="SELECT * FROM categorie C WHERE C.parent IS NULL ";
                    include "categorie_pannel.php";
                ?>
            </ul>
        </div>
        <?php
            $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
            $result=mysqli_query($db, "SELECT * FROM produit WHERE id_produit=".GET_num('produit')) or die('Error querying database.');
            $article=mysqli_fetch_array($result);
        ?>
        <div id="middle_shop_pannel">
            <form action="add_panier.php" method="put" target="panier_frame">
            <input type=hidden name="sid" value="<?=COOKIE_key("session_token")?>"/>
            <input type="hidden" name="produit" value="<?php echo GET_num('produit') ?>"/>
            <div id="article_pannel_top">
                <div id="article_pannel_top_left">
                    <div id="apparence">
                        <div id="cadre_photo">
                            <h2><?php echo $article['nom'] ?></h2>
                            <div class="rating">
                                <?php echo '<span>'.str_repeat('★',$article['note']).'</span><span>'.str_repeat('★',5-$article['note']).'</span>'; ?>
                            </div>
                            <?php echo '<img src="photo/'.$article['photo'].'"/>' ?>
                        </div>
                        <div id="option">
                            <?php
                                $num=0;
                                $result=mysqli_query($db, "SELECT * FROM parametre WHERE id_produit=".GET_num('produit')) or die('Error querying database.');
                                while($parametre=mysqli_fetch_array($result))
                                {
                                    echo $parametre['nom'];
                                    if($parametre['option1'][0]=='#')
                                    {
                                        echo '<div id="palette">';
                                        if($parametre['option1']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4).'" value=0 checked />
                                                  <label for="param'.($num*4).'" style="background:'.$parametre['option1'].'"></label>';
                                        }
                                        if($parametre['option2']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4+1).'" value=1 />
                                                  <label for="param'.($num*4+1).'" style="background:'.$parametre['option2'].'"></label>';
                                        }
                                        if($parametre['option3']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4+2).'" value=2 />
                                                  <label for="param'.($num*4+2).'" style="background:'.$parametre['option3'].'"></label>';
                                        }
                                        if($parametre['option4']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4+3).'" value=2 />
                                                  <label for="param'.($num*4+3).'" style="background:'.$parametre['option4'].'"></label>';
                                        }
                                        echo '</div>';
                                    }
                                    else
                                    {
                                        echo '<div id="parametre">';
                                        if($parametre['option1']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4).'" value=0 checked/>
                                                  <label for="param'.($num*4).'">'.$parametre['option1'].'</label>';
                                        }
                                        if($parametre['option2']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4+1).'" value=1 />
                                                  <label for="param'.($num*4+1).'">'.$parametre['option2'].'</label>';
                                        }
                                        if($parametre['option3']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4+2).'" value=2 />
                                                  <label for="param'.($num*4+2).'">'.$parametre['option3'].'</label>';
                                        }
                                        if($parametre['option4']!=null)
                                        {
                                            echo '<input type="radio" name="param'.$num.'" id="param'.($num*4+3).'" value=2 />
                                                  <label for="param'.($num*4+3).'">'.$parametre['option4'].'</label>';
                                        }
                                        echo '</div>';
                                    }
                                    $num++;
                                }
                            ?>
                        </div>
                    </div>
                    <div id="description">
                        <h3>Description</h3>
                        <p>
                            <?php echo $article['description'] ?>
                        </p>
                    </div>
                </div>
                <div id="article_pannel_top_right">
                    <?php
                        $base_price=$article['prix_ht']; $categorie=$article['id_categorie']; $tva=$article['taux_tva'];
                        include "price_tva.php";
                    ?>
                    <button name="button" value="one">Ajouter au panier</button>
                    <button name="button" value="buy">Acheter directement</button>
                </div>
            </div>
            </form>
            <div id="article_pannel_bottom">
            </div>
        </div>
        <div id="right_shop_pannel">
            <iframe src=pannier2.php name="panier_frame"></iframe>
        </div>
    </main>
</body>

</html>
