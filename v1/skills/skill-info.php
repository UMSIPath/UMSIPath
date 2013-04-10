<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Skills Info</title> <!-- pull in individual skill title here? -->
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="skills-header-wrap">
        	<div id="skills-header">
            	<div id="section-icon"><img src="../static/images/section-icon-skills.png" /></div>
            	<div id="section-header"><h2 class="section-descriptor" id="skills">Skill</h2><h1 class="section-header-single" id="info">
            	
<?php
            	
require_once "../db.php";
session_start();

$courses = array();

# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);

# getting attributes of skill
$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$id'");
$skill = mysql_fetch_assoc($result);
$skillname = $skill['skill_name'];
$skilldesc = $skill['skill_description'];
echo "$skillname";
            	
?>
            	
            	</h1></div>
                <div id="save-btn-area"><p>Save button goes here</p></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<div id="breadcrumbs-nav"><h3 class="breadcrumbs"><a href="index.php">< &ensp; Back to Browse All Skills</a></h3></div>
                <div id="breadcrumbs-blue"></div>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<div class="section-info">
<?php
# getting attributes of skill
echo "$skilldesc";
		
# finding associated course ID
$result = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$id'");
$courses = array();
while ($row = mysql_fetch_array($result)) {
	$courseid = $row['course_id'];
	$courses[] = $courseid;
}
?>  	            
                </div>
            	
                <div class="section-rsidebar">
                	<div class="related">
                    	<h4>Related Courses</h4>
<?php
echo "<ul>";
foreach ($courses as $value) {
	$result = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
	$course = mysql_fetch_assoc($result);
	$coursename = $course['course_title'];
	$coursenum = $course['course_number'];
	$coursedesc = $course['course_description'];
	echo "<li>$coursenum: <a href=../courses/course-info.php?id=$courseid>$coursename</a><br></li>";
	}
echo "</ul>";
?>
                     </div>
                    
                    <div id="rsidebar-divider"></div>
                    
                    <div class="related">
                    	<h4>Related Careers</h4>
<?php
# finding associated career ID
$result = mysql_query("SELECT career_id FROM careers_skills WHERE skill_id = '$id'");
$careers = array();
while ($row = mysql_fetch_array($result)) {
	$careerid = $row['career_id'];
	$careers[] = $careerid;
}

# looking up associated career info
echo "<ul>";
foreach ($careers as $value) {
	$result = mysql_query("SELECT * FROM careers WHERE career_id = '$value'");
	$career = mysql_fetch_assoc($result);
	$careertitle = $career['career_title'];
	echo "<li><a href=../careers/career-info.php?id=$careerid>$careertitle</a></li>";
}
echo "</ul>";
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