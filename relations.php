<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./src/css/bootstrap.min.css">
    <link rel="stylesheet" href="./src/css/style.css">
    
    <title>E-GRAMA</title>
    
</head>
<body>

    <!-- navbar header -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.php">E-GRAMA</a>
        <div class="text-rigth">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse text-right" id="navbarSupportedContent">
          <ul class="navbar-nav  ml-auto">
            <li class="nav-item ">
            <a class="nav-link " href="person.php?add=new">Register</a>
            </li>
            <li class="nav-item">
                <form action="person.php" method="GET" class="form-inline">
                <input class="form-control mr-sm-2" name="edit" type="search" placeholder="ID" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Search</button>
                </form>
            </li>
          </ul>
          
        </div>
      </nav>
    <!-- end of navbar header -->
    
    <div class="img-responsive jumbotron">
    </div>  
    

    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-6 m-auto">
                <div class="card card-body text-center form">

                    <?php require_once 'processRelations.php'; ?>
                    <?php 
                    if(isset($_GET['msg'])){    ?>

                    
                        <div id="myalert" class="alert alert-success alert-dismissable fade show text-center" role="alert">
                            <?php echo $_GET['msg']; ?>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close" >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php } ?>
                    
                    <form action="processRelations.php" method="post">
                        <h3 class="text-center">Relation</h3>  

                        <input type="text" name="id" class="form-control" placeholder="NIC Number" value="<?php echo $id; ?>" required="required" maxlength="12" hidden>

                        <div class="form-group">
                            <input type="text" name="pid" value="<?php echo $pid ;?>" class="form-control" placeholder="NIC Number" required="required" maxlength="12">
                        </div>
                        <div class="form-group">
                            <input type="text" name="status" value="<?php echo $status ;?>" class="form-control" placeholder="Status (Ex: Husband)" required="required" maxlength="10">
                        </div>
                    

                        <div class="btn-group" role="group" aria-label="Basic example">
                            <?php if($update == true) : ?>
                            <button type="submit" class="btn btn-md btn-primary btn-block" name="update">Update</button>
                            <?php
                            else: ?>
                            <button type="submit" class="btn btn-md btn-primary btn-block" name="save">Add</button>
                            <?php
                            endif; ?>
                        </div>
                    </form>
                    <div class="btn-group" role="group" aria-label="Basic example">
                    <a href="work.php?id=<?php echo $id ;?>" class="btn  btn-md  btn-secondary">Work</a>
                    <a href="dependent.php?id=<?php echo $id; ?>" class="btn  btn-md  btn-secondary">Dependents</a>
                    <a href="property.php?id=<?php echo $id; ?>" class="btn  btn-md  btn-secondary">Property</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- copyrights -->
    <footer>
        <div class="text-center">Made for CO226 Assignment</div>
    </footer>
    <!-- end of copyrights -->

    <script src="./src/js/jquery.slim.min.js"></script>
    <script src=".src/js/popper.min.js"></script>
    <script src="./src/js/bootstrap.min.js"></script>
    <script src="./src/js/script.js"></script>
    
    
    
    
</body>
</html>