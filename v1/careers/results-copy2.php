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
             <div class="results-module-career-wrap"> <!-- REPEAT ME module starts here -->


<?php
require_once "../db.php";
session_start();

if(isset($_POST['selectedcareers'])) 
{

$careers = $_POST['selectedcareers'];

# looping through array
foreach ($careers as $value) {

ECHO <<< TEST
                    <div class="results-module-career">
                    	<h1 class='career-title'>$value</h1>
               
                    </div>
TEST;

$result2 = mysql_query("SELECT skill_id FROM careers_skills WHERE career_id = '$careerid'");
	while ($row = mysql_fetch_array($result2)) {
		$skillid = $row['skill_id'];
		$result3 = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
		$skill = mysql_fetch_array($result3);
		$skillname = $skill['skill_name'];

ECHO <<< TEST2
                    <div class="results-module"> <!-- repeatable module -->
                        <div class="results-module-name">
                            <h3 class="results-module-type">Skill</h3>
                            <h2 class="results-module-label"><a href="#" target="_blank">$skillname</a></h2>
                        </div>
                        
                        <div class="results-module-content">
                            <h3 class="results-module-type" id="course">Courses</h3>
                            <ul class="results-course-list">
                                <li><a href="#" target="_blank">course name here</a></li>
                                <li><a href="#" target="_blank">another course</a></li>
                                <li><a href="#" target="_blank">course name here</a></li>
                                <li><a href="#" target="_blank">another course</a></li>
                                <li><a href="#" target="_blank">course name here</a></li>
                                <li><a href="#" target="_blank">another course</a></li>
                            </ul>
                        </div>
                        
                    </div> <!-- end repeatable module -->
                    
                    <div class="spacer"></div>
TEST2;
}
}
}
?>
                      
                </div><!-- end results-module-career-wrap -->    
            </div><!-- end content -->
        </div><!-- end content wrap -->
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</body>
</html>