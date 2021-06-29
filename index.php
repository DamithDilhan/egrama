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
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
  <?php require_once 'processPerson.php'; ?>
  <div class="row">
    <div class="col mt-4 text-center">
    <?php
      if (isset($_GET['msg'])){ ?>
        
        <div id="myalert" class="alert alert-success alert-dismissable fade show" role="alert">
        <?php echo $_GET['msg']; ?>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close" >
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
          
      <?php
        }
      ?>
</div>
    </div>
<!--------------------------------------------------------------------------------------------------------------------------------->
<a href="person.php?add=new" class="btn btn-primary">Add Person</a>

<!-------------------------------------------------------------------------------------------------------->

  <div class="card">
    <div class="card-body">
      <?php
          
          $result = $mysqli->query("SELECT * FROM tbl_person") or die($mysqli->error);

        ?>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">BirthDate</th>
            <th scope="col">Gender</th>
            <th scope="col">Address</th>
            <th scope="col">Marital Status</th>
            <th scope="col">Action</th>

          </tr>
        </thead>
        <?php 
          while($row = $result->fetch_assoc()):?> 
        <tbody>
          <tr>
            <td><?php echo $row['ID'] ;?></td>
            <td><?php echo $row['FNAME'] ;?></td>
            <td><?php echo $row['DOB']; ?></td>
            <td><?php echo $row['GENDER']=='M' ? 'Male' : 'Female'; ?></td>
            <td><?php echo $row['ADDRESS']; ?></td>
            <td><?php echo $row['MARITAL_STATUS']; ?></td>
            <td>
              <a href="person.php?edit=<?php echo $row['ID']; ?>" class="btn btn-info">edit</a>
              <a href="processPerson.php?delete=<?php echo $row['ID']; ?>" class="btn btn-danger">delete</a>
 
          </tr>

        </tbody>
         <?php endwhile;?>
      </table>


    </div>


  </div>
<!-------------------------------------------------------------------------------------------->


  }

  <!-- copyrights -->
  <footer>
    <div class="text-center">Made for CO226 Assignment</div>
  </footer>
  <!-- end of copyrights -->

  <script src="./src/js/jquery.slim.min.js"></script>
  <script src="./src/js/popper.min.js"></script>
  <script src="./src/js/bootstrap.min.js"></script>
  <script src="./src/js/script.js"></script>




</body>

</html>