<?php
require_once "db.php";
session_start();

$courses = array();

# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);

# getting attributes of skill
$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$id'");
		$skill = mysql_fetch_assoc($result);
		$skillname = $skill['skill_name'];
		echo "<h1>$skillname</h1>";
		
# finding associated courses
$result = mysql_query("SELECT * FROM courses_skills WHERE skill_id = '$id'");
	while ($row = mysql_fetch_array($result)) {
		$courseid = $row['course_id'];
		
# looking up names of associated courses
		echo "<br>Relevant classes:";
		$result = mysql_query("SELECT * FROM courses WHERE course_id = '$courseid'");
		$courses = mysql_fetch_assoc($result);
		$coursename = $courses['course_title'];
		echo "<br><a href=course.php?id=$courseid>$coursename</a><br>";
		}		

?>