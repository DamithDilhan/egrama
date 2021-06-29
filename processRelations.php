<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $pid = "";
    $status = "";
    $update = false ;


    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $result = $mysqli->query("SELECT * FROM tbl_relation WHERE id='$id'") or die($mysqli->error);
        //check relations exists
        if(mysqli_num_rows($result) > 0)
        {
            // relations exist
            
            // enable update
            $update = true ;
            // send to relation view
            header('location:relationView.php?id=' .$id );
            exit();
        }
        
    }
    // add new from relation view
    if(isset($_GET['add'])){
        $id = $_GET['add'];
    }

    // save 
    if(isset($_POST['save'])){

        $id = $_POST['id'];
        $pid = $_POST['pid'];
        $status = $_POST['status'];


        $mysqli->query("INSERT INTO tbl_relation (id ,pid ,status) VALUES ('$id' ,'$pid' ,'$status' )") or die($mysqli->error);
        header('location:relationView.php?id=' .$id ."&msg=success");
        exit();
    }

    //  update
    if(isset($_GET['edit']) && isset($_GET['pid'])){

        $id = $_GET['edit'];
        $pid = $_GET['pid'];
        $result = $mysqli->query("SELECT * from tbl_relation where id='$id' and pid='$pid' ") or die($mysqli->error);
            
            
            if(mysqli_num_rows($result) == 1){
                $row = $result->fetch_array();
                $update = true;
                
                $status = $row['STATUS'];
                

            }
    }

    // update
    if(isset($_POST['update'])){
        $id = $_POST['id'];
        $pid = $_POST['pid'];
        $status = $_POST['status'];
        

        $mysqli->query("UPDATE tbl_relation SET status='$status'  WHERE id='$id' and pid='$pid' ") or die($mysqli->error);
        header('location:relationView.php?id=' .$id ."&msg=success");
        exit();
    }

    //delete
    if(isset($_GET['delete']) && isset($_GET['pid'])){
        $id = $_GET['delete'];
        $pid = $_GET['pid'];
        $mysqli->query("DELETE FROM tbl_relation where ID='$id' and pid='$pid' ") or die($mysqli->error);
        $msg = "successfully deleted";
        header('location:relationView.php?id=' .$id .'&msg=' .$msg);
        exit();

    }

?>