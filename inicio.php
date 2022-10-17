<?php
session_start();
if (!isset($_SESSION["id_alumno"]) || $_SESSION["id_alumno"] == null) {
    print "<script>window.location='index.php';</script>";
}

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
//INFORMACION DEL ALUMNO 
$datosAlumnos = $DB_con->prepare("SELECT * FROM alumnos WHERE id_user=:id_user");
$datosAlumnos->execute(array(':id_user' => $_SESSION["id_alumno"]));
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
    <title>Sistema de Administración de Eventos y Congresos</title>

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
    <link rel='stylesheet' href='vendor/fullcalendar/fullcalendar.css' />
    <link rel='stylesheet' href='vendor/animate/animate.css' />

    <!-- Main CSS File -->
    <link href="css/style.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.png">
</head>

<body>

    <!-- page load-->
    <div class="images-preloader">
        <div id="preloader_1 spinner1" class="spinner1 rectangle-bounce">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
    <?php include "header.php"; ?>

    <!-- <a href="pagar.php"><img src="https://www.paypalobjects.com/marketing/web/mx/logos-buttons/Paga-con_227x44.png" alt="Check out with PayPal" /></a> -->
    <main>
        <section class="featured section-padding-large">
            <div class="container">
                <div class="section-title section-title-center">
                    <h2>


                        <a href='#'><?php echo $nomAlumno; ?></a>
                        <br>
                        <p><?php echo $carrera; ?></p>
                        <?php
                        if ($status == 0) {
                            echo '<span class="price notfree" title="Realiza el pago correspondiente y espera que el encargado active tu cuenta">Cuenta Inactiva</span>';
                        }
                        ?>

                    </h2>
                </div>
                <div class="featured-content">
                    <div class="row">
                        <!-- TALLER -->
                        <?php if ($contadorTalleres != 0) { ?>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12">

                                <br>
                                <br>
                                <article class="item">
                                    <figure>
                                        <a href="talleres.php">

                                            <svg id="_x33_0" enable-background="new 0 0 64 64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" width="74px" height="74px">
                                                <g>
                                                    <circle cx="48" cy="24" r="1" />
                                                    <path d="m48 49c-1.654 0-3 1.346-3 3s1.346 3 3 3 3-1.346 3-3-1.346-3-3-3zm0 4c-.551 0-1-.449-1-1s.449-1 1-1 1 .449 1 1-.449 1-1 1z" />
                                                    <path d="m52.953 23.539c-.102-1.089-.544-2.072-1.232-2.846l4.279-4.279c.645-.645 1-1.502 1-2.414 0-.713-.223-1.389-.626-1.96l1.626-1.626c.378.378.88.586 1.414.586 1.978 0 3.586-1.608 3.586-3.586 0-.534-.208-1.036-.586-1.414l-4.414-4.414c-.378-.378-.88-.586-1.414-.586-1.978 0-3.586 1.608-3.586 3.586 0 .534.208 1.036.586 1.414l-1.63 1.63c-.893-.61-2.053-.742-3.071-.408-.345-1.276-1.501-2.222-2.885-2.222-1.654 0-3 1.346-3 3 0 1.238.754 2.302 1.826 2.76l-8.066 8.066c-.458-1.072-1.522-1.826-2.76-1.826-.023 0-.045.006-.068.007 2.322-1.998 3.068-5.05 3.068-7.007v-1h-1c-4.572 0-7.367 1.573-9 3.546v-2.546c0-3.343-2.317-9-11-9h-1v1c0 3.113 1.881 9 9 9h1v7 .546c-1.277-1.543-3.269-2.835-6.265-3.326.167-.374.265-.785.265-1.22 0-1.654-1.346-3-3-3s-3 1.346-3 3c0 1.319.861 2.429 2.046 2.83.307 3.222 2.424 8.17 8.954 8.17h1v6h-4c-1.103 0-2 .897-2 2v2c0 1.103.897 2 2 2v2h-6v-2c1.103 0 2-.897 2-2v-2c0-1.103-.897-2-2-2h-10c-1.103 0-2 .897-2 2v2c0 1.103.897 2 2 2v2h-1c-1.654 0-3 1.346-3 3v21h2v-21c0-.551.449-1 1-1h1v13c0 2.757 2.243 5 5 5s5-2.243 5-5v-13h6v13c0 2.757 2.243 5 5 5 .346 0 .684-.036 1.01-.103-.001.035-.01.068-.01.103v2c0 1.103.897 2 2 2h28c1.103 0 2-.897 2-2 0-.841-.264-1.62-.709-2.265l1.593-2.867c2.038-3.67 3.116-7.828 3.116-12.025 0-6.614-2.576-12.833-7.253-17.51zm-28.953-14.539c-5.318 0-6.596-4.01-6.903-5.964 5.18.351 7.407 3.193 7.828 5.964zm-19 24h10l.001 2h-10.001zm2 4h6v2h-6zm6 17c0 1.654-1.346 3-3 3s-3-1.346-3-3v-13h6zm35-27c-1.654 0-3-1.346-3-3s1.346-3 3-3 3 1.346 3 3-1.346 3-3 3zm8.586-24 4.414 4.414c0 .875-.711 1.586-1.586 1.586l-4.414-4.414c0-.875.711-1.586 1.586-1.586zm-1.586 4.414 1.586 1.586-1.586 1.586-1.586-1.586zm-4 2 3.586 3.586c.263.263.414.628.414 1s-.151.737-.414 1l-4.481 4.481c-.642-.301-1.351-.481-2.105-.481-2.757 0-5 2.243-5 5 0 .754.18 1.463.481 2.105l-2.481 2.481-5.586-5.586 13.586-13.586c.526-.526 1.474-.526 2 0zm-17.586 15.586.586-.586 5.586 5.586-.586.586c-.526.526-1.474.526-2 0l-3.586-3.586c-.263-.263-.414-.628-.414-1s.151-.737.414-1zm12.586-18c.551 0 1 .449 1 1s-.449 1-1 1-1-.449-1-1 .449-1 1-1zm-11 13c0 .551-.449 1-1 1s-1-.449-1-1 .449-1 1-1 1 .449 1 1zm-.097-8.964c-.307 1.956-1.586 5.964-6.903 5.964h-.924c.421-2.771 2.647-5.613 7.827-5.964zm-18.903 1.964c.551 0 1 .449 1 1s-.449 1-1 1-1-.449-1-1 .449-1 1-1zm8 10c-5.318 0-6.596-4.01-6.903-5.964 5.18.351 7.407 3.193 7.828 5.964zm3 2v-1-5h1c1.324 0 2.465-.205 3.448-.556-.279.455-.448.984-.448 1.556 0 1.238.754 2.302 1.826 2.76l-.826.826c-.645.645-1 1.502-1 2.414s.355 1.77 1 2.414l3.586 3.586c.645.645 1.502 1 2.414 1s1.77-.355 2.414-1l4.279-4.279c.884.786 2.034 1.279 3.307 1.279.302 0 .594-.038.881-.089l.407.305c3.577 2.683 5.712 6.953 5.712 11.424 0 2.386-.597 4.7-1.721 6.778-1.112-1.28-2.678-2.152-4.447-2.363-.398-1.19-1.51-2.055-2.832-2.055h-15v-2h4v-2h-4v-2c1.103 0 2-.897 2-2v-2c0-1.103-.897-2-2-2h-4zm21 32c-2.757 0-5-2.243-5-5s2.243-5 5-5 5 2.243 5 5-2.243 5-5 5zm-4.89-10h-12.11v-2h15c.192 0 .361.069.513.163-1.307.284-2.479.933-3.403 1.837zm-12.11 7v-5h10.685c-.435.911-.685 1.925-.685 3 0 1.958.81 3.728 2.11 5h-13.136c.635-.838 1.026-1.87 1.026-3zm-10-21h10l.001 2h-10.001zm2 4h6v2h-6zm0 17v-13h6v13c0 1.654-1.346 3-3 3s-3-1.346-3-3zm6 7v-2h26c1.103 0 2 .897 2.001 2zm29.136-6.104-1.398 2.517c-.528-.256-1.113-.413-1.738-.413h-2.11c1.3-1.272 2.11-3.042 2.11-5 0-.943-.19-1.843-.53-2.665 1.65-2.607 2.53-5.597 2.53-8.695 0-4.891-2.246-9.568-6.03-12.641.695-.518 1.259-1.202 1.61-2.006l1.753 1.753c4.299 4.3 6.667 10.017 6.667 16.097 0 3.858-.991 7.68-2.864 11.053z" />
                                                    <path d="m30 7c1.654 0 3-1.346 3-3s-1.346-3-3-3-3 1.346-3 3 1.346 3 3 3zm0-4c.551 0 1 .449 1 1s-.449 1-1 1-1-.449-1-1 .449-1 1-1z" />
                                                    <path d="m14 29c1.654 0 3-1.346 3-3s-1.346-3-3-3-3 1.346-3 3 1.346 3 3 3zm0-4c.551 0 1 .449 1 1s-.449 1-1 1-1-.449-1-1 .449-1 1-1z" />
                                                    <path d="m5 11c2.206 0 4-1.794 4-4s-1.794-4-4-4-4 1.794-4 4 1.794 4 4 4zm0-6c1.103 0 2 .897 2 2s-.897 2-2 2-2-.897-2-2 .897-2 2-2z" />
                                                    <path d="m3 21c0 2.206 1.794 4 4 4s4-1.794 4-4-1.794-4-4-4-4 1.794-4 4zm6 0c0 1.103-.897 2-2 2s-2-.897-2-2 .897-2 2-2 2 .897 2 2z" />
                                                </g>
                                            </svg>
                                        </a>
                                    </figure>
                                    <div class="info">
                                        <h3 class="title"> TALLER </h3>

                                        <?php
                                        if (isset($rowTaller['nombre_taller']) and isset($rowTaller['id_taller'])) {
                                            echo '  <p class="desc"><a href="taller.php?i=';
                                            echo $rowTaller['id_taller'];
                                            echo '">';
                                            echo $rowTaller['nombre_taller'];
                                            echo '</a></p>    ';
                                        } else {
                                            echo '  <p class="desc">Aún no te haz inscrito en ningún taller <br><a href="talleres.php"><br><button type="button" class="btn btn-outline-secondary">Explorar Talleres</button></a></p>    ';
                                        }
                                        ?>
                                    </div>
                                </article>
                            </div>
                        <?php  }  ?>

                        <!-- CONCURSO -->
                        <?php if ($contadorConcursos != 0) { ?>

                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12">

                                <br>
                                <br>
                                <article class="item">
                                    <figure>
                                        <a href="concursos.php" >
                                        <svg version=" 1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="74px" height="74px">
                                            <g>
                                                <g>
                                                    <path d="M511.982,97.701c-0.51-43.455-22.748-67.388-62.619-67.388c-15.432,0-30.302,3.592-40.023,6.589
			c0.968-17.762,0.983-28.726,0.983-29.271l0.001-7.604H101.683v7.603c0,0.26,0.026,11.397,1.005,29.281
			c-9.72-2.999-24.604-6.598-40.051-6.598c-39.87,0-62.109,23.932-62.619,67.388c-0.502,42.75,9.248,80.804,28.977,113.107
			c19.37,31.715,44.128,50.826,61.487,61.271c27.803,16.732,55.59,20.244,74.006,20.244c4.54,0,8.914-0.214,13.005-0.636
			c0.271-0.028,0.522-0.06,0.787-0.089c8.904,9.589,18.503,17.27,28.76,22.978c7.561,4.207,12.82,11.544,14.622,19.977
			c-10.195,3.173-17.618,12.698-17.618,23.923c0,11.477,7.763,21.17,18.31,24.12v31.91h-41.142v33.301h-40.6v64.167h230.781v-64.167
			h-40.6v-33.301h-41.142v-31.91c10.548-2.951,18.311-12.643,18.311-24.12c0-11.226-7.423-20.75-17.618-23.923
			c1.802-8.433,7.06-15.769,14.622-19.977c10.232-5.693,19.897-13.416,28.779-22.974c3.147,0.349,7.866,0.72,13.766,0.72
			c0.002,0,0.001,0,0.004,0c18.414,0,46.2-3.514,74.001-20.244c17.358-10.446,42.117-29.556,61.487-61.271
			C502.735,178.505,512.484,140.45,511.982,97.701z M394.992,15.233c-0.068,2.781-0.176,6.277-0.342,10.369H117.387
			c-0.172-4.091-0.287-7.592-0.361-10.369H394.992z M405.334,85.046c10.302-3.429,23.654-6.887,35.615-6.887
			c10.029,0,17.25,2.45,21.463,7.282c4.842,5.554,6.403,14.884,4.637,27.734c-7.353,53.526-30.562,95.308-65.354,117.647
			c-12.119,7.782-25.171,10.997-36.109,12.139C388.723,194.33,399.921,133.314,405.334,85.046z M114.495,138.009
			c7.479,40.115,17.805,74.563,30.693,102.386c0.399,0.864,0.805,1.715,1.209,2.566c-10.934-1.145-23.978-4.359-36.092-12.137
			c-34.791-22.34-58.001-64.121-65.354-117.647c-1.765-12.851-0.205-22.182,4.638-27.734c4.213-4.832,11.435-7.281,21.463-7.281
			c11.971,0,25.335,3.463,35.641,6.894C108.534,101.518,111.051,119.537,114.495,138.009z M164.488,277.117
			c-16.488,0-41.353-3.135-66.164-18.066C72.949,243.781,14.054,197.507,15.224,97.88c0.414-35.233,15.923-52.36,47.413-52.36
			c16.841,0,33.474,5.077,41.077,7.755c0.379,5.101,0.804,10.217,1.274,15.312c-10.335-3.036-22.512-5.634-33.936-5.634
			c-14.618,0-25.695,4.203-32.925,12.493c-7.859,9.013-10.632,22.403-8.242,39.798c4.094,29.801,12.65,56.141,25.431,78.287
			c12.201,21.142,27.938,37.994,46.772,50.086c18.396,11.813,38.293,14.792,52.486,15.077c0.048,0.084,0.097,0.164,0.145,0.247
			c0.778,1.363,1.564,2.703,2.358,4.026c0.247,0.413,0.496,0.823,0.745,1.232c0.757,1.244,1.52,2.476,2.291,3.683
			c0.29,0.454,0.584,0.897,0.876,1.347c0.525,0.807,1.053,1.607,1.585,2.398c0.514,0.765,1.03,1.522,1.549,2.271
			c0.509,0.733,1.019,1.462,1.533,2.181c0.241,0.338,0.478,0.689,0.719,1.023C165.763,277.112,165.134,277.117,164.488,277.117z
			 M356.188,463.015v33.753H155.82v-33.753h25.393h149.581H356.188z M289.653,429.714h25.934v18.094H196.42v-18.094h25.935H289.653z
			 M237.561,414.507v-30.982h36.885v30.982H237.561z M292.757,358.476c0,5.427-4.416,9.842-9.842,9.842h-53.822
			c-5.427,0-9.842-4.415-9.842-9.842s4.415-9.842,9.842-9.842h53.822C288.342,348.634,292.757,353.049,292.757,358.476z
			 M330.791,271.552c-0.084,0.109-0.168,0.218-0.252,0.327c-0.748,0.968-1.502,1.912-2.26,2.843
			c-0.186,0.227-0.369,0.458-0.556,0.684c-0.833,1.012-1.673,2.002-2.517,2.968c-0.041,0.046-0.079,0.094-0.12,0.14
			c-8.479,9.673-17.735,17.334-27.512,22.774c-12.051,6.704-20.245,18.611-22.499,32.139h-38.142
			c-2.255-13.529-10.449-25.435-22.5-32.139c-9.436-5.249-17.958-12.266-25.657-20.651l-1.86-2.122
			c-7.56-8.622-14.686-19.068-21.179-31.045l-1.989-3.671c-32.697-63.177-42.587-154.488-45.569-202.991h275.705
			c-0.127,2.11-0.266,4.289-0.42,6.552c-0.007,0.105-0.015,0.213-0.022,0.318c-0.168,2.452-0.348,4.911-0.539,7.372
			c-0.005,0.072-0.011,0.144-0.016,0.217c-0.608,7.8-1.328,15.629-2.149,23.365l-0.497,4.678
			c-5.525,49.528-17.194,112.625-41.801,160.153l-2.173,4.006C341.432,256.385,336.246,264.451,330.791,271.552z M413.677,259.051
			c-24.813,14.932-49.673,18.066-66.16,18.066c-0.001,0-0.003,0-0.004,0c-0.647,0-1.276-0.005-1.889-0.015
			c0.01-0.014,0.02-0.029,0.03-0.043c0.987-1.362,1.959-2.744,2.916-4.145c0.117-0.171,0.232-0.346,0.349-0.517
			c0.809-1.192,1.606-2.4,2.394-3.62c0.203-0.313,0.406-0.627,0.607-0.942c0.872-1.369,1.735-2.747,2.581-4.149
			c0.133-0.219,0.262-0.444,0.394-0.665c0.693-1.158,1.378-2.327,2.054-3.507c0.158-0.276,0.321-0.54,0.48-0.818
			c14.193-0.285,34.09-3.264,52.486-15.077c18.834-12.094,34.571-28.946,46.772-50.086c12.78-22.146,21.336-48.486,25.431-78.287
			c2.388-17.396-0.384-30.786-8.242-39.798c-7.229-8.291-18.307-12.494-32.925-12.494c-11.423,0-23.602,2.596-33.936,5.633
			c0.479-5.195,0.89-10.178,1.242-14.914c0.01-0.132,0.021-0.265,0.031-0.396c7.605-2.679,24.237-7.755,41.077-7.755
			c31.49,0,46.999,17.127,47.414,52.358C497.945,197.507,439.052,243.78,413.677,259.051z" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <path d="M192.356,246.237l-12.7,8.367c4.336,6.583,8.996,12.564,13.851,17.776l11.128-10.366
			C200.358,257.423,196.227,252.114,192.356,246.237z" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <path d="M159.716,161.922l-14.826,3.382c7.292,31.965,17.027,58.799,28.933,79.756l13.222-7.512
			C175.873,217.883,166.678,192.439,159.716,161.922z" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <polygon points="443.666,333.509 443.655,318.302 430.818,318.31 430.809,305.473 415.602,305.483 415.611,318.321 
			402.774,318.33 402.784,333.537 415.621,333.528 415.63,346.364 430.837,346.354 430.828,333.517 		" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <polygon points="112.785,412.475 112.769,397.268 101.997,397.279 101.986,386.506 86.779,386.522 86.79,397.294 76.016,397.305 
			76.033,412.512 86.805,412.501 86.816,423.275 102.023,423.259 102.012,412.486 		" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <rect x="48.845" y="288.161" width="14.345" height="15.207" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <rect x="141.039" y="333.153" width="14.345" height="15.207" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <rect x="372.254" y="378.905" width="14.345" height="15.207" />
                                                </g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            </svg>
                                        </a>
                                    </figure>
                                    <div class="info">
                                        <h3 class="title">
                                            CONCURSO </h3>

                                        <?php
                                        if (isset($rowConcurso['nombre_concurso']) and isset($rowConcurso['id_concurso'])) {
                                            echo '  <p class="desc"><a href="concurso.php?i=';
                                            echo $rowConcurso['id_concurso'];
                                            echo '">';
                                            echo $rowConcurso['nombre_concurso'];
                                            echo '</a><br> ';

                                            if ($rowConcurso['modalidad'] == 2) {
                                                if (isset($id_equipo)) {
                                                    // RECONOCER EQUIPO
                                                    $consultaEquipo = $DB_con->prepare('SELECT * FROM equipos WHERE id_equipo =:id_equipo');
                                                    $consultaEquipo->execute(array(':id_equipo' => $id_equipo));
                                                    $nomEqui = $consultaEquipo->fetch(PDO::FETCH_ASSOC);
                                                    extract($nomEqui);
                                                    echo 'Equipo: ' . $nomEqui['nomEquipo'];
                                                }
                                            }
                                            echo '
                                        </p>    ';
                                        } else {
                                            echo '  <p class="desc">Aún no te haz inscrito en ningún concurso <br><a href="concursos.php"><br><button type="button" class="btn btn-outline-secondary">Explorar Concursos</button></a></p>    ';
                                        }
                                        ?>
                                    </div>
                                </article>
                            </div>
                        <?php  }
                        if ($contadorConferencias != 0) { ?>

                            <!-- CONFERENCIA -->
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12">
                                <article class="item">
                                    <br>
                                    <br>
                                    <figure>
                                        <a href="conferencias.php">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="74px" height="74px">
                                                <path fill-rule="evenodd" d="M72.806,73.999 L53.710,73.999 C52.993,73.999 52.516,73.522 52.516,72.806 L52.516,65.644 C52.516,60.990 56.216,57.289 60.871,57.289 L65.645,57.289 C70.300,57.289 74.000,60.990 74.000,65.644 L74.000,72.806 C74.000,73.522 73.522,73.999 72.806,73.999 ZM64.452,59.676 L62.064,59.676 L62.064,60.393 L63.258,61.586 L64.452,60.393 L64.452,59.676 ZM71.613,65.644 C71.613,62.780 69.584,60.393 66.839,59.797 L66.839,60.870 C66.839,61.228 66.719,61.467 66.481,61.706 L64.093,64.093 C63.616,64.570 62.900,64.570 62.423,64.093 L60.035,61.706 C59.797,61.467 59.677,61.228 59.677,60.870 L59.677,59.797 C56.932,60.393 54.903,62.780 54.903,65.644 L54.903,71.613 L57.290,71.613 L57.290,66.838 L59.677,66.838 L59.677,71.613 L66.839,71.613 L66.839,66.838 L69.226,66.838 L69.226,71.613 L71.613,71.613 L71.613,65.644 ZM34.613,4.774 C36.642,4.774 38.194,6.325 38.194,8.354 C38.194,8.473 38.194,8.473 38.194,8.593 C39.745,10.025 40.581,12.174 40.581,14.322 C40.581,16.470 39.745,18.619 38.194,20.051 C38.194,20.170 38.194,20.170 38.194,20.290 C38.194,22.319 36.642,23.870 34.613,23.870 C32.584,23.870 31.032,22.319 31.032,20.290 C31.032,20.170 31.032,20.170 31.032,20.051 C29.839,18.857 29.003,17.306 28.764,15.515 L23.632,15.515 C23.274,16.470 22.558,17.306 21.484,17.664 C19.693,18.380 17.664,17.425 16.948,15.515 C16.232,13.725 17.187,11.696 19.097,10.980 C20.887,10.264 22.916,11.218 23.632,13.128 L28.764,13.128 C28.884,11.457 29.719,9.786 31.032,8.593 C31.032,8.473 31.032,8.473 31.032,8.354 C31.032,6.325 32.584,4.774 34.613,4.774 ZM20.290,13.128 C19.574,13.128 19.097,13.606 19.097,14.322 C19.097,15.038 19.574,15.515 20.290,15.515 C21.006,15.515 21.484,15.038 21.484,14.322 C21.484,13.606 21.006,13.128 20.290,13.128 ZM34.613,7.161 C33.897,7.161 33.419,7.638 33.419,8.354 C33.419,9.070 33.897,9.548 34.613,9.548 C35.329,9.548 35.806,9.070 35.806,8.354 C35.806,7.638 35.329,7.161 34.613,7.161 ZM34.613,21.483 C35.329,21.483 35.806,21.006 35.806,20.290 C35.806,19.574 35.329,19.096 34.613,19.096 C33.897,19.096 33.419,19.574 33.419,20.290 C33.419,21.006 33.897,21.483 34.613,21.483 ZM32.106,17.783 C33.539,16.470 35.687,16.470 37.119,17.783 C37.835,16.709 38.194,15.515 38.194,14.322 C38.194,13.128 37.835,11.935 37.119,10.861 C35.687,12.174 33.539,12.174 32.106,10.861 C31.390,11.935 31.032,13.128 31.032,14.322 C31.032,15.515 31.390,16.709 32.106,17.783 ZM69.226,34.612 L68.032,34.612 L68.032,42.370 C69.584,43.803 70.419,45.713 70.419,47.741 C70.419,51.680 67.197,54.903 63.258,54.903 C59.319,54.903 56.097,51.680 56.097,47.741 L56.097,33.418 L8.355,33.418 C7.639,33.418 7.161,32.941 7.161,32.225 L7.161,3.580 C7.161,2.864 7.639,2.387 8.355,2.387 L11.935,2.387 L11.935,1.193 C11.935,0.477 12.413,-0.001 13.129,-0.001 L60.871,-0.001 C61.587,-0.001 62.064,0.477 62.064,1.193 L62.064,4.893 C63.735,4.774 65.287,5.729 66.123,7.161 C67.435,9.309 66.719,12.293 64.452,13.606 C62.303,14.919 59.319,14.083 58.006,11.935 C56.693,9.786 57.410,6.803 59.677,5.490 L59.677,2.387 L14.323,2.387 L14.323,26.257 L56.097,26.257 L56.097,22.677 L47.742,22.677 C45.713,22.677 44.161,21.125 44.161,19.096 C44.161,17.067 45.713,15.515 47.742,15.515 L68.032,15.515 C70.658,15.515 72.806,17.664 72.806,20.290 L72.806,31.031 C72.806,33.061 71.255,34.612 69.226,34.612 ZM62.064,11.935 C63.377,11.935 64.452,10.861 64.452,9.548 C64.452,8.235 63.377,7.161 62.064,7.161 C60.752,7.161 59.677,8.235 59.677,9.548 C59.677,10.861 60.752,11.935 62.064,11.935 ZM63.258,52.516 C65.884,52.516 68.032,50.367 68.032,47.741 C68.032,45.115 65.884,42.967 63.258,42.967 C60.632,42.967 58.484,45.115 58.484,47.741 C58.484,50.367 60.632,52.516 63.258,52.516 ZM13.129,28.644 C12.413,28.644 11.935,28.167 11.935,27.451 L11.935,4.774 L9.548,4.774 L9.548,31.031 L56.097,31.031 L56.097,28.644 L13.129,28.644 ZM48.935,17.903 L47.742,17.903 C47.026,17.903 46.548,18.380 46.548,19.096 C46.548,19.812 47.026,20.290 47.742,20.290 L48.935,20.290 L48.935,17.903 ZM70.419,20.290 C70.419,18.977 69.345,17.903 68.032,17.903 L51.323,17.903 L51.323,20.290 L57.290,20.290 C58.006,20.290 58.484,20.767 58.484,21.483 L58.484,42.370 C59.200,41.774 60.035,41.296 60.871,40.938 L60.871,31.031 L63.258,31.031 L63.258,40.580 C64.093,40.580 64.929,40.700 65.645,40.938 L65.645,20.290 L68.032,20.290 L68.032,27.451 L70.419,27.451 L70.419,20.290 ZM70.419,29.838 L68.032,29.838 L68.032,32.225 L69.226,32.225 C69.942,32.225 70.419,31.748 70.419,31.031 L70.419,29.838 ZM17.903,47.741 C17.903,51.680 14.681,54.903 10.742,54.903 C6.803,54.903 3.581,51.680 3.581,47.741 C3.581,43.803 6.803,40.580 10.742,40.580 C14.681,40.580 17.903,43.803 17.903,47.741 ZM5.968,47.741 C5.968,50.367 8.116,52.516 10.742,52.516 C13.368,52.516 15.516,50.367 15.516,47.741 C15.516,45.115 13.368,42.967 10.742,42.967 C8.116,42.967 5.968,45.115 5.968,47.741 ZM13.129,57.289 C17.784,57.289 21.484,60.990 21.484,65.644 L21.484,72.806 C21.484,73.522 21.006,73.999 20.290,73.999 L1.194,73.999 C0.477,73.999 -0.000,73.522 -0.000,72.806 L-0.000,65.644 C-0.000,60.990 3.700,57.289 8.355,57.289 L13.129,57.289 ZM11.935,59.676 L9.548,59.676 L9.548,60.393 L10.742,61.586 L11.935,60.393 L11.935,59.676 ZM7.161,60.870 L7.161,59.797 C4.416,60.393 2.387,62.780 2.387,65.644 L2.387,71.613 L4.774,71.613 L4.774,66.838 L7.161,66.838 L7.161,71.613 L14.323,71.613 L14.323,66.838 L16.710,66.838 L16.710,71.613 L19.097,71.613 L19.097,65.644 C19.097,62.780 17.068,60.393 14.323,59.797 L14.323,60.870 C14.323,61.228 14.203,61.467 13.964,61.706 L11.577,64.093 C11.100,64.570 10.384,64.570 9.906,64.093 L7.519,61.706 C7.281,61.467 7.161,61.228 7.161,60.870 ZM29.839,47.741 C29.839,43.803 33.061,40.580 37.000,40.580 C40.939,40.580 44.161,43.803 44.161,47.741 C44.161,51.680 40.939,54.903 37.000,54.903 C33.061,54.903 29.839,51.680 29.839,47.741 ZM41.774,47.741 C41.774,45.115 39.626,42.967 37.000,42.967 C34.374,42.967 32.226,45.115 32.226,47.741 C32.226,50.367 34.374,52.516 37.000,52.516 C39.626,52.516 41.774,50.367 41.774,47.741 ZM34.613,57.289 L39.387,57.289 C44.042,57.289 47.742,60.990 47.742,65.644 L47.742,72.806 C47.742,73.522 47.264,73.999 46.548,73.999 L27.452,73.999 C26.735,73.999 26.258,73.522 26.258,72.806 L26.258,65.644 C26.258,60.990 29.958,57.289 34.613,57.289 ZM38.194,59.676 L35.806,59.676 L35.806,60.393 L37.000,61.586 L38.194,60.393 L38.194,59.676 ZM28.645,71.613 L31.032,71.613 L31.032,66.838 L33.419,66.838 L33.419,71.613 L40.581,71.613 L40.581,66.838 L42.968,66.838 L42.968,71.613 L45.355,71.613 L45.355,65.644 C45.355,62.780 43.326,60.393 40.581,59.797 L40.581,60.870 C40.581,61.228 40.461,61.467 40.222,61.706 L37.835,64.093 C37.358,64.570 36.642,64.570 36.165,64.093 L33.777,61.706 C33.539,61.467 33.419,61.228 33.419,60.870 L33.419,59.797 C30.674,60.393 28.645,62.780 28.645,65.644 L28.645,71.613 Z" />
                                            </svg>
                                        </a>
                                    </figure>
                                    <div class="info">
                                        <h3 class="title">
                                            CONFERENCIA </h3>

                                        <?php

                                        if (isset($id_alumno)) {
                                            $id_conferencia = 0;
                                            // INFORMACION DE LAS CONFERENCIAS DEL ALUMNO
                                            $consultaConferencias1 = $DB_con->prepare("SELECT alumnos_conferencias.*, conferencias.* FROM conferencias RIGHT JOIN alumnos_conferencias ON conferencias.id_conferencia = alumnos_conferencias.id_conferencia WHERE alumnos_conferencias.id_alumno =:uid");
                                            $consultaConferencias1->execute(array(':uid' => $id_alumno));
                                            while ($rowConf = $consultaConferencias1->fetch(PDO::FETCH_OBJ)) {
                                                echo '<p class="desc"><a href="conferencia.php?i=';
                                                echo $rowConf->id_conferencia;
                                                echo '">';
                                                echo $rowConf->nombre_conferencia;
                                                echo '</a><br></p> ';
                                                $id_conferencia = $rowConf->id_conferencia;
                                            }
                                        }
                                        if ($id_conferencia == 0) {
                                            echo '  <p class="desc">Aún no te haz inscrito en ningúna conferencia <br><a href="conferencias.php"><br><button type="button" class="btn btn-outline-secondary">Explorar Conferencias</button></a></p>    ';
                                        }
                                        ?>
                                    </div>
                                </article>
                            </div>
                        <?php } ?>
                    </div>
                </div>
                <br>
                <!-- <article class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 item">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        <strong>asd</strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </article> -->
            </div>
        </section>


    </main>

    <!-- Footer page -->
    <footer class="footer">
        <div class="footer-bottom">
            <div class="container">
                <div class="footer-bottom-content">
                    <p class="copyright">Sistema de Administración de Eventos y Congresos<span></span></p>

                </div>
            </div>
        </div>
    </footer>

    <!-- Back to top -->
    <div id="back-to-top">
        <i class="fa fa-angle-up"></i>
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
    <script src="js/main/main.js"></script>
    <script type='text/javascript'>
        document.oncontextmenu = function() {
            return false
        }
    </script>
</body>

</html>