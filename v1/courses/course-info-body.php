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
		echo "<h3>About SI $coursenum:</h3>";
		echo "<p>$coursedesc</p>";
?>                
                </div>
            	
                <div class="section-rsidebar">
                	<div class="related">
                    	<h4>Related Skills & Careers</h4>
<?php
$result = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");
$skills = array();
while ($row = mysql_fetch_array($result)) {
	$skillid = $row['skill_id'];
	$skills[] = $skillid;
	}
	
# looking up associated skill info
echo "<ul>";
foreach ($skills as $value) {
	$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$value'");
	$skill = mysql_fetch_assoc($result);
	$skillname = $skill['skill_name'];
	$skillid = $skill['skill_id'];
	echo "<li><a href=../skills/skill-info.php?id=$skillid>$skillname</a></li></ul>";
	
	$result2 = mysql_query("SELECT career_id FROM careers_skills WHERE skill_id = '$skillid'");
	$careers = array();
	while ($row = mysql_fetch_array($result2)) {
		$careerid = $row['career_id'];
		$careers[] = $careerid;
		}

# looking up associated career info
	echo "<h4><br>Careers:</h4><ul>";
	foreach ($careers as $value) {
		$result = mysql_query("SELECT * FROM careers WHERE career_id = '$value'");
		$career = mysql_fetch_assoc($result);
		$careertitle = $career['career_title'];
		echo "<li><a href=../careers/career-info.php?id=$careerid>$careertitle</a></li>";
	}
	echo "</div><div id=\"rsidebar-divider\"></div><div class=\"related\">";

	}
?>                
<<<<<<< HEAD
            
            
            
                </div>
            	</div>
=======
                	</div>
                    
                     <div id="rsidebar-divider"></div>
                    
                    <div class="related">
                    	<h4>Related Careers</h4>
                    	<ul>
                            <li>sidebar text blhahlalhalhd a;lksdfl;as</li>
                            <li>sidebar text blhahlalhalhd a;lksdfl;as</li>
                            <li>sidebar text</li>
                        </ul>
                    </div>
            	</div><!-- end section-rsidebar -->
>>>>>>> stylin' things
            
			</div><!-- end content -->        
        
        
        </div><!-- end content-wrap -->