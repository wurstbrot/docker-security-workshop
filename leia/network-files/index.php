<?php
$con=mysqli_connect("172.19.0.222","opencms","opencms","opencms");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$sql="SELECT * FROM CMS_USERS";
$result=mysqli_query($con,$sql);
echo "<h1>DB-DUMP:</h1>";
// Associative array
$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
var_dump ($row);

// Free result set
mysqli_free_result($result);

mysqli_close($con);
?>

