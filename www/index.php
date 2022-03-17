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
        <div id="middle_shop_pannel">
            <a href="search.php?o=n">Les nouveautés</a>
            <ul id="nouveaute" class="shops">
            </ul>
            Autres catégories
            <ul id="articles" class="shops">
                <?php
                    $query_offset=0;
                    $max_article=16;
                    $query="SELECT * FROM produit C ORDER BY C.nom";
                    include "shop_pannel.php";
                ?>
            </ul>
        </div>
        <div id="right_shop_pannel">
            <iframe src=pannier2.php name="panier_frame"></iframe>
        </div>
    </main>
    <footer>
        
    </footer>
    <script>
        var nouvpage=0;
        var nouv_request = new XMLHttpRequest();
        nouv_request.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var nouv_pannel=document.getElementById('nouveaute');
                nouv_pannel.innerHTML=nouv_request.responseText;
                nouv_pannel.innerHTML+='<a onclick="load_nouv()"><svg><use href="#arrow"/></svg></a>';
            }
        };

        function load_nouv()
        {
            ++nouvpage;
            nouv_request.open("GET", "ajax_shop_pannel.php?on&n=4&s="+nouvpage);
            nouv_request.send();
        }
        
        load_nouv();
    </script>
</body>

</html>
