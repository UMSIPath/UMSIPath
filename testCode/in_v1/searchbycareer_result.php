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

if(isset($_POST['selectedcareers'])) 
{

$careers = $_POST['selectedcareers'];

# looping through array
foreach ($careers as $value) {
	echo "<h1><b>Career:</b> $value</h1>";

# locating career ID
	$result = mysql_query("SELECT career_id FROM careers WHERE career_title = '$value'");
	$id = mysql_fetch_assoc($result);
	$careerid = $id['career_id'];

# finding associated skills
	$result2 = mysql_query("SELECT skill_id FROM careers_skills WHERE career_id = '$careerid'");
	while ($row = mysql_fetch_array($result2)) {
		$skillid = $row['skill_id'];
		$result3 = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
		$skill = mysql_fetch_array($result3);
		$skillname = $skill['skill_name'];
		echo "Required skill:  <a href=skill.php?id=$skillid>$skillname</a><br>";

# finding associated course ID
		$result4 = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$skillid'");
		$courses = array();
		while ($row = mysql_fetch_array($result4)) {
			$courseid = $row['course_id'];
			$courses[] = $courseid;
		}
	
# looking up associated course info
		echo "<b>Relevant courses:</b>";
		foreach ($courses as $value) {
			$result5 = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
			$course = mysql_fetch_assoc($result5);
			$coursename = $course['course_title'];
			$coursenum = $course['course_number'];
			$coursedesc = $course['course_description'];
			echo "<br><i>$coursenum: <a href=course.php?id=$courseid>$coursename</a></i><br>
			$coursedesc<br>";
			}
		echo "<br>";
		}
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

</body>
</html>