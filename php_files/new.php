<?php
// Connecteur PDO_CASSANDRA
$db = new PDO('cassandra:host=127.0.0.1;port=9160');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

// Création de l'espace de travail
$db->exec ("CREATE KEYSPACE mytest with strategy_class = 'SimpleStrategy' and strategy_options:replication_factor=1;");

// Utilisation
$db->exec ("USE mytest");

//création de la column family
$db->exec ("CREATE COLUMNFAMILY users (uid varchar PRIMARY KEY, name varchar, last_name varchar);");

//insertions
$request = $db->prepare ("INSERT INTO users (uid, name, last_name) VALUES (:id, :name, :last_name);");
$request->execute (array (':id' =>'xbgf12kj', ':name' => 'stéphane', ':last_name' => 'raymond'));

$request = $db->prepare ("INSERT INTO users (uid, name, last_name) VALUES (:id, :name, :last_name);");
$request->execute (array (':id' =>'hjsbv56s', ':name' => 'fabien', ':last_name' => 'callard'));

$request = $db->prepare ("INSERT INTO users (uid, name, last_name) VALUES (:id, :name, :last_name);");
$request->execute (array (':id' =>'nbx45Aqd', ':name' => 'toto'.$t, ':last_name' => 'au bistro'));

//requete de sélection
$request = $db->prepare ("SELECT * FROM users");
$request->execute ();
var_dump ($request->fetchAll());
?>