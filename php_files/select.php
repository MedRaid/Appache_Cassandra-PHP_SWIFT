<?php


$cluster  = Cassandra::cluster()
                ->build();
$keyspace  = 'msata';
$session  = $cluster->connect($keyspace);

$result = $session->execute(new Cassandra\SimpleStatement
          ("SELECT * FROM msata.users 
            "));

//foreach ($result as $row)
//{
//  
//    printf("user: \"%s\" \"%s\" email: \"%s\" \n", $row['firstname'], $row['lastname'],$row['email']);
//    array_push($mynewArray,array("firstname \%s"=>$row['firstname'],"lastname \%s"=>$row['lastname'],"email \%s"=>$row['email']));   
//}
//
//echo json_encode($mynewArray);
//


$mynewArray=array();
foreach( $result as $row ){
    $mynewArray[]=array(
        'userid'=>$row['userid'],
        'firstname'=>$row['firstname'],
        'lastname'=>$row['lastname'],
        'email'=>$row['email'],
    );
}
echo json_encode($mynewArray);





?>