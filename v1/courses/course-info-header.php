    	<div id="courses-header-wrap">
        	<div id="courses-header">
            	<div id="section-icon" class="courses"><img src="../static/images/section-icon-courses.png" /></div>
            	<div id="section-header"><h2 class="section-descriptor" id="courses">Course</h2><h1 class="section-header-single" id="courses-info">
            	
<?php
require_once "../db.php";
session_start();

# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);

# getting attributes of course
$result = mysql_query("SELECT * FROM courses WHERE course_id = '$id'");
		$course = mysql_fetch_assoc($result);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		$courseunits = $course['units'];
		$coursetype = $course['type'];
		echo "$coursenum: $coursename";
		$type = 'course';
		$uid = "5";
?>
            	
            	</h1></div>
                <div id="save-btn-area"><!-- -->
                	<div id="btn-wrap">
                    	<a href="#" id="save-btn" class="default" data-num="<?php echo $id;?>" data-type="<?php echo $type; ?>" data-user="<?php echo $uid; ?>">Save</a>
                    </div>
                </div>
            </div>
        </div>