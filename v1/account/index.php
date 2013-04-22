<?php
    require_once "../db.php";
session_start();
?>
    
<?php include('..includes/head.php'); ?>
    <title>UMSI / Discover</title>
    </head>

<body>

<div id="container">
    <?php include('includes/navigation.php'); ?>

    <div id="main">
    	<div id="hp-intro-wrap">
        	<div id="hp-intro"> 
            	<h1 class="hp-intro">UMSI / Discover is your entry point to success as an information professional.<br>
There are many entry points &mdash; that's the great part about discovery.<br>
Begin by browsing skills or careers to find the course plan best suited to your goals.<br>
Or, have a look at our UMSI alumni career paths.
Choice is yours to discover.</h1>
				<h2 class="hp-intro"><a href="#hp-widget-wrap">Get Started</a></h2>
                <a href="#hp-widget-wrap"><img src="static/images/down-arrow.png" /></a>
            </div>
        </div>
        
        <div id="hp-widget-wrap">
        	<div class="hp-widget">
                <a href="skills/search.php"><img src="static/images/hp-widget-skills-icon.png" alt="skills icon"/></a>
            	<h2><a href="skills/search.php">Discover by skills</a></h2>
                <p>You tell us what skills you want <br>to rock, we show you what courses<br> teach those skills.</p>
            </div>
            
            <div class="hp-widget">
                <a href="careers/search.php"><img src="static/images/hp-widget-careers-icon.png" alt="careers icon"/></a>
            	<h2><a href="careers/search.php">Discover by careers</a></h2>
                <p>Got a perfect job in mind?<br>Or several? We'll show you how<br>to get there.</p>
            </div>
            
            <div class="hp-widget">
            	<a href="#"><img src="static/images/hp-widget-alumni-icon.png" alt="alumni icon"/></a>
            	<h2><a href="#">Find someone like me</a></h2>
                <p>Not sure where to start? We'll find an<br> alumni similar to your background so<br> you can check them out.</p>
            </div>
        </div>
        
        <div id="hp-mission-wrap">
        	<div id="hp-mission">
            	<h1 class="hp-mission">The UMSI Path Group, masters students from the University of Michigan's School of Information, curates UMSI / Discover.</h1>
                <p class="hp-mission">Our goal is to help students in the School of Information move beyond the boundaries of course plans and requirements. As students ourselves, we understand the significance of knowing whether we are choosing to take the right courses, at the right time, and for the right reasons. We decided to create a tool that would help us, and you, do just that.</p>
            </div>
        </div> <!-- end main -->
    
    </div> <!-- end container -->
    
        
<?php include('includes/footer.php'); ?>

</div>
</body>
</html>