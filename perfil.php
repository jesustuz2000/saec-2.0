<?php
session_start();
if (!isset($_SESSION["id_alumno"]) || $_SESSION["id_alumno"] == null) {
    print "<script>window.location='index.php';</script>";
}
$idcarr = $_SESSION["id_adminCarrera"];

//Comprobamos si esta definida la sesión 'tiempo'.
if (isset($_SESSION['tiempo'])) {
    $inactivo = 900; //15min en este caso.
    $vida_session = time() - $_SESSION['tiempo'];
    if ($vida_session > $inactivo) {
        session_unset();
        session_destroy();
        header("Location: login.php?carrera=$idcarr");
        exit();
    } else {  // si no ha caducado la sesion, actualizamos
        $_SESSION['tiempo'] = time();
    }
} else {
    $_SESSION['tiempo'] = time();
}
include("SAC/Conexion.php");
// INFORMACION DEL ALUMNO
if (isset($_SESSION["id_alumno"])) {
    $consultaAlumno = $DB_con->prepare('SELECT users.*, alumnos.* FROM alumnos INNER JOIN users ON alumnos.id_user = users.id_user WHERE alumnos.id_user =:id_user');
    $consultaAlumno->execute(array(':id_user' => $_SESSION["id_alumno"]));
    $rowAlumnos = $consultaAlumno->fetch(PDO::FETCH_ASSOC);
    extract($rowAlumnos);

    $consultaAlumno = $DB_con->prepare('SELECT admin_carreras.*, logos.* FROM admin_carreras INNER JOIN logos ON admin_carreras.id_imagen = logos.id_imagen');
    $consultaAlumno->execute(array(':id_user' => $_SESSION["id_alumno"]));
    $datosLogo = $consultaAlumno->fetch(PDO::FETCH_ASSOC);
    extract($datosLogo);

}

if (isset($_POST['datos'])) {
    $_POST['nombres'];
    $_POST['apellidos'];
    $_POST['matricula'];
    $_POST['semestre_grupo'];

    $DB_con->beginTransaction();

    try {
        $sentencia = $DB_con->prepare("UPDATE alumnos SET nombre_alumno = ?, apellido_alumno = ?, matricula = ?, semestre_grupo = ? WHERE id_user = ?;");
        $resultado = $sentencia->execute([$_POST['nombres'], $_POST['apellidos'], $_POST['matricula'], $_POST['semestre_grupo'],  $_SESSION["id_alumno"]]);

        $DB_con->commit();
        // echo 'Datos insertados';
        header("Location: perfil");
    } catch (PDOException $e) {
        // si ocurre un error hacemos rollback para anular todos los insert
        $DB_con->rollback();
        $e->getMessage();;
        $errMSG = 'Error';
    }
}

if (isset($_POST['usuario'])) {
    $_POST['correo'];

    $DB_con->beginTransaction();

    try {
        $sentencia = $DB_con->prepare("UPDATE users SET correo_user = ? WHERE id_user = ?;");
        $resultado = $sentencia->execute([$_POST['correo'], $_SESSION["id_alumno"]]);

        $DB_con->commit();
        // echo 'Datos insertados';
        header("Location: perfil");
    } catch (PDOException $e) {
        // si ocurre un error hacemos rollback para anular todos los insert
        $DB_con->rollback();
        $e->getMessage();;
        $errMSG = 'Error';
    }
}

if (isset($_POST['contra'])) {
    $_POST['pass1'];
    $_POST['pass2'];
    $nombre = htmlentities(addslashes($_POST['nombre']));
    $clave = htmlentities(addslashes($_POST['pass-old']));

    if ($_POST['pass1'] == $_POST['pass2']) {
        // ecriptamos la contraseña
        $password = password_hash($_POST['pass2'], PASSWORD_DEFAULT, array("cost" => 15));

        $sql = "SELECT * FROM users WHERE correo_user = :nombre";
        $resultado = $DB_con->prepare($sql);
        $resultado->execute(array(":nombre" => $nombre));

        // Verificamos el Password
        while ($registro = $resultado->fetch(PDO::FETCH_ASSOC)) {

            if (password_verify($clave, $registro['password'])) {
                $id_user = $registro['id_user'];

                $DB_con->beginTransaction();

                try {
                    $sentencia = $DB_con->prepare("UPDATE users SET password = ? WHERE id_user = ?;");
                    $resultado = $sentencia->execute([$password, $_SESSION["id_alumno"]]);

                    $DB_con->commit();
                    // echo 'Datos insertados';
                    header("Location: perfil");
                    print "<script>alert('Contraseña Actulizada');</script>";
                } catch (PDOException $e) {
                    // si ocurre un error hacemos rollback para anular todos los insert
                    $DB_con->rollback();
                    $e->getMessage();;
                    $errMSG = 'Error';
                }
            } else {
                print "<script>alert('Su contraseña NO coincide');</script>";
                $errMSG = 'Error';
            }
        }
    } else {
        print "<script>alert('¡Error! las contraseñas NO coinciden');</script>";
        $errMSG = 'Error';
    }
}


?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Administracion de Congresos</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-theme6.css">

    <!-- Bootstrap -->
    <link rel='stylesheet' href='vendor/jquery-ui/jquery-ui.min.css'>
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/line-awesome/css/line-awesome.min.css">
    <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="fonts/font-awesome-5/css/fontawesome-all.min.css">

    <!-- Revolution slider -->
    <link rel="stylesheet" href="vendor/revolution/settings.css">
    <link rel="stylesheet" href="vendor/revolution/layers.css">
    <link rel="stylesheet" href="vendor/revolution/navigation.css">
    <link rel="stylesheet" href="vendor/revolution/settings-source.css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="vendor/css-hamburgers/dist/hamburgers.min.css">
    <link rel="stylesheet" href="vendor/slick/slick-theme.css">
    <link rel="stylesheet" href="vendor/slick/slick.css">
    <link rel="stylesheet" href="vendor/fancybox/dist/jquery.fancybox.min.css">
    <link rel='stylesheet' href='vendor/fullcalendar/fullcalendar.css'>
    <link rel='stylesheet' href='vendor/animate/animate.css'>

    <!-- Main CSS File -->
    <link href="css/style.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.png">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style>
        #btn-acceso {
            position: right;
        }

        #alerta{
            color: white;
        }
    </style>

<script>
        $(document).ready(function() {
            //variables
            var pass1 = $('[name=pass1]');
            var pass2 = $('[name=pass2]');
            var confirmacion = "Las contraseñas coinciden";
            var longitud = "La contraseña debe estar formada entre 8-16 carácteres (ambos inclusive)";
            var negacion = "No coinciden las contraseñas";
            var vacio = "La contraseña no puede estar vacía";
            //oculto por defecto el elemento span
            var span = $('<span id="alerta"></span>').insertAfter(pass2);
            span.hide();
            //función que comprueba las dos contraseñas
            function coincidePassword() {
                var valor1 = pass1.val();
                var valor2 = pass2.val();
                //muestro el span
                span.show().removeClass();
                //condiciones dentro de la función
                if (valor1 != valor2) {
                    span.text(negacion).addClass('negacion');
                }
                if (valor1.length == 0 || valor1 == "") {
                    span.text(vacio).addClass('negacion');
                }
                if (valor1.length < 6 || valor1.length > 10) {
                    span.text(longitud).addClass('negacion');
                }
                if (valor1.length != 0 && valor1 == valor2) {
                    span.text(confirmacion).removeClass("negacion").addClass('confirmacion');
                }
            }
            //ejecuto la función al soltar la tecla
            pass2.keyup(function() {
                coincidePassword();
            });
        });
    </script>

    <script type="text/javascript">
        function mostrarPassword() {
            var cambio = document.getElementById("txtPassword");
            if (cambio.type == "password") {
                cambio.type = "text";
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            } else {
                cambio.type = "password";
                $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
            }

        }

        $(document).ready(function() {
            //CheckBox mostrar contraseña
            $('#ShowPassword').click(function() {
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>

</head>




<body>
    <!-- <div class="images-preloader">
        <div id="preloader_1 spinner1" class="spinner1 rectangle-bounce">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div> -->
    <?php
    include "header.php";
    ?>

    <div class="form-body">

        <div class="row">
            <div class="img-holder">
                <div class="bg"></div>
                <div class="info-holder">
                    <img src="images/logos/<?php echo $datosLogo['imagen']; ?>" alt="Logo">
                </div>
            </div>
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3 class="text-center">Perfil</h3>
                        <br>
                        <p class="">Datos Públicos</p>
                        <form role="form" name="datos" method="post">
                            <input class="form-control" type="text" name="nombres" value="<?php echo $rowAlumnos['nombre_alumno']; ?>" pattern="[A-Za-z\s]+" maxlength="40" required>
                            <input class="form-control" type="text" name="apellidos" value="<?php echo $rowAlumnos['apellido_alumno']; ?>" pattern="[A-Za-z\s]+" maxlength="40" required>
                            <input class="form-control" type="text" name="matrícula" value="<?php echo $rowAlumnos['matricula']; ?>" pattern="[0-9]+" maxlengbackgroundth="8" required>

                            <select name="semestre_grupo" class="form-control">
                                <?php
                                $semestre_grupo = $DB_con->prepare("SELECT * FROM semestre_grupo ORDER BY semestre_grupo ASC");
                                $semestre_grupo->execute();
                                while ($row = $semestre_grupo->fetch(PDO::FETCH_OBJ)) {
                                    if ($rowAlumnos['semestre_grupo'] == $row->semestre_grupo) {
                                        echo '<option selected>';
                                        echo $row->semestre_grupo;
                                        echo '</option>';
                                    } else {
                                        echo '<option>';
                                        echo $row->semestre_grupo;
                                        echo '</option>';
                                    }
                                } ?>
                            </select>

                            <div class="form-button">
                                <button id="submit" name="datos" type="submit" class="ibtn">Actualizar</button>
                            </div>
                        </form>
                        <hr style="background: #fff;">

                        <p class="">Cambiar Usuario</p>
                        <form role="form" method="post">
                        <input class="form-control" type="email" name="correo" value="<?php echo $rowAlumnos['correo_user']; ?>" <?php
                                                                                                                                    $correo = $DB_con->prepare("SELECT * FROM correos");
                                                                                                                                    $correo->execute();
                                                                                                                                    echo 'pattern="[a-z0-9|.]+(';
                                                                                                                                    while ($row2 = $correo->fetch(PDO::FETCH_OBJ)) {
                                                                                                                                        echo $row2->correo;
                                                                                                                                        echo '|';
                                                                                                                                    }
                                                                                                                                    echo ')"'; ?> maxlength="70" required>
                            <div class="form-button">
                                <button id="submit" name="usuario" type="submit" class="ibtn">Actulizar</button>
                            </div>
                        </form>
                        <hr style="background: #fff;">


                        <p class="">Cambiar Contraseña</p>
                        <form role="form" name="login" method="post">
                            <div class="input-group">
                            <input type="hidden" name="nombre" value="<?php echo $rowAlumnos['correo_user']; ?>" required>
                                <input ID="txtPassword" type="Password" Class="form-control" name="pass-old" placeholder="Contraseña" maxlength="" required>
                                <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()"> <span class="fa fa-eye-slash icon"></span> </button>
                            </div>
                            <br>
                            <input class="form-control" type="password" name="pass1" autofocus="autofocus" minlength="8" maxlength="16" pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$" placeholder="Nueva Contraseña" required>
                            <input type="password" class="form-control" name="pass2" minlength="8" maxlength="16" pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$" placeholder="Confirmar Contraseña" required>
                            <p> <small>Su nueva contraseña debe tener entre 8 y 16 caracteres, al menos un dígito y al menos una mayúscula.</small></p>

                            <div class="form-button">
                                <button id="submit" name="contra" type="submit" class="ibtn">Actualizar</button>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>


        </div>
    </div>


    <!-- JS -->
    <!-- Jquery and Boostrap library -->
    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="vendor/bootstrap/js/popper.min.js"></script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Other js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEmXgQ65zpsjsEAfNPP9mBAz-5zjnIZBw"></script>
    <script src="js/theme-map.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/masonry.pkgd.min.js"></script>
    <script src="js/imagesloaded.pkgd.js"></script>
    <script src="js/isotope-docs.min.js"></script>

    <!-- Vendor JS -->
    <script src="vendor/slick/slick.min.js"></script>
    <script src='vendor/jquery-ui/jquery-ui.min.js'></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <script src="vendor/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="vendor/sweetalert/sweetalert.min.js"></script>
    <script src="vendor/fancybox/dist/jquery.fancybox.min.js"></script>
    <script src='vendor/fullcalendar/lib/moment.min.js'></script>
    <script src='vendor/fullcalendar/fullcalendar.min.js'></script>
    <script src='vendor/wow/dist/wow.min.js'></script>

    <!-- REVOLUTION JS FILES -->
    <script src="vendor/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="vendor/revolution/js/jquery.themepunch.revolution.min.js"></script>

    <!-- Form JS -->
    <script src="js/validate-form.js"></script>
    <script src="js/config-contact.js"></script>

    <!-- Main JS -->
    <script src="js/main/main.js"></script>

    <script type='text/javascript'>
        document.oncontextmenu = function() {
            return false
        }
    </script>

</body>

</html>