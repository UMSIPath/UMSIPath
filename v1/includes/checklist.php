<div>
  <h1>Which of these things do you have? <br>Select all that apply. </h1>  
  <form action="checklisttest.php">
    <input id="bike" type="checkbox" name="vehicle[]" value="Bike"><label for="bike">I have a bike</label><br>
    <input id="car" type="checkbox" name="vehicle[]" value="Car"><label for="car">I have a car</label><br>
    <input id="rollerblades" type="checkbox" name="vehicle[]" value="Rollerblades"><label for="rollerblades">I have rollerblades</label><br>
    <input id="donut" type="checkbox" name="food[]" value="Donut"><label for="donut">I have a donut</label><br>
    <input type="submit" class="button" value="Next &raquo;">
  </form>
  
</div>

<?php include("findme/findme.html"); ?>

