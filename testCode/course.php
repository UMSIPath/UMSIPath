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

$skills = array();

# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);

# getting attributes of course
$result = mysql_query("SELECT * FROM courses WHERE course_id = '$id'");
		$course = mysql_fetch_assoc($result);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		echo "<h1>$coursenum: $coursename</h1>
		$coursedesc<br>";
			
# finding associated skill ID
$result = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");
$skills = array();
while ($row = mysql_fetch_array($result)) {
	$skillid = $row['skill_id'];
	$skills[] = $skillid;
	}
	
# looking up associated skill info
echo "<b><br>Skills this course teaches:</b>";

foreach ($skills as $value) {
	$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$value'");
	$skill = mysql_fetch_assoc($result);
	$skillname = $skill['skill_name'];
	echo "<br><a href=../skills/skills-info.php?id=$skillid>$skillname</a>";
	
	}
echo "<br>";

# related careers?

?>

<DIV class=”favorite”><input type="submit" class ="button" value="SAVE"></DIV>
<script src="ajax/ajax_framework.js" language="javascript">
/*
jess added this code. this is the code to submit the "save" info.
//it takes the course number and posts it to a different php file that puts it in the db.
//if it does not work, blame jess.

#jess added this code. this is the placeholder for the "save" button.*/


$('.favorite').click(function() {
var heading=$(“h1”).html()
var coursedata = heading.split(‘:’)
var coursenumber = coursedata[0]
  $.ajax({
    'url' : 'addtofavorites.php',
    'type' : 'POST',
    'data' : {number : coursenumber},
    'success' : function(data) {
      if (data == 'saved') {
        $button.text('Saved');
      }
    }
  });
});

</script>

</html>
</body>