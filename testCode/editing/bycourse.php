<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <link href="styles-02.css" rel="stylesheet" type="text/css">
</head>

<html>
<body>
<a href=index.php>Home</a><br><br>

<h1>THIS DOESN'T WORK YET</h1>


<?php
require_once "db.php";
session_start();

#inserting post data
if(isset($_POST['skill'])) {
    	$skillid = $_POST['skill'];
    	$courseid = $_POST['course'];
    	
    	echo $skillid;
    	echo $courseid;
    	
    	foreach($skillid as $value) {  	
    		$sql = "INSERT INTO courses_skills (course_id, skill_id) VALUES ($courseid, $value)";
    		mysql_query($sql);
    }
    }

# looping through array

if(isset($_GET['id'])) {
# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);
$next = $id + 1;
$prev = $id - 1;

echo "<a href=bycourse.php?id=$prev>Previous Class</a> | <a href=bycourse.php?id=$next>Next Class</a>" ;
$skills = array();

# getting attributes of course
$result = mysql_query("SELECT * FROM courses WHERE course_id = '$id'");
		$course = mysql_fetch_assoc($result);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		$courseunits = $course['units'];
		$coursetype = $course['type'];
		echo "<h1>$coursenum: $coursename</h1><br>
		Credits: $courseunits<br>
		Type of class: $coursetype<br><br>
		<b>Description:</b><br>$coursedesc<br>";
			
# finding associated skill ID
$result = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");
$skills = array();
while ($row = mysql_fetch_array($result)) {
	$skillid = $row['skill_id'];
	$skills[] = $skillid;
	}
$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$value' ORDER BY skill_name");
$allskills = mysql_fetch_assoc($result);

$okskills = array_diff($allskills, $skills);

# looking up associated skill info
echo "<b><br>Skills this course teaches:</b>";

foreach ($okskills as $value) {
	$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$value' ORDER BY skill_name");
	$skill = mysql_fetch_assoc($result);
	$skillname = $skill['skill_name'];
	echo "<br>$skillname";
	
	}

#form with list of skills
echo "<b><br><br>Add skills:</b>";
$result = mysql_query("SELECT * FROM skills ORDER BY skill_name"); 
while($row = mysql_fetch_array($result)) {
  	$name = $row['skill_name'];
  	$skillid = $row['skill_id'];
	echo '<form method="post" action=bycourse.php>';
	echo '<input id="' . $skillid . '" type="checkbox" name="skill" value="' . $skillid . '" ><label for="' . $skillid . '" >' . $name . '</label>';
	echo '<input id="' . $id . '" type="checkbox" name="course" value="' . $id . '" checked ><label for="' . $id . '" ></label><br>';
}
}

else {
echo "<h1>Select a course to modify</h1>";
$result = mysql_query("SELECT * FROM courses ORDER BY course_number");
	while ($row = mysql_fetch_array($result)) {
		$coursename = $row['course_title'];
		$coursenum = $row['course_number'];
		$courseid = $row['course_id'];
		echo "$coursenum: <a href=bycourse.php?id=$courseid>$coursename</a><br>";
		}
	}
  
?>

<input type="submit" class="button" value="Submit"></form></div>

</body>
</html>