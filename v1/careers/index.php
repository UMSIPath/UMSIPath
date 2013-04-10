<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Browse All Careers</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="careers-header-wrap">
        	<div id="careers-header">
            	<div id="section-icon"><img src="../static/images/section-icon-careers.png" /></div>
            	<div id="section-header"><h1 class="section-header-single">Browse All Careers</h1></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>/</span>&ensp; <a href="../courses/index.php"> All Courses</a> &ensp;<span>/</span>&ensp; <a href="../skills/index.php">All Skills</a> &ensp;<span>/</span>&ensp; All Careers</h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<div id="browse-all-list">
                	<ul class="browseall">
<?php
require_once "../db.php";
session_start();
        	
$result = mysql_query("SELECT * FROM careers ORDER BY career_title");
	while ($row = mysql_fetch_array($result)) {
		$careertitle = $row['career_title'];
		$careerdesc = $row['career_description'];
		$careerid = $row['career_id'];
		echo "<li><a href=career-info.php?id=$careerid>$careertitle</a></li>";
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