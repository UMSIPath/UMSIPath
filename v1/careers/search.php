<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Find Courses by Skills</title>
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="careers-header-wrap">
        	<div id="careers-header">
            	<div id="section-icon"><img src="../static/images/section-icon-careers.png" /></div>
            	<div id="section-header">
            	  <h1 class="section-header-single">Choose careers, you should.</h1></div>
                <div id="learnmore" class="careers">
                  <p><a href="index.php">Want to learn more about these careers? Check them out here.</a></p></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>></span>&ensp; Choose Careers</h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<h2 class="page-subheader">Which careers are you interested in? Select all that apply.</h2>
            	
                <form id="checklist-form" action="results.php" method="post">
                <div id="checklist">
					<?php
                    require_once "../db.php";
                    session_start();
                    
                    $result = mysql_query("SELECT * FROM skills"); 
                    
                    while($row = mysql_fetch_array($result)) 
                      { 
                        $name = $row[skill_name];
                        $id = $row[skill_id];
                        echo '<input id="' . $id . '" type="checkbox" name="selectedskills[]" value="' . $name . '" ><label for="' . $id . '" >' . $name . '</label><br><br>';
                    }
                      
                    ?>
                    
                </div> 
            
                <div id="page-nav-btns">
                    <div id="top-btn"><a class="top-btn" href="#">Top</a></div>
                    <div id="next-btn"><input type="submit" class="button" value="Next"></div>
                </div>
                </form>
            </div>
        </div>
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>