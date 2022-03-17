<!DOCTYPE html>

<?php
    include "session_token.php";
    include "func.php";

    setcookie("user_addresse",GET_valid('f_addresse'), ['expires' => time()+30*3600*24,'samesite' => 'None']);
    setcookie("user_codepostal",GET_valid('f_codepostal'), ['expires' => time()+30*3600*24,'samesite' => 'None']);
    setcookie("user_prenom",GET_valid('f_prenom'), ['expires' => time()+30*3600*24,'samesite' => 'None']);
    setcookie("user_nom",GET_valid('f_nom'), ['expires' => time()+30*3600*24,'samesite' => 'None']);

    include "head.html";
    include "svg.html";
?>
<html lang="fr">

<body>
    <?php include "header.php" ?>
    <form method="post" action="commander3.php?sid=<?=COOKIE_key('session_token')?>">
    <main class="commander">
        <div class="loading" --level=3>
            <div>
                <div>Panier</div> <div>Livraison</div> <div>Paiement</div> <div>Valider</div>
            </div>
            <?php include "loading.svg" ?>
        </div>
        <div>
            <div>
                <h2>Contenu de la commande</h2>
                <iframe src="pannier2.php?nb&nt&nc" name="panier_frame"></iframe>
            </div>
            <div style="flex-grow:2">
                <div>
                    <div>
                        <h2>Addresse de livraison</h2>
                        <span id="t_addresse"></span>
                        <span id="t_codepostal"></span>
                    </div>
                </div>
                <hr/>
                <div>
                    <input type="hidden" name="f_addresse" id="f_addresse" value="<?=GET_valid('f_addresse')?>"/>
                    <input type="hidden" name="f_codepostal" id="f_codepostal" value="<?=GET_valid('f_codepostal')?>"/>
                    <input type="hidden" name="f_prenom" id="f_prenom" value="<?=GET_valid('f_prenom')?>"/>
                    <input type="hidden" name="f_nom" id="f_nom" value="<?=GET_valid('f_nom')?>"/>
                    <button>Payer la commande</button>
                </div>
            </div>
        </div>
    </main>
    </form>
</body>
<script>
</script>
</html>
