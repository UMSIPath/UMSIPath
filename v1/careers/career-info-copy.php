<?php include('../includes/head.php'); ?>
    <title>UMSI / Discover: Career Info</title> <!-- pull in individual career title here? -->
    </head>


<body>

<div id="container">
    <?php include('../includes/navigation.php'); ?>
    <div id="main">
    	<div id="careers-header-wrap">
        	<div id="careers-header">
            	<div id="section-icon"><img src="../static/images/section-icon-careers.png" /></div>
            	<div id="section-header"><h2 class="section-descriptor" id="careers">Career</h2><h1 class="section-header-single" id="info">
<?php
require_once "../db.php";
session_start();

$courses = array();

# getting ID from URL
$careerid = mysql_real_escape_string($_GET['id']);

# finding name
$result = mysql_query("SELECT * FROM careers WHERE career_id = '$careerid'");
$career = mysql_fetch_assoc($result);
$careername = $career['career_title'];
$careerdesc = $career['career_description'];
echo "$careername";
?>
            	
            	</h1></div>
                <div id="save-btn-area">
                	<div id="btn-wrap">
                    	<a href="#" id="save-btn" class="default">Save</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<div id="breadcrumbs-nav"><h3 class="breadcrumbs"><a href="index.php">< &ensp; Back to Browse All Careers</a></h3></div>
                <div id="breadcrumbs-blue"></div>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
            	<div class="section-info">
                	<?php
                	echo "<p>$careerdesc</p>";
                	?>
                	
                </div>
                <div class="section-rsidebar">
                	
                    <div class="rsidebar-header">
                    	<div class="rsh-left"><h4>Related skills</h4></div>
                        <div class="rsh-right"><h4>Related courses</h4></div>
                    </div>
                    
                    <div id="rsidebar-divider-top"></div> <!-- don't move me -->
                    
                    <div class="related-wrapper">
                    	<div class="related-left"><h5><a href="#">skill name lorem</a></h5></div>
                        <div class="related-right">
                        	<ul>
                            	<li><a href="#">course 1</a></li>
                                <li><a href="#">course 2</a></li>
                            </ul>
                        </div>
                    </div>
                        
                   <div id="rsidebar-divider"></div> <!-- repeat me -->

                                        
                  
                </div><!-- end right sidebar -->
			</div><!-- end content -->        
        
        
        </div><!-- end content-wrap -->
        
    </div><!-- end main -->
</div><!-- end container -->

<?php include('../includes/footer.php'); ?>

</div>
</body>
</html>