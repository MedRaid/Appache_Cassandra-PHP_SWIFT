<?php
use Cassandra;

$cluster  = Cassandra::cluster()
                ->build();
$keyspace  = 'killrvideo';
$session  = $cluster->connect($keyspace);
?>