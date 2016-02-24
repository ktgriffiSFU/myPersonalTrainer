<?php
$code = $_POST["string"];
var_dump(file_get_contents('php://input'), $_POST);

if(strlen ($string)==0){
    echo"empty";
}else{
    echo "The string is: ". string;  
}
?>