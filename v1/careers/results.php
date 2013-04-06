<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Find Courses by Careers</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="careers-header-wrap">
        	<div id="careers-header">
            	<div id="section-icon"><img src="../static/images/section-icon-careers.png" /></div>
            	<div id="section-header"><h1 class="section-header-double">Based on the skills you chose, we think these courses will interest you...</h1></div>
                <div id="learnmore" class="careers"><p><a href="index.php">Want to learn more about these skills? Check them out here.</a></p></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> <span>&ensp;/&ensp;</span> <a href="search.php">Choose Careers</a> <span>&ensp;/&ensp;</span> Results</h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
           		
				
				
				<?php
require_once "../db.php";
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
		echo "<br><i>$coursenum: <a href=../courses/courses-info.php?id=$courseid>$coursename</a></i><br>
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
		echo "<br><i>$coursenum: <a href=../courses/courses-info.php?id=$courseid>$coursename</a></i><br>
		$coursedesc<br>";
		}
}

?>
                
            </div>
        </div>
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>