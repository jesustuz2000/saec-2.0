<?php
include('../SAC/Conexion.php');
$email=$_POST['email'];

$bytes= random_bytes(5);
$token= bin2hex($bytes);

include ('mail_reset.php');

if($enviado){
$DB_con1->query("insert into passwords(email, token, codigo)
values('$email','$token','$codigo')") or die ($DB_con1->error);
echo '<p>verifica tu correo para restablecer tu contraseña </p>';
}


?>