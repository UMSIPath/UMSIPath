<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <link href="styles-01.css" rel="stylesheet" type="text/css">
</head>

<html>

<body>

<div>
<h1>What career sounds interesting to you?<br>Select all that apply.</h1>
<form action="searchbycareer_result.php" method="post">

<?php
require_once "db.php";
session_start();

$result = mysql_query("SELECT * FROM careers"); 

while($row = mysql_fetch_array($result)) 
  { 
  	$title = $row[career_title];
  	$id = $row[career_id];
	echo '<input id="' . $id . '" type="checkbox" name="selectedcareers[]" value="' . $title . '" ><label for="' . $id . '" >' . $title . '</label><br>';
}
  
?>

<input type="submit" class="button" value="Next"></form>
</div>

</body>

</html>