<?php
session_start();
# Logging in with Google accounts requires setting special identity, so this example shows how to do it.
require 'lightopenid/openid.php';
require_once "config.php";
require_once "cookie.php";

$errormsg = false;
$success = false;

$doLogin = false;
$identity = false;
$firstName = false;
$lastName = false;
$userEmail = false;

if ( $CFG->OFFLINE ) {
    $identity = 'http://notgoogle.com/1234567';
    $firstName = 'Fake';
    $lastName = 'Person';
    $userEmail = 'fake_person@notgoogle.com';
    $doLogin = true;
    $_SESSION["keeplogin"] = "on";
} else {
    try {
        // $openid = new LightOpenID('online.dr-chuck.com');
        $openid = new LightOpenID($CFG->wwwroot);
        if(!$openid->mode) {
            if(isset($_GET['login'])) {
                if ( isset($_POST["keeplogin"]) && $_POST["keeplogin"] == "on") {
                    $_SESSION["keeplogin"] = "on";
                } else {
                    $_SESSION["keeplogin"] = "off";
                }
                $openid->identity = 'https://www.google.com/accounts/o8/id';
                $openid->required = array('contact/email', 'namePerson/first', 'namePerson/last');
                $openid->optional = array('namePerson/friendly');
                header('Location: ' . $openid->authUrl());
                return;
            }
        } else {
            if($openid->mode == 'cancel') {
                $errormsg = "You have canceled authentication. That's OK but we cannot log you in.  Sorry.";
                error_log('Google-Cancel');
            } else if ( ! $openid->validate() ) {
                $errormsg = 'You were not logged in by Google.  It may be due to a technical problem.';
                error_log('Google-Fail');
            } else {
                $identity = $openid->identity;
                $userAttributes = $openid->getAttributes();
                // echo("\n<pre>\n");print_r($userAttributes);echo("\n</pre>\n");
                $firstName = isset($userAttributes['namePerson/first']) ? $userAttributes['namePerson/first'] : false;
                $lastName = isset($userAttributes['namePerson/last']) ? $userAttributes['namePerson/last'] : false;
                $userEmail = isset($userAttributes['contact/email']) ? $userAttributes['contact/email'] : false;
                $doLogin = true;
            }
        }
    } catch(ErrorException $e) {
        $errormsg = $e->getMessage();
    }
}

if ( $doLogin ) {
    if ( $firstName === false || $lastName === false || $userEmail === false ) {
        error_log('Google-Missing:'.$identity.','.$firstName.','.$lastName.','.$userEmail);
        $_SESSION["error"] = "You do not have a first name, last name, and email in Google or you did not share it with us.";
        header('Location: index.php');
        return;
    } else {
        require_once("db.php");
        $X_identity = mysql_real_escape_string($identity);
        $X_firstName = mysql_real_escape_string($firstName);
        $X_lastName = mysql_real_escape_string($lastName);
        $X_userEmail = mysql_real_escape_string($userEmail);
        $sql = "SELECT student_id, username, firstname, lastname FROM student WHERE identity='$X_identity'";
        $result = mysql_query($sql);
        if ( $result === FALSE ) { error_log('Fail-SQL:'.$identity.','.$firstName.','.$lastName.','.$userEmail.','.mysql_error().','.$sql);
            $_SESSION["error"] = "Internal database error, sorry";
            header('Location: index.php');
            return;
        }
        $row = mysql_fetch_row($result);
        $theid = false;
        $didinsert = false;
        if ( $row !== FALSE ) { // Lets update!
            $theid = $row[0];
            if ( $row[1] != $userEmail || $row[2] != $firstName || $row[3] != $lastName ) {
                $sql = "UPDATE student SET username='$X_userEmail', firstname='$X_firstName', lastname='$X_lastName' WHERE student_id='$theid'";
            } else { 
                $sql = "UPDATE Users SET login_at=NOW() WHERE student_id='$theid'";
            }
             $result = mysql_query($sql);
            if ( $result === FALSE ) {
                error_log('Fail-SQL:'.$identity.','.$firstName.','.$lastName.','.$userEmail.','.mysql_error().','.$sql);
                $_SESSION["error"] = "Internal database error, sorry";
                header('Location: index.php');
                return;
            } else {
                error_log('User-Update:'.$identity.','.$firstName.','.$lastName.','.$userEmail);
            }
        } else { // Lets Insert!
            $sql = "INSERT INTO student (identity, username, firstname, lastname, login_at) ".          "VALUES ('$X_identity', '$X_userEmail', '$X_firstName', '$X_lastName', NOW() )";     
            $result = mysql_query($sql);
            if ( $result === FALSE ) {
                error_log('Fail-SQL:'.$identity.','.$firstName.','.$lastName.','.$userEmail.','.mysql_error().','.$sql);
                $_SESSION["error"] = "Internal database error, sorry";
                header('Location: index.php');
                return;
            } else {
                $theid = mysql_insert_id();
                error_log('User-Insert:'.$identity.','.$firstName.','.$lastName.','.$userEmail.','.$theid);
                $didinsert = true;
            }
        }

        $welcome = "Welcome ";
        if ( ! $didinsert ) $welcome .= "back ";
        $_SESSION["success"] = $welcome.htmlencode($firstName)." ".
                htmlencode($lastName)." (".htmlencode($userEmail).")";
        $_SESSION["id"] = $theid;
        $_SESSION["email"] = $userEmail;
        $_SESSION["first"] = $firstName;
        $_SESSION["last"] = $lastName;
        if ( isset($_SESSION["keeplogin"]) && $_SESSION["keeplogin"] == "on" ) {
            $guid = MD5($identity);
            $ct = create_secure_cookie($theid,$guid);
            setcookie($CFG->cookiename,$ct,time() + (86400 * 45)); // 86400 = 1 day
        }
        unset($_SESSION["keeplogin"]);
        if ( $didinsert ) {
            header('Location: profile.php');
        } else {
            header('Location: index.php');
        }
        return;
    }
}


?>

<?php include('includes/head.php'); ?>
    <title>UMSI / Discover</title>
    </head>

<body>

<div id="container">
    <?php include('includes/navigation.php'); ?>


<div id="main">

<?php
if ( $errormsg !== false ) {
    echo('<div style="margin-top: 10px;" class="alert alert-error">');
    echo($errormsg);
    echo("</div>\n");
}
if ( $success !== false ) {
    echo('<div style="margin-top: 10px;" class="alert alert-success">');
    echo($success);
    echo("</div>\n");
}
if ( $CFG->DEVELOPER ) {
    echo '<div class="alert alert-danger" style="margin-top: 10px;">'.
        'Note: Currently this server is running in developer mode.'.
        "\n</div>\n";
}
?>

        <div id="hp-mission-wrap">
        	<div id="hp-mission">
            	<h1 class="hp-mission">
We here at <?php echo($CFG->site_title); ?> use Google Accounts as our sole login.  
We do this because we want real people with real identities.  
</h1>
<p class="hp-mission">
<br>
<form action="?login" method="post">
    <input class="btn btn-warning" type="button" onclick="location.href='index.php'; return false;" value="Cancel"/>
    <button class="btn btn-primary">Login with Google</button>
    <?php if ( $CFG->cookiesecret !== false ) { ?>
    <input type="checkbox" name="keeplogin"> Keep me logged in
    <?php } ?>
</form>
<br>
</p>
<p class="hp-mission">
So you must have a Google account and we will require your
name and email address to login.  We do not need and do not receive your password - only Google
will ask you for your password.  When you press login below, you will be directed to the Google
authentication system where you will be given the option to share your information with <?php echo($CFG->site_title); ?>.
</p>

            </div>


 </div> <!-- end main -->
    
    </div> <!-- end container -->
    
        
<?php include('includes/footer.php'); ?>

</div>
</body>
</html>
