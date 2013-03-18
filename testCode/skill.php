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
		
# finding associated course ID
$result = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$id'");
$courses = array();
while ($row = mysql_fetch_array($result)) {
	$courseid = $row['course_id'];
	$courses[] = $courseid;
}
	
# looking up associated course info
echo "<b>Courses that teach this skill:</b>";
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


?>