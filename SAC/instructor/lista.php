<?php
error_reporting(~E_NOTICE);
session_start();
$id_instructor = $_SESSION["id_instructor"];
if (!isset($_SESSION["id_instructor"]) || $_SESSION["id_instructor"] == null) {
    print "<script>window.location='../../index.php';</script>";
}

//Comprobamos si esta definida la sesión 'tiempo'.
if (isset($_SESSION['tiempo'])) {
    $inactivo = 900; //15min en este caso.
    $vida_session = time() - $_SESSION['tiempo'];
    if ($vida_session > $inactivo) {
        session_unset();
        session_destroy();
        header("Location: ../../index");
        exit();
    } else {  // si no ha caducado la sesion, actualizamos
        $_SESSION['tiempo'] = time();
    }
} else {
    $_SESSION['tiempo'] = time();
}
require_once '../Conexion.php';

// CONSULTA PARA SABER EL TALLER, CONCURSO Y CONFERENCIA DEL INSTRUCTOR
$consultaIns0 = $DB_con->prepare('SELECT * FROM instructores WHERE id_user = :id_user');
$consultaIns0->execute(array(':id_user' => $_SESSION["id_instructor"]));
$datos = $consultaIns0->fetch(PDO::FETCH_ASSOC);
extract($datos);

if (isset($_POST['lista_taller'])) {
    $consultaIns = $DB_con->prepare('SELECT * FROM talleres WHERE id_instructor = :id_instructor');
    $consultaIns->execute(array(':id_instructor' => $datos["id_instructor"]));
    $datos = $consultaIns->fetch(PDO::FETCH_ASSOC);
    extract($datos);
    $nombre = $datos['nombre_taller'];
    $tipo = 'taller=true&agrupar=nombre';

} elseif (isset($_POST['lista_concurso']) || isset($_POST['lista_concurso_grupal'])) {
    $consultaIns2 = $DB_con->prepare('SELECT * FROM concursos WHERE id_instructor = :id_instructor');
    $consultaIns2->execute(array(':id_instructor' => $datos["id_instructor"]));
    $datos = $consultaIns2->fetch(PDO::FETCH_ASSOC);
    extract($datos);
    $nombre = $datos['nombre_concurso'];
    $tipo = 'concurso=true&agrupar=nombre';


} elseif (isset($_POST['lista_conferencia'])) {
    $consultaIns3 = $DB_con->prepare('SELECT * FROM conferencias WHERE id_instructor = :id_instructor');
    $consultaIns3->execute(array(':id_instructor' => $datos["id_instructor"]));
    $datos = $consultaIns3->fetch(PDO::FETCH_ASSOC);
    extract($datos);
    $nombre = $datos['nombre_conferencia'];
    $tipo = 'conferencia=true&agrupar=nombre';


} else {
    print "<script>window.location='alumnos.php';</script>";
}

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Sistema de Administración de Congresos</title>

    <link href="../../plugins/admin/css/styles.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="../../plugins/admin/assets\img\favicon.png">

    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous">
    <script data-search-pseudo-elements="" defer="" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="app.js"></script>


</head>

<body class="nav-fixed">
    <nav class="topnav navbar navbar-expand shadow navbar-light bg-white" id="sidenavAccordion">
        <a class="navbar-brand d-none d-sm-block" href="index.php">SAC</a><button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle" href="#"><i data-feather="menu"></i></button>
        <ul class="navbar-nav align-items-center ml-auto">
            <li class="nav-item dropdown no-caret mr-3 dropdown-user">
                <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="../../images/icono_usuario.png"></a>
                <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                    <h6 class="dropdown-header d-flex align-items-center">
                        <img class="dropdown-user-img" src="../../images/icono_usuario.png">
                        <div class="dropdown-user-details">
                            <div class="dropdown-user-details-name">Administrador</div>
                            <div class="dropdown-user-details-email">Ingenieria en Sistemas Computacionales</div>
                        </div>
                    </h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="perfil.php">
                        <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                        Modificar Perfil
                    </a>
                    <a class="dropdown-item" href="../logout.php">
                        <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                        Salir
                    </a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <?php include('nav.php'); ?>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                    <div class="container-fluid">
                        <div class="page-header-content">
                            <h1 class="page-header-title">
                                <div class="page-header-icon"><i data-feather=""></i></div>
                                <span><?php echo $nombre; ?></span>
                            </h1>
                            <a target="_blank" href="lista_alumnos.php?<?php echo $tipo; ?>"><button>Imprimir</button></a>
                        </div>
                    </div>
                </div>
                <?php if (isset($_POST['lista_taller'])) {
                    echo '<script>recargar_t();</script>';
                ?>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">Alumnos inscritos al taller <button class="btn btn-primary btn-sm" onclick="recargar_t();">Actulizar</button></div>
                            <div class="card-body">
                                <div class="datatable table-responsive">
                                    <div id="lista-alumno">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } elseif (isset($_POST['lista_concurso'])) {
                    echo '<script>recargar_c();</script>';
                ?>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">Alumnos inscritos al concurso <button class="btn btn-primary btn-sm" onclick="recargar_c();">Actulizar</button></div>
                            <div class="card-body">
                                <div class="datatable table-responsive">
                                    <div id="lista-alumno">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } elseif (isset($_POST['lista_concurso_grupal'])) {
                    echo '<script>recargar_g();</script>';
                ?>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">Alumnos inscritos al concurso <button class="btn btn-primary btn-sm" onclick="recargar_g();">Actulizar</button></div>
                            <div class="card-body">
                                <div class="datatable table-responsive">
                                    <div id="lista-alumno">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php }
                if (isset($_POST['lista_conferencia'])) {
                    echo '<script>recargar_conf();</script>';
                ?>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">Alumnos inscritos a la conferencia <button class="btn btn-primary btn-sm" onclick="recargar_conf();">Actulizar</button></div>
                            <div class="card-body">
                                <div class="datatable table-responsive">
                                    <div id="lista-alumno">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </main>
            <footer class="footer mt-auto footer-light">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 small">Sistema de Administración de Congresos</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>

    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="../../plugins/admin/js\scripts.js"></script>

    <script src="../../plugins/admin/js\sb-customizer.js"></script>
</body>

</html>