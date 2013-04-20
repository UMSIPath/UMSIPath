<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Find Courses by Skills</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="skills-header-wrap">
        	<div id="skills-header">
            	<div id="section-icon"><img src="../static/images/section-icon-skills.png" /></div>
            	<div id="section-header"><h1 class="section-header-single">Choose skills, you must, young Skywalker.</h1></div>
                <div id="learnmore" class="skills"><p><a href="index.php">Want to learn more about these skills? Check them out here.</a></p></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>/</span>&ensp; Choose Skills</h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<h2 class="page-subheader">Which skills are you interested in? Select all that apply.</h2>
            	
                <form id="checklist-form" action="results.php" method="post">
                <div id="checklist">
					<?php
                    require_once "../db.php";
                    session_start();
                    
                    $result = mysql_query("SELECT * FROM skills ORDER BY skill_name"); 
                    
                    while($row = mysql_fetch_array($result)) 
                      { 
                        $name = $row[skill_name];
                        $id = $row[skill_id];
                        echo '<input id="' . $id . '" type="checkbox" name="selectedskills[]" value="' . $name . '" ><label for="' . $id . '" >' . $name . '</label><br><br>';
                    }
                      
                    ?>
                    
                </div> 
            
                <div id="page-nav-btns">
                    <!-- <div id="top-btn"><a class="top-btn" href="#">Top</a></div> -->
                    <div id="next-btn"><input type="submit" class="button" value="Next"></div>
                </div>
                </form>
            </div><!-- end content -->
        </div><!-- end content-wrap -->
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>