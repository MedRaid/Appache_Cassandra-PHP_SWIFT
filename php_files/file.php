
<?php

$cluster   = Cassandra::cluster()                 // connects to localhost by default
                 ->build();
$keyspace  = 'storksms';
$session   = $cluster->connect($keyspace);        // create session, optionally scoped to a keyspace
$max_id=0;
$session->execute(
    new Cassandra\SimpleStatement("CREATE TABLE IF NOT EXISTS storksms.server_node (
  server_node_id bigint,
  nbr_uid bigint,
  port int,
  nbr_clients int,
  status int,
  add_date timestamp,
  PRIMARY KEY (server_node_id,nbr_uid)
)
")
);
//no
$session->execute(new Cassandra\SimpleStatement("CREATE INDEX if NOT EXISTS ON server_node(status);"));
$session->execute(new Cassandra\SimpleStatement("CREATE INDEX if NOT EXISTS ON server_node(nbr_uid);"));



$statement = new Cassandra\SimpleStatement(       // also supports prepared and batch statements
    'SELECT * FROM server_node WHERE server_node_id=1 ORDER BY nbr_uid ASC ;'
);
$future    = $session->executeAsync($statement);  // fully asynchronous and easy parallel execution
$result    = $future->get();                      // wait for the result, with an optional timeout

foreach ($result as $row)                    // results and rows implement Iterator, Countable and ArrayAccess
    $max_id =$row['nbr_uid'];
	

$max_id1=$max_id+1;
echo $max_id1;
$session->execute(
new Cassandra\SimpleStatement("INSERT INTO server_node (server_node_id,nbr_uid, port, nbr_clients, status, add_date) VALUES
(1,".$max_id1.", 5555, 1, 1,  toTimestamp(now()));
")
);

// ------------------------------------------------------------------------------------------------------------------------------------------------------
$session->execute(
    new Cassandra\SimpleStatement("CREATE TABLE IF NOT EXISTS storksms.account (
  account_id bigint,
  nbr_uid bigint,
  type int,
  email varchar,
  serial_number varchar,
  session_id varchar,
  add_date timestamp,
  PRIMARY KEY (account_id,nbr_uid)
)
")
);

$session->execute(new Cassandra\SimpleStatement("CREATE INDEX if NOT EXISTS ON account(email);"));
$session->execute(new Cassandra\SimpleStatement("CREATE INDEX if NOT EXISTS ON account(serial_number);"));
$session->execute(new Cassandra\SimpleStatement("CREATE INDEX if NOT EXISTS ON account(type);"));

$session->execute(
new Cassandra\SimpleStatement("INSERT INTO account (account_id, nbr_uid, type, email, serial_number, session_id,add_date ) VALUES
(1,".$max_id1.", 3, 'chaabani.atef@gmail.com', 'HUFIZLWSZT7DG6R4', 'null', toTimestamp(now()));
")
);

?>