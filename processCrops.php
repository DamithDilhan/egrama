<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $assesment_number ="";
    $crops= "";
    $update = false ;

        
    
    // add new from crop view
    if(isset($_GET['add']) && isset($_GET['id'])){
        $assesment_number = $_GET['add'];
        $id = $_GET['id'];
    }

    // save 
    if(isset($_POST['save'])){

        $id = $_POST['id'];
        $assesment_number = $_POST['assesment_number'];
        $crops = $_POST['crops'];
        


        $mysqli->query("INSERT INTO tbl_cultivated_land (assesment_number,crops) VALUES ('$assesment_number' ,'$crops'  )") or die($mysqli->error);
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id ."&msg=success");
        exit();
    }

    

    //delete
    if(isset($_GET['delete']) && isset($_GET['crops']) && isset($_GET['id'])){
        $assesment_number = $_GET['delete'];
        $id = $_GET['id'];
        $crops = $_GET['crops'];
        $mysqli->query("DELETE FROM tbl_cultivated_land where assesment_number='$assesment_number' and crops='$crops' ") or die($mysqli->error);
        $msg = "successfully deleted";
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id .'&msg=' .$msg);
        exit();

    }

?>