<?php
if (!isset($_SESSION["id_alumno"]) || $_SESSION["id_alumno"] == null) {
    print "<script>window.location='../index.php';</script>";
}

//Comprobamos si esta definida la sesión 'tiempo'.
if (isset($_SESSION['tiempo'])) {
    $inactivo = 900; //15min en este caso.
    $vida_session = time() - $_SESSION['tiempo'];
    if ($vida_session > $inactivo) {
        session_unset();
        session_destroy();
        header("Location: ../login.php?carrera=$idcarr");
        exit();
    } else {  // si no ha caducado la sesion, actualizamos
        $_SESSION['tiempo'] = time();
    }
} else {
    $_SESSION['tiempo'] = time();
}
include("../SAC/Conexion.php");
//INFORMACION DEL ALUMNO 
$datosAlumnos = $DB_con->prepare("SELECT * FROM alumnos WHERE id_user=$_SESSION[id_alumno]");
$datosAlumnos->execute();
while ($row = $datosAlumnos->fetch(PDO::FETCH_OBJ)) {
    $nomAlumno = $row->nombre_alumno;
    $nomAlumno .= ' ';
    $nomAlumno .= $row->apellido_alumno;

    $id_taller = $row->id_taller;
    $id_concurso = $row->id_concurso;
    $id_equipo = $row->id_equipo;
    $id_alumno = $row->id_alumno;

    $_SESSION["id_adminCarrera"] = $row->id_adminCarrera;
    $id_adminCarrera = $_SESSION["id_adminCarrera"];
    $status = $row->status_alumno;
}
// NOMBRE DE LA CARRERA 
$carreraIns = $DB_con->prepare('SELECT * FROM admin_carreras WHERE id_adminCarrera =:id_adminCarrera');
$carreraIns->execute(array(':id_adminCarrera' => $id_adminCarrera));
$carreraAlumno = $carreraIns->fetch(PDO::FETCH_ASSOC);
extract($carreraAlumno);

$carrera = $carreraAlumno['carrera'];
$_SESSION['imgLogo'] = $carreraAlumno['id_imagen'];
$estado_conferencia = 0;

// Informacion del taller del alumno
if (isset($id_taller)) {
    $infoTaller = $DB_con->prepare('SELECT * FROM talleres WHERE id_taller =:id_taller');
    $infoTaller->execute(array(':id_taller' => $id_taller));
    $rowTaller = $infoTaller->fetch(PDO::FETCH_ASSOC);
    extract($rowTaller);
}

// Informacion del Concurso del alumno
if (isset($id_concurso)) {
    $infoConcurso = $DB_con->prepare('SELECT * FROM concursos WHERE id_concurso =:id_concurso');
    $infoConcurso->execute(array(':id_concurso' => $id_concurso));
    $rowConcurso = $infoConcurso->fetch(PDO::FETCH_ASSOC);
    extract($rowConcurso);
}

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sistema de Administración de Congresos</title>

    <!-- Bootstrap -->
    <link rel='../stylesheet' href='vendor/jquery-ui/jquery-ui.min.css'>
    <link rel="../stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">

    <!-- Font Icon -->
    <link rel="../stylesheet" href="fonts/line-awesome/css/line-awesome.min.css">
    <link rel="../stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
    <link rel="../stylesheet" href="fonts/font-awesome-5/css/fontawesome-all.min.css">

    <!-- Revolution slider -->
    <link rel="../stylesheet" href="vendor/revolution/settings.css">
    <link rel="../stylesheet" href="vendor/revolution/layers.css">
    <link rel="../stylesheet" href="vendor/revolution/navigation.css">
    <link rel="../stylesheet" href="vendor/revolution/settings-source.css">

    <!-- Vendor CSS -->
    <link rel="../stylesheet" href="vendor/css-hamburgers/dist/hamburgers.min.css">
    <link rel="../stylesheet" href="vendor/slick/slick-theme.css">
    <link rel="../stylesheet" href="vendor/slick/slick.css">
    <link rel="../stylesheet" href="vendor/fancybox/dist/jquery.fancybox.min.css">
    <link rel='../stylesheet' href='vendor/fullcalendar/fullcalendar.css' />
    <link rel='../stylesheet' href='vendor/animate/animate.css' />

    <!-- Main CSS File -->
    <link href="../css/style.min.css" rel="stylesheet">
    <link rel="../shortcut icon" href="favicon.png">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</head>

<body>
    <!-- page load-->
    <!-- <div class="images-preloader">
        <div id="preloader_1 spinner1" class="spinner1 rectangle-bounce">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div> -->
    <?php
$idcarr = $_SESSION["id_adminCarrera"];

// RECONOCER LOGO
$logoAlumno = $DB_con->prepare('SELECT * FROM logos WHERE id_imagen =:id_imagen');
$logoAlumno->execute(array(':id_imagen' => $_SESSION['imgLogo']));
$logoA = $logoAlumno->fetch(PDO::FETCH_ASSOC);
extract($logoA);
$img = $logoA['imagen'];

// Contador del taller (Para activar la opcion de talleres en el menu)
$contTaller = $DB_con->prepare('SELECT instructores.*, talleres.*, COUNT(*) AS contTaller FROM talleres INNER JOIN instructores ON talleres.id_instructor = instructores.id_instructor WHERE status_instructor = 1 AND id_adminCarrera = :id_adminCarrera');
$contTaller->execute(array(':id_adminCarrera' => $_SESSION["id_adminCarrera"]));
$contT = $contTaller->fetch(PDO::FETCH_ASSOC);
extract($contT);

// Contador del concurso (Para activar la opcion de concurso en el menu)
$consultaConcur = $DB_con->prepare('SELECT instructores.*, concursos.*, COUNT(*) AS contConcurso FROM concursos INNER JOIN instructores ON concursos.id_instructor = instructores.id_instructor WHERE status_instructor = 1 AND id_adminCarrera = :id_adminCarrera');
$consultaConcur->execute(array(':id_adminCarrera' => $_SESSION["id_adminCarrera"]));
$contC = $consultaConcur->fetch(PDO::FETCH_ASSOC);
extract($contC);

// Contador de las conferencias (Para activar la opcion de conferencia en el menu)
$consultaConferencias2 = $DB_con->prepare('SELECT instructores.*, conferencias.*, COUNT(*) AS contConferencias FROM conferencias INNER JOIN instructores ON conferencias.id_instructor = instructores.id_instructor WHERE status_instructor = 1 AND id_adminCarrera = :id_adminCarrera');
$consultaConferencias2->execute(array(':id_adminCarrera' => $_SESSION["id_adminCarrera"]));
$contConf = $consultaConferencias2->fetch(PDO::FETCH_ASSOC);
extract($contConf);

// CONTADORES
$contT['contTaller'];
$contC['contConcurso'];
$contConf['contConferencias'];
?>

<!-- MENU DE NAVEGACION-->
<header class="header">
    <div class="header-bottom hidden-tablet-landscape" id="js-navbar-fixed">
        <div class="container">
            <div class="header-bottom">
                <div class="header-bottom-content display-flex">
                    <div class="logo" style="width:70px;height:70px;position:relative;">
                        <a href="../inicio.php">
                            <img src="../images/logos/<?php echo $img; ?>" alt="" style="width:90%;height:90%;position:absolute;" />
                        </a>
                    </div>
                    <div class="menu-search display-flex">
                        <nav class="menu">
                            <div>
                                <ul class="menu-primary">
                                    <li class="menu-item curent-menu-item">
                                        <a href="../inicio">Inicio</a>
                                    </li>
                                    <?php
                                    if ($contT['contTaller'] != 0) {
                                        echo '<li class="menu-item curent-menu-item">
                                            <a href="../talleres">Talleres</a>
                                        </li>';
                                    }
                                    if ($contC['contConcurso'] != 0) {
                                        echo '<li class="menu-item curent-menu-item">
                                        <a href="../concursos">Concursos</a>
                                    </li>';
                                    }
                                    if ($contConf['contConferencias'] != 0) {
                                        echo '<li class="menu-item curent-menu-item">
                                        <a href="../conferencias">Conferencias</a>
                                    </li>';
                                    }
                                    ?>
                                    <li class="menu-item curent-menu-item">
                                        <a href="../avisos">Avisos</a>
                                    </li>
                                    <li class="menu-item curent-menu-item">
                                        <a href="../perfil">Perfil</a>
                                    </li>
                                    <li class="menu-item curent-menu-item">
                                        <a href="../logout">Cerrar</a>
                                    </li>

                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="hidden-tablet-landscape-up header-mobile">
        <div class="header-top-mobile">
            <div class="container-fluid">
                <div class="logo" style="width:60px;height:60px;position:relative;">
                    <a href="../inicio.php">


                        <img src="../images/logos/<?php echo $img; ?>" style="width:100%;height:100%;position:absolute;" />

                    </a>
                </div>
                <button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </div>
        </div>

        <div class="au-nav-mobile">
            <nav class="menu-mobile">
                <div>
                    <ul class="au-navbar-menu">
                        <li class="menu-item curent-menu-item">
                            <a href="../inicio.php">Inicio</a>
                        </li>
                        <?php
                        if ($contT['contTaller'] != 0) {
                            echo '<li class="menu-item">
                                        <a href="../talleres.php">Talleres</a>
                                    </li>';
                        }
                        if ($contC['contConcurso'] != 0) {
                            echo '<li class="menu-item">
                                        <a href="../concursos.php">Concursos</a>
                                    </li>';
                        }
                        if ($contConf['contConferencias'] != 0) {
                            echo '<li class="menu-item">
                            <a href="../conferencias.php">Conferencias</a>
                        </li>';
                        }
                        ?>
                        <li class="menu-item">
                            <a href="../perfil.php">Perfil</a>
                        </li>
                        <li class="menu-item">
                            <a href="../logout.php">Salir</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="clear"></div>
    </div>
</header>


    <br><br>



    <div class="container">