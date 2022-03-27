<?php

echo "Started!\n";

// Database configuration
$dbHost     = 'localhost';
$dbUsername = 'cocktail';
$dbPassword = 'AaNT_785#';
$dbName     = 'cocktail';

// Create database connection
$db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

if($db) {
  echo "Connected!\n";
}
// Check connection
if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}

//Open the cvs file
$csvFile = fopen("cocktails_db3.csv", "r") or die("Unable to open file!");

if($csvFile){
  echo "Opened csv!\n";
}

// Skip the first line
fgetcsv($csvFile);

// Parse data from CSV file line by line
while(($line = fgetcsv($csvFile, 5000, "\t")) !== FALSE){
  // Get row data
  $COCKTAIL = $line[0];
  $ALCOHOL  = $line[1];
  $FLAVORS  = $line[2];
  $SB       = $line[3];
  $TOPPING  = $line[4];
  $RECIPE   = $line[5];
  $IMAGE    = $line[6];

  echo "$COCKTAIL, \n$FLAVORS, \n$ALCOHOL, \n$SB, \n$TOPPING, \n$RECIPE, \n$IMAGE\n";

  // Insert member data in the database
  $db->query("INSERT IGNORE INTO Cocktails (Cocktail_Name, Recipe, Image_URL) VALUES ('".$COCKTAIL."', '".$RECIPE."','".$IMAGE."');") or die ($db->error);
  $idCocktails = $db->insert_id; //remember the id of the last imported cocktail
  print("$idCocktails\n");

  //INSERT IGNORE will skip inserting a cocktail record if that coctail has been
  //previously uploaded in the database, so $idCocktails will, in that case, be Null.
  //With command continue we will just skip inserting part for that cocktail.

  if (!$idCocktails){
    continue;
  }

  //We can have more than one value for alcohol, flavors, side bases and toppings
  //for each cocktail which will be separated by the coma in the csv file. So, we
  //are going to separate them with command explode.

  $alcohols  = explode(',',$ALCOHOL);
  $flavors  = explode(',',$FLAVORS);
  $sbs      = explode(',',$SB);
  $toppings  = explode(',',$TOPPING);

  //iterate through the lists of items devided by command explode and insert them in tables
  // Alcohol table
  for ($c=0; $c<count($alcohols); $c++){
    $alcohol =$db->escape_string(trim($alcohols[$c])); //trim possible spaces and remove special characters
    $db->query("INSERT IGNORE INTO Type_of_Alcohol (Alcohol_Type) VALUES ('".$alcohol."');") or die ("Error".$db->error);
    $idAlcohol = $db->insert_id;

    if ($idAlcohol){
      $db->query("INSERT INTO Cocktails_has_Type_of_Alcohol (idCocktails, idAlcohol) VALUES ('".$idCocktails."', '".$idAlcohol."');") or die ("Error".$db->error);
    }
    else{
      $idAlc = $db->query("SELECT idAlcohol FROM Type_of_Alcohol WHERE Alcohol_Type = '".$alcohol."';") and print ("Found!");
      $row = $idAlc->fetch_assoc(); //Fetch the next row of a result set as an associative array
      $idAlcohol2 = $row['idAlcohol'];
      echo "Id is: $idAlcohol2\n";
      $db->query("INSERT INTO Cocktails_has_Type_of_Alcohol (idCocktails, idAlcohol) VALUES ('".$idCocktails."', '".$idAlcohol2."');") or die ("Error".$db->error);
    }
  }

  //REPEAT THE SAME FOR OTHER THREE TABLES
  // Flavors table
  for ($c=0; $c<count($flavors); $c++){
    $flavor =$db->escape_string(trim($flavors[$c])); //trim possible spaces and remove special characters
    $db->query("INSERT IGNORE INTO Flavors (Flavor_Type) VALUES ('".$flavor."');") or die ("Error".$db->error);
    $idFlavors = $db->insert_id;

    //Connect idFlavors with idCocktail in relational table
    if ($idFlavors){
      $db->query("INSERT INTO Cocktails_has_Flavors (idCocktails, idFlavors) VALUES ('".$idCocktails."', '".$idFlavors."');") or die ("Error".$db->error);
    }
    else {
      $idFla = $db->query("SELECT idFlavors FROM Flavors WHERE Flavor_Type='".$flavor."';") or die ($db->error);
      $row = $idFla->fetch_assoc(); //Fetch the next row of a result set as an associative array meaning strings are stored a s keys, value is in this case numeric - idFlavors
      $idFlavors2 = $row['idFlavors'];
      $db->query("INSERT INTO Cocktails_has_Flavors (idCocktails, idFlavors) VALUES ('".$idCocktails."', '".$idFlavors2."');") or die ("Error".$db->error);
    }
  }

  // Side base table
  for ($c=0; $c<count($sbs); $c++){
    $sb =$db->escape_string(trim($sbs[$c])); //trim possible spaces and remove special characters
    $db->query("INSERT IGNORE INTO Side_Base (SB_Type) VALUES ('".$sb."');") or die ("Error".$db->error);
    $idSB = $db->insert_id;

    //Connect idFlavors with idCocktail in relational table
    if ($idSB){
      $db->query("INSERT INTO Cocktails_has_Side_Base (idCocktails, idSB) VALUES ('".$idCocktails."', '".$idSB."');") or die ("Error".$db->error);
    }
    else {
      $id_sb = $db->query("SELECT idSB FROM Side_Base WHERE SB_Type='".$sb."';") or die ("Error".$db->error);
      $row = $id_sb->fetch_assoc(); //Fetch the next row of a result set as an associative array
      $idSB2 = $row['idSB'];
      $db->query("INSERT INTO Cocktails_has_Side_Base (idCocktails, idSB) VALUES ('".$idCocktails."', '".$idSB2."');") or die ("Error".$db->error);
    }
  }

  // Topping table
  for ($c=0; $c<count($toppings); $c++){
    $topping =$db->escape_string(trim($toppings[$c])); //trim possible spaces and remove special characters
    $db->query("INSERT IGNORE INTO Toppings (Toppings_Type) VALUES ('".$topping."');") or die ("Error".$db->error);
    $idToppings = $db->insert_id;

    //Connect idFlavors with idCocktail in relational table
    if ($idToppings){
      $db->query("INSERT INTO Cocktails_has_Toppings (idCocktails, idToppings) VALUES ('".$idCocktails."', '".$idToppings."');") or die ("Error".$db->error);
    }
    else {
      $idTop = $db->query("SELECT idToppings FROM Toppings WHERE Toppings_Type ='".$topping."';") or die ("Error".$db->error);
      $row = $idTop->fetch_assoc(); //??Fetch the next row of a result set as an associative array
      $idToppings2 = $row['idToppings'];
      $db->query("INSERT INTO Cocktails_has_Toppings (idCocktails, idToppings) VALUES ('".$idCocktails."', '".$idToppings2."');") or die ("Error".$db->error);
    }
  }
}


// Close opened CSV file
fclose($csvFile);

?>
