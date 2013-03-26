<php?

$course = $_POST[‘number’]

$course_id = mysql_query(“Select * FROM courses WHERE course_number = “$course”)
$student_id = mysql_query(“Select * FROM student WHERE username = “user”)

mysql_query(“INSERT INTO students_courses (student_id, course_id) VALUES(‘$student_id’, ‘$course_id’)

?>
