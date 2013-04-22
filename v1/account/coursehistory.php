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
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>/</span>&ensp; <a href="../profile.php">Profile </a> &ensp;<span>/</span>&ensp; Course History&ensp;<span>/</span>&ensp; <a href="saved-items.php">Saved Items</a></h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
        <div id="hp-mission-wrap">
        	<div id="hp-mission">
            	<h1 class="hp-mission">My Course History</h1>
                <p class="hp-mission">My history here.</p>
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