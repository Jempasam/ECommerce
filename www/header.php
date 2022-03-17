    <div id="headercontainer">
    <header>
        <div id="header_top">
            <div id="header_top_left">
                <a href="index.php"><svg><use href="#logosite"/></svg></a>
                <form action="search.php" method="get">
                    <input type="search" name="s" placeholder="Rechercher...">
                    <button href="logo.png"></button>
                </form>
            </div>
            <div id="header_top_right">
                    <?php
                        if(isset($_COOKIE['token']))
                            echo '<a class="button" href="compte.php"> <svg><use href="#user_icon"/></svg> Mon compte </a>';
                        else
                            echo '<a class="button" href="login.php"> <svg><use href="#user_icon"/></svg> Se connecter </a>';
                    ?>
                <a class="button"><svg><use href="#panier_icon"/></svg>Mon Panier</a>
                <a class="button"><svg><use href="#help_icon"/></svg>Aide</a>
            </div>
        </div>
        <div id="header_bottom">
            <div id="header_bottom_left">
                <a href="categories.php">Toutes nos catégories</a>
                <ul>
                    <li class="menu">
                        <a href="search.php">Tous nos produits</a>
                        <ul>
                            <?php
                                $query="SELECT * FROM categorie C WHERE C.parent IS NULL ";
                                include "categorie_pannel.php";
                            ?>
                        </ul>
                    </li>
                    <li class="menu">
                        <a href="search.php?o=n">Nouveauté</a>
                        <ul>
                            <?php
                                $param="o=n&";
                                $query="SELECT * FROM categorie C WHERE C.parent IS NULL ";
                                include "categorie_pannel.php";
                                $param="";
                            ?>
                        </ul>
                    </li>
                    <li class="menu">
                        <a href="search.php?p">Promotion</a>
                        <ul>
                            <?php
                                $param="p&";
                                $query="SELECT * FROM categorie C WHERE C.parent IS NULL and C.id_categorie IN (SELECT * FROM promoted_categories_id)";
                                include "categorie_pannel.php";
                                $param="";
                            ?>
                        </ul>
                    </li>
                    <li class="menu">
                        Reconditionné
                        <ul><li><a href="a">Cassé</a></li></ul>
                    </li>
                    <li>Revente</li>
                    <li>Liste d'envie</li>
                </ul>
            </div>
            <div id="header_bottom_right">
                Langue
            </div>
        </div>
    </header>
    </div>