<?php


$cluster  = Cassandra::cluster()
                ->build();
$keyspace  = 'msata';
$session  = $cluster->connect($keyspace);
// Insert one record into the users table

// Update the same user with a new email address
$update = $session->execute(new Cassandra\SimpleStatement
          ("UPDATE users SET email = 'language_evangelist@example.com' 
            WHERE userid = 14c532ac-f5ae-479a-9d0a-36604732e01d"));