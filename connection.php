<?php
    //  database setting
    //  host
    $db_host="localhost";
    // user
    $db_user="root";
    // password  
    $db_pass="";
    //  database name
    $db_name="grama_niladari_db";
    $mysqli = new mysqli($db_host ,$db_user ,$db_pass ,$db_name) or die(mysqli_error($mysql));
?>