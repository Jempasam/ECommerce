<?php
    $price=$base_price;$reduc="";
    $result2=mysqli_query($db, "SELECT * FROM promotion2 WHERE id_categorie=".$categorie) or die('Error querying database.');
    $date=99999999999;
    while ($row2 = mysqli_fetch_array($result2)) {
        if($row2['prix_minimal']<=$base_price and $base_price<=$row2['prix_maximal'])
        {
            if(strtotime($row2['date_fin'])<$date)$date=strtotime($row2['date_fin']);
            $price-=$row2['remise']+($base_price*$row2['reduction']/100);
            if($row2['remise']!=0)$reduc.=" -".$row2['remise']."€";
            if($row2['reduction']!=0)$reduc.=" -".$row2['reduction']."%";
        }
    }
    if($reduc!="")
    {
        echo '<span style="color:red;font-size:0.95em;">'.$reduc.'</span>';
        echo '<span style="color:green;font-size:0.95em;">'.ceil(($date-time())/3600/24).' jours restants</span>';
    }
    echo '<span --currency="€" class="price">';
    $price_tva=round($price+$price*$tva/100,2);
    $base_price_tva=round($base_price+$base_price*$tva/100,2);
    if($price_tva!=$base_price_tva)echo '<span style="text-decoration: line-through;">'.$base_price_tva."</span> <span>".$price_tva."</span>";
    else echo $price_tva;
    echo '</span>';
?>