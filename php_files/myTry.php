<?php
use Cassandra;

// Connect to the cluster and keyspace "killrvideo"
$cluster  = Cassandra::cluster()
                ->build();
$keyspace  = 'killrvideo2';
$session  = $cluster->connect($keyspace);
?>