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
		echo "$coursedesc";
?>                
                </div>
            	
                <div class="section-rsidebar">
                	<div class="related">
                    	<h4>Related Skills</h4>
<?php
$result = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");
$skills = array();
while ($row = mysql_fetch_array($result)) {
	$skillid = $row['skill_id'];
	$skills[] = $skillid;
	}
	
# looking up associated skill info
foreach ($skills as $value) {
	$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$value'");
	$skill = mysql_fetch_assoc($result);
	$skillname = $skill['skill_name'];
	echo "<br><a href=../skills/skill-info.php?id=$skillid>$skillname</a>";
	
	}
echo "<br>";
?>                
                </div>
            	</div>
            
			</div><!-- end content -->        
        
        
        </div><!-- end content-wrap -->