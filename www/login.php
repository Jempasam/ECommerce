<!DOCTYPE html>
<html lang="fr">

<?php include "session_token.php" ?>
<?php include "func.php" ?>

<?php include "head.html" ?>

<?php include "svg.html" ?>


<body>
    <?php include "header.php" ?>
    <form action="login2.php" method="post" name="signin">
    <main class="connection">
        <div>
            <div class="text">
                <h2>Bienvenue sur Toucan</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
            </div>
            <div>
                <h2>Connexion</h2>
                <div>Email<input type="email" name="email" maxlength=320 required></div>
                <div>Mot de passe<input type="password" name="mdp" maxlength=20 required></div>
                <button>Se connecter</button>
                <a href="signin.php">S'inscrire</a>
                <?php
                    if(GET_exist('message'))
                        echo '<p style="color:red">'.GET_text('message').'</p>';
                ?>
            </div>
        </div>
    </main>
    </form>
</body>
</html>
