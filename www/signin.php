<!DOCTYPE html>
<html lang="fr">

<?php include "session_token.php" ?>
<?php include "func.php" ?>

<?php include "head.html" ?>

<?php include "svg.html" ?>


<body>
    <?php include "header.php" ?>
    <form action="signin2.php" method="post" name="signin">
    <main class="connection">
        <div>
            <div>
                <h2>Connexion</h2>
                <h3>Identité</h3>
                <div>Prénom<input type="text" name="prenom" maxlength=20 <?php if(GET_exist('pn'))echo 'value="'.GET_valid('pn').'"' ?> required></div>
                <div>Nom<input type="text" name="nom" maxlength=20 <?php if(GET_exist('n'))echo 'value="'.GET_valid('n').'"' ?> required></div>
                <div>Date de naissance<input type="date" name="naissance" <?php if(GET_exist('dn'))echo 'value="'.GET_valid('dn').'"' ?> required></div>
                <div>
                    Genre
                    <select name="genre">
                        <option value="1">Homme</option>
                        <option value="0">Femme</option>
                    </select>
                </div>
                <h3>Contact</h3>
                <div>Email<input type="email" name="email" maxlength=320 <?php if(GET_exist('e'))echo 'value="'.GET_valid('e').'"' ?> required></div>
                <div>Téléphone<input type="tel" name="telephone" maxlength=15 <?php if(GET_exist('t'))echo 'value="'.GET_valid('t').'"' ?> required></div>
                <h3>Localisation</h3>
                <div>Adresse<input type="text" name="adresse" maxlength=128 <?php if(GET_exist('a'))echo 'value="'.GET_valid('a').'"' ?> required></div>
                <div>Code Postal<input type="text" minlength=5 maxlength=5 name="codepostal" <?php if(GET_exist('cd'))echo 'value="'.GET_valid('cd').'"' ?> required></div>
                <h3>Mot de passe</h3>
                <div>Mot de passe<input type="password" maxlength=20 name="mdp" required></div>
                <div>Confirmation<input type="password" maxlength=20 name="mdp2" required></div>
                <button>S'inscrire</button>
                <?php
                    if(GET_exist('message'))
                        echo '<p style="color:red">'.GET_text('message').'</p>';
                ?>
            </div>
            <div class="text">
                <h2>Bienvenue sur Toucan</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
        </div>
    </main>
    </form>
</body>
</html>
