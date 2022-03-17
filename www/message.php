<!DOCTYPE html>

<?php
    include "session_token.php";
    include "func.php";
    include "svg.html";
    include "head.html";
?>

<html lang="fr">

<body>
    <?php include "header.php" ?>
    <form method="get" action="send_commande.php">
    <main style="text-align:center;">
        <h2 style="color:var(--green)"><?=GET_valid('m')?></h2>
    </main>
    </form>
</body>

</html>
