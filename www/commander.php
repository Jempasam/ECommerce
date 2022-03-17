<!DOCTYPE html>

<?php
    include "session_token.php";
    include "func.php";
    include "head.html";
    include "svg.html";

    if(!COOKIE_exist('token'))
    { 
        if(COOKIE_exist('user_addresse')) $user_addresse=$user['adresse']; else $user_addresse="adresse";
        if(COOKIE_exist('user_codepostal')) $user_codepostal=$user['codepostal']; else $user_codepostal="00000";
        if(COOKIE_exist('user_prenom')) $user_prenom=$user['prenom']; else $user_prenom="prénom";
        if(COOKIE_exist('user_nom')) $user_nom=$user['nom']; else $user_nom="nom";
    }
    else
    {
        $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');

        $result=mysqli_query($db, "SELECT * FROM compte WHERE token='".COOKIE_key('token')."'") or die('Error querying database.');
        $user=mysqli_fetch_array($result);
        
        $user_addresse=$user['adresse'];
        $user_codepostal=$user['codepostal'];
        $user_prenom=$user['prenom'];
        $user_nom=$user['nom'];
    }
?>

<html lang="fr">

<body>
    <?php include "header.php" ?>
    <form method="get" action="commander2.php">
    <main class="commander">
        <div class="loading" --level=4>
            <div>
                <div>Panier</div> <div>Livraison</div> <div>Paiement</div> <div>Valider</div>
            </div>
            <?php include "loading.svg" ?>
        </div>
        <div>
            <div>
                <h2>Contenu de la commande</h2>
                <iframe src="pannier2.php?nb&nt" name="panier_frame"></iframe>
            </div>
            <div style="flex-grow:2">
                <div>
                    <div>
                        <h2>Addresse de livraison</h2>
                        <span id="t_addresse"><?=$user_addresse?></span>
                        <span id="t_codepostal"><?=addzeros($user_codepostal,5)?></span>
                        <input type="hidden" name="f_addresse" id="f_addresse" value="<?=$user_addresse?>"/>
                        <input type="hidden" name="f_codepostal" id="f_codepostal" value="<?=addzeros($user_codepostal,5)?>"/>
                        <a id="m_addresse">Modifier</a>
                    </div>
                    <div>
                        <h2>Nom du client</h2>
                        <span id="t_prenom"><?=$user_prenom?></span>
                        <span id="t_nom"><?=$user_nom?></span>
                        <input type="hidden" name="f_prenom" id="f_prenom" value="<?=$user_prenom?>"/>
                        <input type="hidden" name="f_nom" id="f_nom" value="<?=$user_nom?>"/>
                        <a id="m_nom">Modifier</a>
                    </div>
                </div>
                <hr/>
                <div>
                    <button>Valider la commande</button>
                </div>
            </div>
        </div>
    </main>
    </form>
</body>
<script>
    var o_addresse=document.getElementById("t_addresse");
    var o_codepostal=document.getElementById("t_codepostal");
    var o_prenom=document.getElementById("t_prenom");
    var o_nom=document.getElementById("t_nom");
    var m_addresse=document.getElementById("m_addresse");
    var m_nom=document.getElementById("m_nom");
    
    m_addresse.addEventListener("click",function(){
        if(o_addresse.tagName=='SPAN')
        {
            o_addresse.outerHTML = '<input id="t_addresse" type="text" value="'+o_addresse.innerHTML+'"/>';
            o_codepostal.outerHTML = '<input id="t_codepostal" type="text" value="'+o_codepostal.innerHTML+'"/>';
            m_addresse.innerHTML='Enregistrer';
        }
        else
        {
            if(/^[0-9][0-9][0-9][0-9][0-9]$/.test(o_codepostal.value))
            {
                document.getElementById("f_addresse").value=o_addresse.value;
                document.getElementById("f_codepostal").value=o_codepostal.value;
                o_addresse.outerHTML = '<span id="t_addresse">'+o_addresse.value+'</span>';
                o_codepostal.outerHTML = '<span id="t_codepostal">'+o_codepostal.value+'</span>';
                m_addresse.innerHTML='Modifier';
            }
        }
        o_addresse=document.getElementById("t_addresse");
        o_codepostal=document.getElementById("t_codepostal");
    });
    m_nom.addEventListener("click",function(){
        if(o_prenom.tagName=='SPAN')
        {
            o_prenom.outerHTML = '<input id="t_prenom" type="text" value="'+o_prenom.innerHTML+'"/>';
            o_nom.outerHTML = '<input id="t_nom" type="text" value="'+o_nom.innerHTML+'"/>';
            m_nom.innerHTML='Enregistrer';
        }
        else
        {
            document.getElementById("f_prenom").value=o_prenom.value;
            document.getElementById("f_nom").value=o_nom.value;
            o_prenom.outerHTML = '<span id="t_prenom">'+o_prenom.value+'</span>';
            o_nom.outerHTML = '<span id="t_nom">'+o_nom.value+'</span>';
            m_nom.innerHTML='Modifier';
        }
        o_prenom=document.getElementById("t_prenom");
        o_nom=document.getElementById("t_nom");
    });
    
</script>

</html>
