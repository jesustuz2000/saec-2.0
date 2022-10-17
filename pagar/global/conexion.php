<?php

$servidor ="mysql:dbname=".BD."; host =".SERVIDOR;
try {
    $pdo = new PDO ($servidor, USUARIO, PASS, 
    array(PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES utf8")
);
// echo '<script>alert("conectado...")</script>';
} catch (\Throwable $th) {
// echo '<script>alert("ERROR...")</script>';
}