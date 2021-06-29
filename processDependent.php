<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $name = "";
    $update = false ;


    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $result = $mysqli->query("SELECT * FROM tbl_dependent WHERE id='$id'") or die($mysqli->error);
        //check dependent exists
        if(mysqli_num_rows($result) > 0)
        {
            // dependents exist
            
            // enable update
            $update = true ;
            // send to dependent view
            header('location:dependentView.php?id=' .$id );
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
        $name = $_POST['name'];
        


        $mysqli->query("INSERT INTO tbl_dependent (id ,name) VALUES ('$id' ,'$name'  )") or die($mysqli->error);
        header('location:dependentView.php?id=' .$id ."&msg=success");
        exit();
    }

    

    //delete
    if(isset($_GET['delete']) && isset($_GET['name'])){
        $id = $_GET['delete'];
        $name = $_GET['name'];
        $mysqli->query("DELETE FROM tbl_dependent where ID='$id' and name='$name' ") or die($mysqli->error);
        $msg = "successfully deleted";
        header('location:dependentView.php?id=' .$id .'&msg=' .$msg);
        exit();

    }

?>