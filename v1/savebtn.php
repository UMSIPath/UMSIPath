<?php
require_once "db.php";
session_start();

if($_POST['type'] == 'course') {
	$tablename = "students_courses";
	$columnheader = "course_id";
}
if($_POST['type'] == 'skill') {
    $tablename = "students_skills";
    $columnheader = "skill_id";
}
if($_POST['type'] == 'career') {
    $tablename = "students_careers";
    $columnheader = "career_id";
}



$oid = $_POST['oid'];
$user = $_POST['user'];

$sql = "INSERT INTO $tablename ($columnheader, student_id) VALUES ('$oid', '$user')";
mysql_query($sql) or die('sorry.');

echo 'success';

?>