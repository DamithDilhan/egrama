<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $assesment_number ="";
    $reg_no= "";
    $name ="";
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
        $reg_no = $_POST['reg_no'];
        $name = $_POST['name'];
        


        $mysqli->query("INSERT INTO tbl_shop (assesment_number,reg_no ,name) VALUES ('$assesment_number' ,'$reg_no'  ,'$name')") or die($mysqli->error);
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id ."&msg=success");
        exit();
    }

    //  update
    if(isset($_GET['edit']) && isset($_GET['Reg_no']) && isset($_GET['id'])){

        $assesment_number = $_GET['edit'];
        $reg_no = $_GET['Reg_no'];
        $id = $_GET['id'];

        $result = $mysqli->query("SELECT * from tbl_shop where assesment_number='$assesment_number' and reg_no='$reg_no'") or die($mysqli->error);
            
            
            if(mysqli_num_rows($result) == 1){
                $row = $result->fetch_array();
                $update = true;
                
                $assesment_number = $row['ASSESMENT_NUMBER'];
                $reg_no = $row['REG_NO'];
                $name = $row['NAME'];
               
            }
    }

    // update
    if(isset($_POST['update'])){
        $id = $_POST['id'];
        $assesment_number = $_POST['assesment_number'];
        $reg_no = $_POST['reg_no'];
        $name = $_POST['name'];
        
        $mysqli->query("UPDATE tbl_shop SET name='$name' WHERE assesment_number='$assesment_number' and reg_no='$reg_no'") or die($mysqli->error);
        $msg = "successfully updated";
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id .'&msg=' .$msg);
        exit();
    }

    

    //delete
    if(isset($_GET['delete']) && isset($_GET['Reg_no']) && isset($_GET['id'])){
        $assesment_number = $_GET['delete'];
        $id = $_GET['id'];
        $reg_no = $_GET['Reg_no'];
        $mysqli->query("DELETE FROM tbl_shop where assesment_number='$assesment_number' and reg_no='$reg_no' ") or die($mysqli->error);
        $msg = "successfully deleted";
        header('location:propertyExpand.php?view=' .$assesment_number ."&id=" .$id .'&msg=' .$msg);
        exit();

    }

?>