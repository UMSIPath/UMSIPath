<?php
    session_start();
    session_destroy();
    header("Location: index.php");


<html>
<head>
<?php include 'includes/header.php'; ?>
</head>

<body>
<div class="main">
<h1>Logout</h1>
<p><?php include 'includes/breadcrumbs.php'; ?></p>
<p> You are being logged out and redirected to Index.php</p>

</div>
<?php include 'includes/footer.php'; ?>
</body>
</html>