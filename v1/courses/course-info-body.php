        <div id="content-wrap">
        	<div id="content">
            	<div class="section-info">
                
<?php
require_once "../db.php";
session_start();

# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);

# getting attributes of course
$result = mysql_query("SELECT * FROM courses WHERE course_id = '$id'");
		$course = mysql_fetch_assoc($result);
		$coursedesc = $course['course_description'];
		$credits = $course['units'];
		$syllabus = $course['syllabus'];
		$type = $course['type'];

		echo "<h3>Description</h3>";
		echo "<p>$coursedesc</p>";
		echo "<div id='section-divider'></div>";
		echo "<h3>Details</h3>";
		echo "<h4>Credits: $credits</h4>";
		echo "<h4>Course Type: $type</h4>";

if ($syllabus == '') {
    echo "<a href='#' id='syllabus-btn' class='inactive'>No Syllabus Available</a>";
} 
else { echo <<< HEY
	<a href="$syllabus" id="syllabus-btn" class="default">Download Syllabus</a>
HEY;
}
?>                
                </div>
            	
                <div class="section-rsidebar">
                	<div class="rsidebar-header">
                    	<div class="rsh-left"><h4>Related skills</h4></div>
                        <div class="rsh-right"><h4>Related careers</h4></div>
                    </div>
                    
                    <div id="rsidebar-divider-top"></div> <!-- don't move me -->
<?php
$result2 = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");

# checking for related skills
$testing = mysql_fetch_array($result2);
if (empty($testing)) {

echo <<< TEST
	
	<div class="related-wrapper">
    	<div class="related-left"><h5><a href="#">TBD</a></h5></div>	
TEST;

}
else {

while ($row = mysql_fetch_array($result2)) {
	$skillid = $row['skill_id'];
	$result3 = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
	$skill = mysql_fetch_array($result3);
	$skillname = $skill['skill_name'];
echo <<< TEST
	
	<div class="related-wrapper">
    	<div class="related-left"><h5><a href="../skills/skill-info.php?id=$skillid">$skillname</a></h5></div>	
TEST;

# finding associated career ID
	$result4 = mysql_query("SELECT career_id FROM careers_skills WHERE skill_id = '$skillid'");
	$careers = array();
	while ($row = mysql_fetch_array($result4)) {
		$careerid = $row['career_id'];
		$careers[] = $careerid;
	}

	echo "<div class=\"related-right\"><ul>";

# checking for related careers

if (empty($careers)) {
	echo "<li><a href=#>TBD</a></li>";
	echo "</ul></div></div><div id=\"rsidebar-divider\"></div>";
}
else {

# looking up associated career info
	foreach ($careers as $value) {
		$result5 = mysql_query("SELECT * FROM careers WHERE career_id = '$value'");
		$career = mysql_fetch_assoc($result5);
		$careername = $career['career_title'];
		$careerdesc = $career['career_description'];
		$careerid = $career['career_id'];
		echo "<li><a href=../careers/career-info.php?id=$careerid>$careername</a></li>";
		}
	echo "</ul></div></div><div id=\"rsidebar-divider\"></div>";
	}
	}
	}
?>                
            
             </div><!-- end right sidebar -->
			</div><!-- end content -->        
        
        
        </div><!-- end content-wrap -->
        
