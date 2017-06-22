<?php
// Connect to the cluster and keyspace "killrvideo"
$cluster  = Cassandra::cluster()
                ->build();
$keyspace  = 'msata';
$session  = $cluster->connect($keyspace);

//$insert    = $session->prepare(
//              "INSERT INTO users (userid, email, firstname,created_date) VALUES (?,?,?,?)"
//             );
//
////$email = $_POST["email"];
////  $firstname = $_POST["firstname"];
//$insert->bind_param( 'ssss',uuid(),$_POST["email"], $_POST["firstname"], '2013-01-01 00:00:00' );
//
//
//    
//$session->execute($insert);
//



    $email = $_POST["email"];
  $firstname = $_POST["firstname"];
$statement = $session->execute(new Cassandra\SimpleStatement(
    "INSERT INTO users (userid, email, firstname,created_date) 
      VALUES (uuid(), 
      '$email','$firstname','2013-01-01 00:00:00')"
  ));


?>