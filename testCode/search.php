<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <link href="styles-01.css" rel="stylesheet" type="text/css">
</head>

<?php
require_once "db.php";
session_start();

$result = mysql_query("SELECT * FROM skills"); 

echo '
<div>
<h1>Which skills are you interested in?<br>Select all that apply.</h1>
<form action="results.php" method="post">'; 

while($row = mysql_fetch_array($result)) 
  { 
  	$name = $row[skill_name];
  	$id = $row[skill_id];
	echo '<input id="' . $id . '" type="checkbox" name="selectedskills[]" value="' . $name . '" ><label for="' . $id . '" >' . $name . '</label><br>';
}

echo '<input type="submit" class="button" value="Next"></form>
</div>';
  
?>