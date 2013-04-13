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
		echo "<h3>Credits: $credits</h3>";
		echo "<h3>Type: $type";

if ($syllabus == '') {
    echo "<h3>No syllabus available</h3>";
} 
else { echo "<h3>Syllabus: <a href=$syllabus>download</a></h3>";}

		echo "<h3>About SI $coursenum:</h3>";
		echo "<p>$coursedesc</p>";
?>                
                </div>
            	
                <div class="section-rsidebar">
                	<div class="related">
                    	<h4>Related Skills & Careers</h4>
<?php
$result2 = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");
while ($row = mysql_fetch_array($result2)) {
	$skillid = $row['skill_id'];
	$result3 = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
	$skill = mysql_fetch_array($result3);
	$skillname = $skill['skill_name'];
	echo "<ul><li>Skill: <a href=../skills/skill-info.php?id=$skillid>$skillname</a></li></ul>";

# finding associated career ID
	$result4 = mysql_query("SELECT career_id FROM careers_skills WHERE skill_id = '$skillid'");
	$careers = array();
	while ($row = mysql_fetch_array($result4)) {
		$careerid = $row['career_id'];
		$careers[] = $careerid;
	}


# looking up associated career info
	echo "<ul>";
	foreach ($careers as $value) {
		$result5 = mysql_query("SELECT * FROM careers WHERE career_id = '$value'");
		$career = mysql_fetch_assoc($result5);
		$careername = $career['career_title'];
		$careerdesc = $career['career_description'];
		echo "<li><a href=../careers/career-info.php?id=$careerid>$careername</a></li>";
		}
	echo "</ul>";
	echo "</div><div id=\"rsidebar-divider\"></div><div class=\"related\">";
	}
?>                
            
            		</ul>
                </div>
            	
            	</div><!-- end section-rsidebar -->
            
			</div><!-- end content -->        
        
        
        </div><!-- end content-wrap -->