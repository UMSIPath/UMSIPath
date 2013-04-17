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
            	<div id="section-header"><h1 class="section-header-double">Based on the skills you chose, we think these courses will interest you...</h1></div>
                <div id="learnmore" class="skills"><p><a href="index.php">Want to learn more about these skills? Check them out here.</a></p></div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> <span>&ensp;/&ensp;</span> <a href="search.php">Choose Skills</a> <span>&ensp;/&ensp;</span> Results</h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	
                
                <div class="results-module"> <!-- repeatable module -->
                	<div class="results-module-name">
                    	<h3 class="results-module-type">Skill</h3>
                    	<h2 class="results-module-label"><a href="#">Database Design Skill</a></h2>
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
                			
                
            </div> <!-- end content -->
        </div> <!-- end content-wrap -->
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>