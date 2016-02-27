<?php
 
$myHost = "localhost"; // use your real host name
$myUserName = "artspac9_ayni";   // use your real login user name
$myPassword = "190690henrylee";   // use your real login password
$myDataBaseName = "artspac9_wp_i2l6"; // use your real database name

$con = mysqli_connect( $myHost, $myUserName, $myPassword, $myDataBaseName);
 
if( !$con ) // == null if creation of connection object failed
{ 
    // report the error to the user, then exit program
    die("connection object not created: ".mysqli_error($con));
}

if( mysqli_connect_errno() )  // returns false if no error occurred
{ 
    // report the error to the user, then exit program
    die("Connect failed: ".mysqli_connect_errno()." : ". mysqli_connect_error());
}
 
// This SQL statement selects ALL from the table 'Locations'
$sql = "SELECT * FROM TrainerAnswers";
 
// Check if there are results
if ($result = mysqli_query($con, $sql))
{
	// If so, then create a results array and a temporary one
	// to hold the data
	$resultArray = array();
	$tempArray = array();
 
	// Loop through each row in the result set
	while($row = $result->fetch_object())
	{
		// Add each row into our results array
		$tempArray = $row;
	    array_push($resultArray, $tempArray);
	}
 
	// Finally, encode the array to JSON and output the results
	echo json_encode($resultArray);
}
 a
// Close connections
mysqli_close($con);
?>