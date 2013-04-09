<header>
    	<div id="header-wrap">
        	<div id="logo">
            	<a href="/umsipath/v1/index.php"><img src="/umsipath/v1/static/images/umsi-discover-logo.png" name="UMSI/Discover logo" alt="UMSI/Discover logo"/></a>
            </div>
        
                        
            <div id="metanav">
            	<ul class="metanav">
<?php if ( isset( $_SESSION["id"]) ) { ?>
<li><a href="/umsipath/v1/account/index.php">Howdy, <?php echo($_SESSION["first"]) ?> </a></li>
<?php } else { ?>
<li><a href="/umsipath/v1/login.php">Howdy, Stranger</a></li>
<? } ?>
                	
                	
<?php if ( isset( $_SESSION["id"]) ) { ?>
<li><a href="/umsipath/v1/logout.php">Logout</a></li>
<?php } else { ?>
<li><a href="/umsipath/v1/login.php">Login</a></li>
<? } ?>
                    
                    
                </ul>
            </div>
            
            <div id="search-bar">
            	<div id="search-box">
             
  					<form method="get" action="/search" id="search">
  					<input name="q" type="text" size="40" />
					</form>
				</div>
            </div>
            
            <nav>
            	<ul>
                	<li><a href="/umsipath/v1/index.php">Home</a></li>
                    <li><a href="#">Discover</a>
                    	<ul>
                        	<li><a href="/umsipath/v1/skills/search.php"><h1>Find Courses by Skills</h1><p>You choose skills, we find you courses</p></a></li>
							<li><a href="/umsipath/v1/careers/search.php"><h1>Find Courses by Careers</h1><p>You choose careers, we find you courses</p></a></li>
						</ul>
                    </li>
                    <li><a href="#">Browse</a>
                    	<ul>
                        	<li><a href="/umsipath/v1/courses/index.php"><h1>All Courses</h1></a></li>
                        	<li><a href="/umsipath/v1/skills/index.php"><h1>All Skills</h1></a></li>
                        	<li><a href="/umsipath/v1/careers/index.php"><h1>All Careers</h1></a></li>
                        </ul>
                    </li>
                    <li><a href="#">Links</a>
                    	<ul>
                        	<li><a href="http://www.si.umich.edu" name="UMSI Homepage" target="_blank"><h1>UMSI Homepage</h1></a></li>
                            <li><a href="http://www.si.umich.edu/careers/career-development-office" name="UMSI Career Development Office" target="_blank"><h1>UMSI Career Development Office</h1></a></li>
                            <li><a href="https://umsi-csm.symplicity.com/students/index.php?s=home" name="UMSI iTrack" target="_blank"><h1>UMSI iTrack</h1></a></li>
							<li><a href="https://intranet.si.umich.edu/node/56" name="Tracking and Planning Sheets" target="_blank"><h1>TAPS</h1></a></li>
                            <li><a href="https://wolverineaccess.umich.edu/render.userLayoutRootNode.uP" name="Wolverine Access" target="_blank"><h1>Wolverine Access</h1></a></li>
                    	</ul>
                    </li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
            </nav>
   
        </div>
    </header>