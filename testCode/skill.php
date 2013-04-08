<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <link href="styles-01.css" rel="stylesheet" type="text/css">
</head>

<html>
<body>

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
		$skilldesc = $skill['skill_description'];
		echo "<h1>$skillname</h1><br>Description: $skilldesc<br><br>";
		
# finding associated course ID
$result = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$id'");
$courses = array();
while ($row = mysql_fetch_array($result)) {
	$courseid = $row['course_id'];
	$courses[] = $courseid;
}
	
# looking up associated course info
echo "Courses that teach this skill:<br>";
foreach ($courses as $value) {
	$result = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
	$course = mysql_fetch_assoc($result);
	$coursename = $course['course_title'];
	$coursenum = $course['course_number'];
	$coursedesc = $course['course_description'];
	echo "$coursenum: <a href=../courses/courses-info.php?id=$courseid>$coursename</a><br>
	$coursedesc<br>";
	}
echo "<br>";

# finding associated career ID
$result = mysql_query("SELECT career_id FROM careers_skills WHERE skill_id = '$id'");
$careers = array();
while ($row = mysql_fetch_array($result)) {
	$careerid = $row['career_id'];
	$careers[] = $careerid;
}
	
# looking up associated career info
echo "<b>Careers related to this skill:</b>";
foreach ($careers as $value) {
	$result = mysql_query("SELECT * FROM careers WHERE career_id = '$value'");
	$career = mysql_fetch_assoc($result);
	$careertitle = $career['career_title'];
	$careerdesc = $course['career_description'];
	echo "<br><a href=../careers/careers-info.php?id=$careerid>$careertitle</a></i><br>
	$careerdesc";
	}
echo "<br>";



?>

</body>
</html>