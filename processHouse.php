<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $assesment_number ="";
    $hassesment_no= "";
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
        $hassesment_no = $_POST['hassesment_no'];
        


        $mysqli->query("INSERT INTO tbl_house (assesment_number,hassesment_no) VALUES ('$assesment_number' ,'$hassesment_no'  )") or die($mysqli->error);
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id ."&msg=success");
        exit();
    }

    

    //delete
    if(isset($_GET['delete']) && isset($_GET['hassesment_no']) && isset($_GET['id'])){
        $assesment_number = $_GET['delete'];
        $id = $_GET['id'];
        $hassesment_no = $_GET['hassesment_no'];
        $mysqli->query("DELETE FROM tbl_house where assesment_number='$assesment_number' and hassesment_no='$hassesment_no' ") or die($mysqli->error);
        $msg = "successfully deleted";
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id .'&msg=' .$msg);
        exit();

    }

?>