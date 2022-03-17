<?php
    include "func.php";
    $db=mysqli_connect("localhost","root","","ecommerce") or die('Error connecting database.');
    
    function echo_error($message)
    {
        echo '<meta http-equiv="refresh" content="0;URL=signin.php?a='.$_POST['adresse'].'&cd='.$_POST['codepostal'].'&e='.$_POST['email'].'&dn='.$_POST['naissance'].'&n='.$_POST['nom'].'&pn='.$_POST['prenom'].'&t='.$_POST['telephone'].'&message='.$message.'">';
    }

    if(!isValid($_POST['mdp'])) echo_error('Le mot de passe ne peut pas contenir les caractères &quot;, \', <, > et d\'espacement');
    else if(!isValid($_POST['nom'])) echo_error('Le nom ne peut pas contenir les caractères &quot;, \', <, > et d\'espacement');
    else if(!isValid($_POST['prenom'])) echo_error('Le prénom de passe ne peut pas contenir les caractères &quot;, \', <, > et d\'espacement');
    else if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) echo_error('L\'email est invalide');
    else if(!isValid($_POST['telephone'])) echo_error('Le numéro de téléphone ne peut pas contenir les caractères &quot;, \', <, > et d\'espacement');
    else if(!isValid($_POST['adresse'])) echo_error('L\'adresse ne peut pas contenir les caractères &quot;, \', <, > et d\'espacement');
    else if(!isCodePostal($_POST['codepostal'])) echo_error('Le code postal est invalide');
    else if($_POST['mdp']!=$_POST['mdp2']) echo_error('Confirmation de mot de passe invalide');
    else{
        $result=mysqli_query($db, "SELECT * FROM compte WHERE mail='".$_POST['email']."'") or die('Error querying database.');
        if(mysqli_num_rows($result)==0)
        {
            $query="INSERT INTO compte
                                        (adresse,codepostal,is_male,mail,naissance,nom,prenom,telephone,token)
                                        VALUES
                                        ('".$_POST['adresse']."',".$_POST['codepostal'].",".$_POST['genre'].",'".$_POST['email']."','".$_POST['naissance']."','".$_POST['nom']."','".$_POST['prenom']."',"
                                        .$_POST['telephone'].",'".hash('sha256',$_POST['email'].';'.$_POST['mdp']."toucan")."')";
            mysqli_query($db, $query) or die('Error querying database.');
            echo '<meta http-equiv="refresh" content="0;URL=login.php">';
        }
        else echo_error('L\'email est déjà utilisé');
    }
?>
