<!DOCTYPE html>
<html lang="fr">

<?php include "session_token.php" ?>
    
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
            <ul class="wordlist">
                <?php
                    $query="SELECT * FROM categorie C WHERE C.parent IS NULL ";
                    include "categorie_pannel.php";
                ?>
            </ul>
        </div>
        <div id="right_shop_pannel">
            <iframe src=pannier2.php name="panier_frame"></iframe>
        </div>
    </main>
</body>

</html>
