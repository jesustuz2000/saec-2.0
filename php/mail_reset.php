<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';

$mail = new PHPMailer(true);

try {
  //Server settings
  $mail->SMTPDebug = 0;                      //Enable verbose debug output
  $mail->isSMTP();                                            //Send using SMTP
  $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
  $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
  $mail->Username   = 'jesusreyestuzacosta@gmail.com';                     //SMTP username
  $mail->Password   = 'xydvqnyxajofcllv';                               //SMTP password

  //$mail->Username   = 'vanessaguadalupetuzacosta@gmail.com';                     //SMTP username
  //  $mail->Password   = 'axlnehdwkfjpuajg';            

  $mail->SMTPSecure = 'tls';            //Enable implicit TLS encryption
  $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

  //Recipients   en este aparatado el $email es del quien escribe la solicitud

  $mail->setFrom('jesusreyestuzacosta@gmail.com' . 'itsva');     //    jesusreyestuzacosta@gmail.com  Add a recipient
  $mail->addAddress($email . '');


  //Content

  $mail->isHTML(true);                                  //Set email format to HTML

  $mail->Subject = 'Solicitud de Cambio de Contraseña';
  $codigo = rand(1000, 9999);
  $mail->Body     = 'Estimad@ usuario
          <br/><br/>Recientemente se envió una solicitud para restablecer una contraseña para su cuenta. Si esto fue un error, simplemente ignore este correo electrónico y no pasará nada.

          
          <br/>Para restablecer su contraseña tenga en cuenta el siguiente codigo
          <h3>' . $codigo . '</h3>
          <p><a href="http://localhost/congreso-master/reset.php?email=' . $email . '&token=' . $token . '">
          para restablecer su contraseña da clic en el siguiente enlace </a></p>
          <br/><br/>Saludos';




  $mail->send();
  echo 'Message has been sent';
} catch (Exception $e) {
  echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}

//este el para el dubmodulo de restablecer y validarlo en ese documento para
$enviado = false;
if ($mail->send()) {
  $enviado = true;
}
