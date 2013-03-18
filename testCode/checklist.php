<?php
function breadcrumbs($separator = ' &raquo; ', $home = 'Home') {

    $path = array_filter(explode('/', parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)));
    $base_url = substr($_SERVER['SERVER_PROTOCOL'], 0, strpos($_SERVER['SERVER_PROTOCOL'], '/')) . '://' . $_SERVER['HTTP_HOST'] . '/';
    $breadcrumbs = array("<a href=\"$base_url\">$home</a>");
    $tmp = array_keys($path);
    $last = end($tmp);
    unset($tmp);

    foreach ($path as $x => $crumb) {
        $title = ucwords(str_replace(array('.php', '_'), array('', ' '), $crumb));
	if ($x == 1){
	        $breadcrumbs[]  = "<a href=\"$base_url$crumb\">$title</a>";
	}elseif ($x > 1 && $x < $last){
		$tmp = "<a href=\"$base_url";
		for($i = 1; $i <= $x; $i++){
			$tmp .= $path[$i] . '/';
		}
                $tmp .= "\">$title</a>";
		$breadcrumbs[] = $tmp;
		unset($tmp);
        }else{
                $breadcrumbs[] = "$title";
	}
    }

    return implode($separator, $breadcrumbs);
}	
echo breadcrumbs();

?>

<!DOCTYPE html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
</head>

<html>
<body>

<div>
  <h1>Which of these things do you have? <br>Select all that apply. </h1>  
  <form action="form_action.php">
    <input id="bike" type="checkbox" name="vehicle" value="Bike"><label for="bike">I have a bike</label><br>
    <input id="car" type="checkbox" name="vehicle" value="Car"><label for="car">I have a car</label><br>
    <input id="rollerblades" type="checkbox" name="vehicle" value="Rollerblades"><label for="rollerblades">I have rollerblades</label><br>
    <input id="donut" type="checkbox" name="food" value="Donut"><label for="donut">I have a donut</label><br>
    <input type="submit" class="button" value="Next &raquo;">
  </form>
  
</div>
  
 </body>
</html>