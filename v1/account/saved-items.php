<?php include('../includes/head.php'); 

require_once "../db.php";
session_start();
?>
    <title>UMSI / Discover: User Profile</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="student-header-wrap">
        	<div id="student-header">
            	<div id="section-header"><h1 class="section-header-single">User Profile</h1>

            	</div>
            </div>
        </div> <!-- end header-wrap -->
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"> <a href="../index.php">Home</a> &ensp;<span>/</span>&ensp; <a href="../profile.php">Profile </a> &ensp;<span>/</span>&ensp; <a href="coursehistory.php">Course History</a>&ensp;<span>/</span>&ensp; Saved Items </h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
        <div id="hp-mission-wrap">
        	<div id="hp-mission">
            	<h1 class="hp-mission">My Saved Items</h1>
                <p class="hp-mission">
                
<?php
#this is for dumping the courses
$savedcourses = mysql_query("SELECT course_id FROM students_courses WHERE student_id = '5'");
$courses = array();
while ($row = mysql_fetch_array($savedcourses)) {
    $courseid = $row['course_id'];
    $courses[] = $courseid;
    }
foreach ($courses as $courseitem){
$coursename = mysql_query("SELECT course_title FROM courses WHERE course_id = '$courseitem'");
while ($row = mysql_fetch_array($coursename)) {
    echo $row['course_title'];
    }
    }

?>
                
                
                </p>
            </div>
        </div> <!-- end main -->           	
                </div> 
            </div>     
                    </div> <!-- end content-wrap -->   
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>