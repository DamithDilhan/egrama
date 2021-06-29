
<?php require_once 'connection.php'; ?>
<?php
    //$mysqli = new mysqli('localhost' ,'root' ,'','grama_niladari_db') or die(mysqli_error($mysql));

    $id = '';
    $fname = '';
    $mname = '';
    $lname = '';
    $dob = '';
    $address = '';
    $gender = '';
    $maritSt = '';
    $update = false ;
    $hasWork = false ;
    $hasRelation = false ;
    $hasDependent = false ;
    $hasProperty = false ;
    
    if (isset($_POST['save'])){
        
        $id = $_POST['id'];
        $fname = $_POST['fname'];
        $mname = $_POST['mname'];
        $lname = $_POST['lname'];
        $dob = $_POST['dob'];
        $address = $_POST['address'];
        $gender = $_POST['gender'];
        $maritSt = $_POST['marital_status'];

        $result = $mysqli->query("SELECT fname from tbl_person where id='$id'") or die($mysqli->error);

        if(mysqli_num_rows($result) > 0){
            $msg=" ID Already exists!";
            header('location:index.php?msg=' .$msg);
        exit();
        }


        $mysqli->query("INSERT INTO tbl_person (id ,fname ,mname , lname ,dob ,gender ,address ,marital_status ) VALUES ('$id' ,'$fname','$mname','$lname','$dob','$gender','$address','$maritSt')") or die($mysqli->error);

        header('location:index.php?msg=succesful');
        exit();

    }


    if(isset($_GET['delete'])){
        $id = $_GET['delete'];
        $mysqli->query("DELETE FROM tbl_person where ID='$id'") or die($mysqli->error);
        header('location:index.php?msg=succesful');
        exit();

    }

        if(isset($_GET['edit'])){
            $id = $_GET['edit'] ;
            $result = $mysqli->query("SELECT * from tbl_person where id='$id'") or die($mysqli->error);
            
            
            if(mysqli_num_rows($result) == 1){
                $row = $result->fetch_array();
                $update = true;
                $fname = $row['FNAME'];
                $mname = $row['MNAME'];
                $lname = $row['LNAME'];
                $dob = $row['DOB'];
                $address = $row['ADDRESS'];
                $gender = $row['GENDER'];
                $maritSt = $row['MARITAL_STATUS'];

            }
            elseif (mysqli_num_rows($result) == 0){
                $msg=" ID not registered!";
                header('location:index.php?msg=' .$msg);
                exit();
            }
            
        }


    
        if (isset($_POST['update'])){
            $id = $_POST['id'];
            $fname = $_POST['fname'];
            $mname = $_POST['mname'];
            $lname = $_POST['lname'];
            $dob = $_POST['dob'];
            $address = $_POST['address'];
            $gender = $_POST['gender'];
            $maritSt = $_POST['marital_status'];

            $mysqli->query("UPDATE tbl_person SET fname='$fname' ,mname='$mname' ,lname='$lname' ,dob='$dob' ,gender='$gender' ,address='$address' , marital_status='$maritSt' where id='$id'") or die($mysqli->error);

            header('location:index.php?msg=succesful');
            exit();
        }


    

?>