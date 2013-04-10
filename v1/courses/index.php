<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Browse All Courses</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="courses-header-wrap">
        	<div id="courses-header">
            	<div id="section-icon" class="courses"><img src="../static/images/section-icon-courses.png" /></div>
            	<div id="section-header"><h1 class="section-header-single" id="courses">Browse All Courses</h1></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>/</span>&ensp;  All Courses &ensp;<span>/</span>&ensp;  <a href="../skills/index.php">All Skills</a> &ensp;<span>/</span>&ensp; <a href="../careers/index.php"> All Careers</a></h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<div id="browse-all-list">
                	<ul class="browseall" id="courses">
<?php
require_once "../db.php";
session_start();
        	
$result = mysql_query("SELECT * FROM courses ORDER BY course_number");
	while ($row = mysql_fetch_array($result)) {
		$coursename = $row['course_title'];
		$coursenum = $row['course_number'];
		$coursedesc = $row['course_description'];
		$courseid = $row['course_id'];
		echo "<li><span class='coursenum-label'>SI $coursenum</span> <span class='course-name'><a href='course-info.php?id=$courseid'> $coursename</a></span></li>";
		}
?> 
   					</ul>             	
                </div> 
            </div>        
        </div> <!-- end content-wrap -->
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>