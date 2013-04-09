<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Browse All Skills</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="skills-header-wrap">
        	<div id="skills-header">
            	<div id="section-icon"><img src="../static/images/section-icon-skills.png" /></div>
            	<div id="section-header"><h1 class="section-header-single">Browse All Skills</h1></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>/</span>&ensp; <a href="../courses/index.php">All Courses</a> &ensp;<span>/</span>&ensp;  All Skills &ensp;<span>/</span>&ensp; <a href="../careers/index.php">All Careers</a></h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<div id="browse-all-list">
<?php
require_once "../db.php";
session_start();
        	
$result = mysql_query("SELECT * FROM skills ORDER BY skill_name");
	while ($row = mysql_fetch_array($result)) {
		$skillname = $row['skill_name'];
		$skillid = $row['skill_id'];
		echo "<a href=skill-info.php?id=$skillid>$skillname</a></i><br>";
		}
?>                             	
                </div> 
            </div>        
        </div> <!-- end content-wrap -->
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>