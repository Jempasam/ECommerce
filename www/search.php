<!DOCTYPE html>

<?php include "session_token.php" ?>
<?php include "func.php" ?>

<html lang="fr">
    
<?php
    $page=1;
    if(GET_exist('page'))$page=GET_num('page');
    
    //SELECT
    $conditions=array();
    $conditions2=array();
    
    $parameters=array();
    $conditions_name=array();
    $param_str="";
    //--SEARCH
    if(GET_exist('s'))
    {
        array_push($conditions,"nom LIKE '%".GET_letters('s')."%'");
        array_push($conditions_name,'Recherche: "'.GET_letters('s').'"');
        array_push($parameters,'s='.GET_letters('s'));
        $param_str.='s='.GET_letters('s').'&';
    }
    //--PROMOTED
    if(GET_exist('p'))
    {
        array_push($conditions,"en_promotion=true");
        array_push($conditions_name,'En promotion');
        array_push($parameters,'p&');
        $param_str.='p&';
    }
    //--CATEGORIE
    if(GET_exist('c'))
    {
        $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');

        $result=mysqli_query($db, "SELECT C.nom FROM categorie C WHERE C.id_categorie=".GET_num('c')) or die('Error querying database.');
        array_push($conditions_name,'Categorie: "'.mysqli_fetch_array($result)['nom'].'"');

        $new_cond="( id_categorie=".GET_num('c');
        $result=mysqli_query($db, "SELECT * FROM categorie C WHERE C.parent=".GET_num('c')) or die('Error querying database.');
        while ($row = mysqli_fetch_array($result))
            $new_cond.=" OR id_categorie=".$row['id_categorie'];
        $new_cond.=" )";
        array_push($conditions,$new_cond);
        array_push($parameters,'c='.GET_num('c'));
        $param_str.='c='.GET_num('c').'&';

        mysqli_close($db);
    }
    //--ORDER
    if(GET_exist('o'))
    {
        switch(GET_letters('o'))
        {
            case 'n':
                array_push($conditions2,"ORDER BY id_produit DESC");
                array_push($conditions_name,'Nouveautés');
                break;
            case 'p':
                array_push($conditions2,"ORDER BY prix_ht ASC");
                array_push($conditions_name,'Moins chers');
                break;
            case 'r':
                array_push($conditions2,"ORDER BY prix_ht DESC");
                array_push($conditions_name,'Plus chers');
                break;
            case 'e':
                array_push($conditions2,"ORDER BY note DESC");
                array_push($conditions_name,'Meilleurs');
                break;
        }
        array_push($parameters,'o='.GET_letters('o'));
        $param_str.='o='.GET_letters('o').'&';
    }
?>

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
        <div id="middle_shop_pannel">
            <div class="shopbarre">
                <form action="search_bridge.php" method="get">
                    <select name="o">
                        <option value="">Trier par:</option>
                        <option value="p" <?php if(GET_exist('o') and GET_letters('o')=="p")echo "selected" ?> >Moins cher</option>
                        <option value="r" <?php if(GET_exist('o') and GET_letters('o')=="r")echo "selected" ?> >Plus cher</option>
                        <option value="n" <?php if(GET_exist('o') and GET_letters('o')=="n")echo "selected" ?> >Nouveautés</option>
                        <option value="e" <?php if(GET_exist('o') and GET_letters('o')=="e")echo "selected" ?> >Mieux noté</option>
                    </select>
                    <select name="c">
                        <option value="">Catégories:</option>
                        <?php
                            if(GET_exist('c'))$categorie_selected=GET_num('c');
                            else $categorie_selected=0;
                                
                            $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
                            $result=mysqli_query($db, "SELECT * FROM categorie") or die('Error querying database.');
                            while ($row = mysqli_fetch_array($result))
                            {
                                echo '<option value="'.$row['id_categorie'].'" ';
                                if($row['id_categorie']==$categorie_selected)echo "selected";
                                echo ' >'.$row['nom'].'</option>';
                            }
                        ?>
                        mysqli_close($db);
                    </select>
                    <input type="checkbox" name="p" id="prom" <?php if(GET_exist('p'))echo "checked" ?> />
                    <label for="prom">Promotion</label>
                    <button>Filtrer</button>
                </form>
            </div>
            <?php
                echo '<div class="search_param">';
                for($i=0; $i<count($conditions_name); ++$i)
                {
                    echo '<a href="search.php?';
                    for($y=0; $y<count($parameters); ++$y)
                    {
                        if($y!=$i)echo $parameters[$y].'&';
                    }
                    echo '">';
                    echo $conditions_name[$i];
                    echo '</a>';
                }
                echo '</div>';
            ?>
            <ul id="articles" class="shops">
                <?php
                    $query="SELECT * FROM produit";
                
                    if(count($conditions)>0)
                    {
                        $query.=" WHERE ".$conditions[0];
                        for($i=1; $i<count($conditions); ++$i)
                        {
                            $query.=" AND ".$conditions[$i];
                        }
                    }
                    for($i=0; $i<count($conditions2); ++$i)
                    {
                        $query.=" ".$conditions2[$i];
                    }
                    $max_article=32;
                    $query_offset=($page-1)*32;
                    include "shop_pannel.php";
                ?>
            </ul>
            <div class="pagenum">
                <?php
                    $pagenum=ceil($row_num/(32));
                    $num_length=2;
                    $space=false;
                    for($i=1; $i<=$pagenum; $i++)
                    {
                        if($i<=$num_length or $i>=$pagenum-$num_length or ($page-$num_length<$i and $i<$page+$num_length))
                        {
                            echo '<a ';
                            if($page==$i)echo 'class="selected" ';
                            echo 'href="search.php?'.$param_str.'page='.$i.'">'.$i.'</a>';
                            $space=true;
                        }
                        else if($space==true)
                        {
                            echo '<a>...</a>';
                            $space=false;
                        }
                    }
                ?>
            </div>
        </div>
        <div id="right_shop_pannel">
            <iframe src=pannier2.php name="panier_frame"></iframe>
        </div>
    </main>
</body>

</html>
