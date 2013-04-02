<?php
    session_start();
    unset($_SESSION["account"]);
    if ( isset($_POST["account"]) && isset($_POST["pw"]) ) {
        if ( $_POST['pw'] == 'umsi' ) {
            $_SESSION["account"] = $_POST["account"];
            $_SESSION["success"] = "Logged in.";
            header( 'Location: index.php' ) ;
            return;
        } else {
            $_SESSION["error"] = "Incorrect password.";
            header( 'Location: login.php' ) ;
            return;
        }
    } else if ( count($_POST) > 0 ) {
        $_SESSION["error"] = "Missing Required Information";
        header( 'Location: login.php' ) ;
        return; 
    }      
?>

<html>
<head>
<?php include 'includes/head.php'; ?>
</head>

<body>
<?php include 'includes/navigation.php'; ?>

<div class="main">
<h1>Login</h1>
<p><?php include 'includes/breadcrumbs.php'; ?></p>
<p> Lorem Ipsum stuff... </p>
<h1>Please Log In</h1>
<?php
    if ( isset($_SESSION["error"]) ) {
        echo('<p style="color:red">Error:'.$_SESSION["error"]."</p>\n");
        unset($_SESSION["error"]);
    }
?>
<form method="post">
<p>Account: <input type="text" name="account" value=""></p>
<p>Password: <input type="text" name="pw" value=""></p>
<p><input type="submit" value="Log In"></p>
</form>


</div>
<?php include 'includes/footer.php'; ?>
</body>
</html>