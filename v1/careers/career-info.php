<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Career Info</title> <!-- pull in individual career title here? -->
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="careers-header-wrap">
        	<div id="careers-header">
            	<div id="section-icon"><img src="../static/images/section-icon-careers.png" /></div>
            	<div id="section-header"><h2 class="section-descriptor" id="careers">Career</h2><h1 class="section-header-single" id="info">
<?php
require_once "../db.php";
session_start();

$courses = array();

# getting ID from URL
$careerid = mysql_real_escape_string($_GET['id']);

# finding name
$result = mysql_query("SELECT * FROM careers WHERE career_id = '$careerid'");
$career = mysql_fetch_assoc($result);
$careername = $career['career_title'];
$careerdesc = $career['career_description'];
echo "$careername";
?>
            	
            	</h1></div>
                <div id="save-btn-area">
                	<div id="btn-wrap">
                    	<a href="#" id="save-btn" class="default">Save</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<div id="breadcrumbs-nav"><h3 class="breadcrumbs"><a href="index.php">< &ensp; Back to Browse All Careers</a></h3></div>
                <div id="breadcrumbs-blue"></div>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<div class="section-info">
                	<?php
                	echo "<p>$careerdesc</p>";
                	?>
                	
                </div>
                <div class="section-rsidebar">
                	
                    <div class="rsidebar-header">
                    	<div class="rsh-left"><h4>Related skills</h4></div>
                        <div class="rsh-right"><h4>Related courses</h4></div>
                    </div>
                    
                    <div id="rsidebar-divider-top"></div> <!-- don't move me -->
<?php
$result2 = mysql_query("SELECT skill_id FROM careers_skills WHERE career_id = '$careerid'");
while ($row = mysql_fetch_array($result2)) {
	$skillid = $row['skill_id'];
	$result3 = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
	$skill = mysql_fetch_array($result3);
	$skillname = $skill['skill_name'];
	$skillid = $skill['skill_id'];
echo <<< TEST
	
	<div class="related-wrapper">
    	<div class="related-left"><h5><a href="../skills/skill-info.php?id=$skillid">$skillname</a></h5></div>	
TEST;

# finding associated course ID
	$result4 = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$skillid'");
	$courses = array();
	while ($row = mysql_fetch_array($result4)) {
		$courseid = $row['course_id'];
		$courses[] = $courseid;
	}


# looking up associated course info
	echo "<div class=\"related-right\"><ul>";
	foreach ($courses as $value) {
		$result5 = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
		$course = mysql_fetch_assoc($result5);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		$courseid = $course['course_id'];
		echo "<li><a href=../courses/course-info.php?id=$courseid>$coursenum: $coursename</a></li>";
		}
	echo "</ul></div></div><div id=\"rsidebar-divider\"></div>";
	}


?>
                    </div>
                </div>
			</div><!-- end content -->        
        
        
        </div><!-- end content-wrap -->
        
    </div><!-- end main -->
</div><!-- end container -->

<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>