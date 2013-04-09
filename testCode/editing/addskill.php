<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <link href="styles-02.css" rel="stylesheet" type="text/css">
</head>
<html>
<body>
<a href=index.php>Home</a><br><br>
<?php
require_once "db.php";
session_start();

$name = mysql_real_escape_string($_POST['name']);
$description = mysql_real_escape_string($_POST['description']);

if ( isset($_POST['name'])) {
$sql = "INSERT INTO skills (skill_name, skill_description) 
              VALUES ('$name', '$description')";
        mysql_query($sql);
        }
        
?>
<h1>Add a skill</h1>
<form method="post">
<p>Name:
<input type="text" name="name"></p>
<p>Description:<br>
<textarea name="description" cols=40 rows=10></textarea></p>
<p><input type="submit" value="Add New"/>
<a href="index.php">Cancel</a></p>
</form><br>

<h1>Existing skills</h1>
<?php
$result = mysql_query("SELECT * FROM skills ORDER BY skill_name");
	while ($row = mysql_fetch_array($result)) {
		$skillname = $row['skill_name'];
		$skillid = $row['skill_id'];
		echo "$skillname<br>";
		}
?>
</html>
</body>
