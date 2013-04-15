<?php include('includes/head.php'); ?>
    <title>UMSI / Discover: User Profile</title>
    </head>


<body>

<div id="container">
    <?php include('includes/navigation.php'); ?>
    <div id="main">
    	<div id="student-header-wrap">
        	<div id="student-header">
            	<div id="section-header"><h1 class="section-header-single">User Profile</h1>
<?php
            	
require_once "db.php";
session_start();

$student = array();

# getting ID from Database
        $X_identity = mysql_real_escape_string($identity);
        $X_firstName = mysql_real_escape_string($firstName);
        $X_lastName = mysql_real_escape_string($lastName);
        $X_userEmail = mysql_real_escape_string($userEmail);
        $sql = "SELECT student_id, username, firstname, lastname FROM student WHERE identity='$X_identity'";

# getting attributes of skill
$result = mysql_query($sql);
$student = mysql_fetch_assoc($result);
$firstname = $student['firstname'];
$lastname = $student['lastname'];
echo "<span>&nbsp;&nbsp;</span><h2> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>$firstname"." "."$lastname </h2>";
            	
?> 
            	</div>
            </div>
        </div>
        
        <div class="breadcrumbs-wrap">
        	<div class="breadcrumbs">
            	<h3 class="breadcrumbs"><a href="../index.php">Home</a> &ensp;<span>/</span>&ensp; Profile &ensp;<span>/</span>&ensp; <a href="account/coursehistory.php">Course History</a>&ensp;<span>/</span>&ensp; <a href="account/saved-items.php">Saved Items</a></h3>
            </div>
        </div>
        
        <div id="content-wrap">
        	<div id="content">
        <div id="hp-mission-wrap">
        	<div id="hp-mission">
            	<h1 class="hp-mission">My Account Information</h1>
                <p class="hp-mission">My information here.</p>
            </div>
        </div> <!-- end main -->           	
                </div> 
            </div>        
        </div> <!-- end content-wrap -->
        
        
   	
    </div> <!-- end main -->
</div> <!-- end container -->
    
        
<?php include('includes/footer.php'); ?>

</div>
</body>
</html>