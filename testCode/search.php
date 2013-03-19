<?php
require_once "db.php";
session_start();

$result = mysql_query("SELECT * FROM skills"); 

echo '<form action="results.php" method="post">'; 
while($row = mysql_fetch_array($result)) 
  { 
  	$name = $row[skill_name];
  	$id = $row[skill_id];
	echo '<input id="' . $id . '" type="checkbox" name="selectedskills[]" value="' . $name . '" ><label for="' . $name . '" >' . $name . '</label><br>';
}
echo '<input type="submit" class="button" value="Next"></form>';
  
?>