<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <link href="styles-01.css" rel="stylesheet" type="text/css">
</head>


<?php
require_once "db.php";
session_start();

if(isset($_POST['selectedskills'])) 
{

$skills = $_POST['selectedskills'];

# looping through array
foreach ($skills as $value) {
	echo "<h1><b>Skill:</b> $value</h1>";

# locating skill ID
	$result = mysql_query("SELECT skill_id FROM skills WHERE skill_name = '$value'");
	$id = mysql_fetch_assoc($result);
	$skillid = $id['skill_id'];

# finding associated course ID
	$result = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$skillid'");
	$courses = array();
	while ($row = mysql_fetch_array($result)) {
		$courseid = $row['course_id'];
		$courses[] = $courseid;
	}
	
# looking up associated course info
	echo "<b>Relevant courses:</b>";
	foreach ($courses as $value) {
		$result = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
		$course = mysql_fetch_assoc($result);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		echo "<br><i>$coursenum: <a href=course.php?id=$courseid>$coursename</a></i><br>
		$coursedesc<br>";
		}
	echo "<br>";
}
}

else {
	echo "Not sure what skill you want to learn? Browse all classes:<br>";
	$result = mysql_query("SELECT * FROM courses");
	while ($row = mysql_fetch_array($result)) {
		$coursename = $row['course_title'];
		$coursenum = $row['course_number'];
		$coursedesc = $row['course_description'];
		$courseid = $row['course_id'];
		echo "<br><i>$coursenum: <a href=course.php?id=$courseid>$coursename</a></i><br>
		$coursedesc<br>";
		}
}

?>