<?php require_once 'connection.php'; ?>
<?php
    
    $id ="";
    $assesment_number = "";
    $owned_date = "";
    $address = "";
    $mean_income = "";
    $cultivate_flag ="" ;
    $status = "";
    $update = false ;


    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $result = $mysqli->query("SELECT * FROM tbl_property WHERE id='$id'") or die($mysqli->error);
        //check property exists
        if(mysqli_num_rows($result) > 0)
        {
            // property exist
            
            // enable update
            $update = true ;
            // send to relation view
            header('location:propertyView.php?id=' .$id );
            exit();
        }
        
    }
    // add new from property view
    if(isset($_GET['add'])){
        $id = $_GET['add'];
    }

    // save 
    if(isset($_POST['save'])){

        $id = $_POST['id'];
        $assesment_number = $_POST['assesment_number'];
        $owned_date = $_POST['owned_date'];
        $address = $_POST['address'];
        $mean_income = $_POST['mean_income'];
        $cultivate_flag =$_POST['cultivate_flag'] ;
        $status = $_POST['status'];

        $result = $mysqli->query("SELECT * FROM tbl_property WHERE assesment_number='$assesment_number' ") or die($mysqli->error);

        if(mysqli_num_rows($result) > 0){
            $msg=" Assesment Number  Already exists!";
            header('location:propertyView.php?id=' .$id .'&msg=' .$msg);
            exit();
        }
        $mysqli->query("INSERT INTO tbl_property (id , assesment_number ,owned_date ,address ,mean_income , cultivate_flag ,status) VALUES ('$id' ,'$assesment_number' ,'$owned_date' ,'$address' ,'$mean_income' , '$cultivate_flag' ,'$status' )") or die($mysqli->error);
        header('location:propertyView.php?id=' .$id ."&msg=success");
        exit();
    }

    //  update
    if(isset($_GET['edit'])){

        $assesment_number = $_GET['edit'];
        $result = $mysqli->query("SELECT * from tbl_property where assesment_number='$assesment_number' ") or die($mysqli->error);
            
            
            if(mysqli_num_rows($result) == 1){
                $row = $result->fetch_array();
                $update = true;
                $id = $row['ID'];
                $assesment_number = $row['ASSESMENT_NUMBER'];
                $owned_date = $row['OWNED_DATE'];
                $address = $row['ADDRESS'];
                $mean_income = $row['MEAN_INCOME'];
                $cultivate_flag =$row['CULTIVATE_FLAG'] ;
                $status = $row['STATUS'];
                

            }
    }

    // update
    if(isset($_POST['update'])){
        $id = $_POST['id'];
        $assesment_number = $_POST['assesment_number'];
        $owned_date = $_POST['owned_date'];
        $address = $_POST['address'];
        $mean_income = $_POST['mean_income'];
        $cultivate_flag =$_POST['cultivate_flag'] ;
        $status = $_POST['status'];
        

        $mysqli->query("UPDATE tbl_property SET owned_date='$owned_date' , address='$address' , mean_income='$mean_income' ,cultivate_flag='$cultivate_flag' ,status='$status'  WHERE assesment_number='$assesment_number'") or die($mysqli->error);
        header('location:propertyView.php?id=' .$id ."&msg=successfully updated");
        exit();
    }

    //delete
    if(isset($_GET['delete']) && isset($_GET['assesment_number'])){
        $id = $_GET['delete'];
        $assesment_number = $_GET['assesment_number'];
        $mysqli->query("DELETE FROM tbl_property where ASSESMENT_NUMBER='$assesment_number' ") or die($mysqli->error);
        $msg = "successfully deleted";
        header('location:propertyView.php?id=' .$id .'&msg=' .$msg);
        exit();

    }

?>