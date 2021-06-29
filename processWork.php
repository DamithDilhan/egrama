<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $post ="";
    $salary ="";
    $address ="";
    $doa ="";
    $update= false;


    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $result = $mysqli->query("SELECT * FROM tbl_works WHERE id='$id'") or die($mysqli->error);
        //check work exists
        if(mysqli_num_rows($result) == 1)
        {
            // work exist
            $row = $result->fetch_array();
            // enable update
            $update = true ;
            
            $post = $row['POST'];
            $salary = $row['SALARY'];
            $address = $row['ADDRESS'];
            $doa =  $row['DOA'];

        }
    }

    // save 
    if(isset($_POST['save'])){

        $id = $_POST['id'];
        $post = $_POST['post'];
        $salary = $_POST['salary'];
        $address = $_POST['address'];
        $doa = $_POST['doa'];


        $mysqli->query("INSERT INTO tbl_works (id ,post , address ,salary ,doa ) VALUES ('$id' ,'$post' ,'$address' ,'$salary'  ,'$doa')") or die($mysqli->error);
        header('location:work.php?id=' .$id ."&msg=success");
        exit();
    }
    // update
    if(isset($_POST['update'])){
        $id = $_POST['id'];
        $post = $_POST['post'];
        $salary = $_POST['salary'];
        $address = $_POST['address'];
        $doa = $_POST['doa'];

        $mysqli->query("UPDATE tbl_works SET post='$post' ,address='$address' ,salary='$salary' ,doa='$doa' WHERE id='$id' ") or die($mysqli->error);
        header('location:work.php?id=' .$id ."&msg=success");
        exit();
    }
    // delete
    if(isset($_GET['delete'])){
        $id = $_GET['delete'];
        $mysqli->query("DELETE FROM tbl_works WHERE id='$id'") or die($mysqli->error);
        $msg = "Successfully deleted";
        header('location:work.php?id=' .$id ."&msg=" .$msg);
        exit();

    }
?> 