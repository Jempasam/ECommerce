<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>E-Commerce</title>
    <link rel="stylesheet" href="panier.css" />
</head>
<?php include "func.php" ?>
<?php include "session_token.php" ?>
<?php include "svg.html" ?>
<?php
    $paras="";
    if(GET_exist('nb'))$paras.='nb&'; if(GET_exist('nc'))$paras.='nc&'; if(GET_exist('np'))$paras.='np&'; if(GET_exist('nt'))$paras.='nt&';
?>
<html>
<main id="panier">
</main>
<script>
    var panier_request = new XMLHttpRequest();
    panier_request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('panier').outerHTML=panier_request.responseText;
        }
    };
    var edit_request = new XMLHttpRequest();
    edit_request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            load_panier();
        }
    };
    
    function load_panier()
    {
        panier_request.open("GET", "panier_articles.php?<?=$paras?>");
        panier_request.send();
    }
    function edit(para)
    {
        edit_request.open("GET", "edit_panier.php?"+para);
        edit_request.send();
    }
    load_panier();
</script>
</html>