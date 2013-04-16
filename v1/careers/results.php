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
            	<div id="section-header"><h1 class="section-header-double">Based on the careers you chose, we think these courses will interest you...</h1></div>
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

if(isset($_POST['selectedcareers'])) 
{

$careers = $_POST['selectedcareers'];

# looping through array
foreach ($careers as $value) {
	echo "<h1>Career: $value</h1>";

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
		echo "Required skill:  <a href=../skills/skill-info.php?id=$skillid>$skillname</a><br>";

# finding associated course ID
		$result4 = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$skillid'");
		$courses = array();
		while ($row = mysql_fetch_array($result4)) {
			$courseid = $row['course_id'];
			$courses[] = $courseid;
		}
	
# looking up associated course info
		echo "<b>Relevant courses:<br></b>";
		foreach ($courses as $value) {
			$result5 = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
			$course = mysql_fetch_assoc($result5);
			$coursename = $course['course_title'];
			$coursenum = $course['course_number'];
			echo "<i>$coursenum: <a href=../courses/course-info.php?id=$courseid>$coursename</a></i><br>";
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
		echo "<br><i>$coursenum: <a href=../courses/course-info.php?id=$courseid>$coursename</a></i><br>
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