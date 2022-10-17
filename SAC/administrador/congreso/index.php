﻿<?php
session_start();
if (!isset($_SESSION["id_administrador_carrera"]) || $_SESSION["id_administrador_carrera"] == null) {
    print "<script>window.location='../../../index.php';</script>";
}

//Comprobamos si esta definida la sesión 'tiempo'.
if (isset($_SESSION['tiempo'])) {
    $inactivo = 900; //15min en este caso.
    $vida_session = time() - $_SESSION['tiempo'];
    if ($vida_session > $inactivo) {
        session_unset();
        session_destroy();
        header("Location: ../../../index.php");
        exit();
    } else {  // si no ha caducado la sesion, actualizamos
        $_SESSION['tiempo'] = time();
    }
} else {
    $_SESSION['tiempo'] = time();
}

include('../../Conexion.php');

// ELIMINAR TALLER
if (isset($_GET['delete_id'])) { //id del taller

    //DATOS ADMIN (SABER LA CARRERA)
    $consulta = $DB_con->prepare('SELECT * FROM admin_carreras WHERE id_user=:id_user');
    $consulta->execute(array(':id_user' => $_SESSION["id_administrador_carrera"]));
    $datosCarrera = $consulta->fetch(PDO::FETCH_ASSOC);
    extract($datosCarrera);

    // Datos del taller-instructor
    $consulta = $DB_con->prepare('SELECT instructores.*, talleres.* FROM instructores INNER JOIN talleres ON instructores.id_instructor = talleres.id_instructor WHERE talleres.id_taller= :id_taller');
    $consulta->execute(array(':id_taller' => $_GET['delete_id']));
    $datosTaller = $consulta->fetch(PDO::FETCH_ASSOC);
    extract($datosTaller);

    //Comprueba si es el taller del instructor
    // if ($_GET['delete_id'] == $datosTaller['id_taller']) {
        $nulo = null;

        // Selecciona imagen a borrar
        $elimnarTallerImagen = $DB_con->prepare('SELECT * FROM talleres WHERE id_taller =:uid');
        $elimnarTallerImagen->execute(array(':uid' => $_GET['delete_id']));
        $imgRow = $elimnarTallerImagen->fetch(PDO::FETCH_ASSOC);
        // Ruta de la imagen
        unlink("../../../images/talleres/" . $imgRow['imagen_taller']);

        // Consulta para eliminar el registro de la base de datos
        $elimnarTaller = $DB_con->prepare('DELETE FROM talleres WHERE id_taller =:uid2');
        $elimnarTaller->execute(array(':uid2' => $_GET['delete_id']));

        // Actulizar alumnos inscritos
        $upAlumnos = $DB_con->prepare('UPDATE alumnos SET id_taller=:nulo WHERE id_taller =:uid3');
        $upAlumnos->execute(array(':nulo' => $nulo, ':uid3' => $imgRow['id_taller']));
    // }
    header("Location: index.php");
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
    <title>Sistema de Administración de Eventos y Congresos</title>

    <link href="../../../plugins/admin/css/styles.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="../../../plugins/admin/assets\img\favicon.png">

    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous">
    <script data-search-pseudo-elements="" defer="" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>

    <!-- Bootstrap -->
    <link rel='stylesheet' href='../../../vendor/jquery-ui/jquery-ui.min.css'>
    <link rel="stylesheet" href="../../../vendor/bootstrap/css/bootstrap.min.css">

    <!-- Font Icon -->
    <link rel="stylesheet" href="../../../fonts/line-awesome/css/line-awesome.min.css">
    <link rel="stylesheet" href="../../../fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../fonts/font-awesome-5/css/fontawesome-all.min.css">

    <!-- Revolution slider -->
    <link rel="stylesheet" href="../../../vendor/revolution/settings.css">
    <link rel="stylesheet" href="../../../vendor/revolution/layers.css">
    <link rel="stylesheet" href="../../../vendor/revolution/navigation.css">
    <link rel="stylesheet" href="../../../vendor/revolution/settings-source.css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="../../../vendor/css-hamburgers/dist/hamburgers.min.css">
    <link rel="stylesheet" href="../../../vendor/slick/slick-theme.css">
    <link rel="stylesheet" href="../../../vendor/slick/slick.css">
    <link rel="stylesheet" href="../../../vendor/fancybox/dist/jquery.fancybox.min.css">
    <link rel='stylesheet' href='../../../vendor/fullcalendar/fullcalendar.css' />
    <link rel='stylesheet' href='../../../vendor/animate/animate.css' />

    <!-- Main CSS File -->
    <link href="../../../css/style.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.png">



</head>

<body class="nav-fixed">
    <nav class="topnav navbar navbar-expand shadow navbar-light bg-white" id="sidenavAccordion">
        <a class="navbar-brand d-none d-sm-block" href="../index.php">SAC</a><button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle" href="#"><i data-feather="menu"></i></button>
        <ul class="navbar-nav align-items-center ml-auto">
            <li class="nav-item dropdown no-caret mr-3 dropdown-user">
                <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="../../../images/icono_usuario.png"></a>
                <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                    <h6 class="dropdown-header d-flex align-items-center">
                        <img class="dropdown-user-img" src="../../../images/icono_usuario.png">
                        <div class="dropdown-user-details">
                            <div class="dropdown-user-details-name">Administrador</div>
                            <div class="dropdown-user-details-email">Ingenieria en Sistemas Computacionales</div>
                        </div>
                    </h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../perfil.php">
                        <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                        Modificar Perfil
                    </a>
                    <a class="dropdown-item" href="../../logout.php">
                        <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                        Salir
                    </a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <?php include('../nav-2.php'); ?>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="page-header pb-1 page-header-dark bg-gradient-primary-to-secondary">
                    <div class="container-fluid">
                        <div class="page-header-content">
                            <h1 class="page-header-title">
                                <div class="page-header-icon"><i data-feather=""></i></div>
                                <span>Talleres <p>Los talleres serán publicados una vez que active la cuenta del instructor</p></span>
                            </h1>
                            <p><a href="nuevo_taller.php"><button class="btn btn-primary" type="button">Agregar Taller</button></a></p>
                        </div>
                    </div>
                </div>
                <div class="container-fluid mt-n10">
                    <div class="container-fluid mt-4">
                        <div id="solid">
                            <section class="standard-list courses-2 section-padding-large">
                                <div class="container">
                                    <div class="courses-content">
                                        <div class="row">
                                            <?php
                                            // DATOS DEL admin_carreras (solo para saber a que carrera pertenece)
                                            $Alumno = $DB_con->prepare('SELECT * FROM admin_carreras  WHERE id_user =:uid');
                                            $Alumno->execute(array(':uid' => $_SESSION["id_administrador_carrera"]));
                                            $rowAlumno = $Alumno->fetch(PDO::FETCH_ASSOC);
                                            extract($rowAlumno);

                                            // INFORMACION DE LOS TALLERES
                                            $Talleres = $DB_con->prepare("SELECT instructores.*, talleres.* FROM talleres INNER JOIN instructores ON talleres.id_instructor = instructores.id_instructor WHERE instructores.id_adminCarrera  =:uid ORDER BY id_taller ASC");
                                            $Talleres->execute(array(':uid' => $rowAlumno["id_adminCarrera"]));

                                            while ($row = $Talleres->fetch(PDO::FETCH_OBJ)) {

                                                // CONTADOR DE ALUMNOS INSCRITOS AL TALLER
                                                $consulta2 = $DB_con->prepare('SELECT COUNT(*) AS cont FROM alumnos WHERE id_taller =:uid');
                                                $consulta2->execute(array(':uid' => $row->id_taller));
                                                $contador = $consulta2->fetch(PDO::FETCH_ASSOC);
                                                extract($contador);

                                            ?>
                                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                    <article class="item">
                                                        <div class="item-thumb"> <a> <img src="../../../images/talleres/<?php echo $row->imagen_taller; ?>" alt=""> </a> </div>
                                                        <div class="info">
                                                            <h3 class="title"> <a><?php echo $row->nombre_taller; ?></a> </h3>
                                                            <p>Instructor: <?php echo $row->nombre_instructor . ' ' . $row->apellido_instructor ?></p>
                                                            <div class="desc display-flex">
                                                                <div class="comments-students"> <a class="comments"><i class="fas fa-user-graduate"></i> <?php echo $contador['cont']; ?> alumnos de <b><?php echo $row->cupo_taller; ?></b></a>
                                                                </div>
                                                                <?php
                                                                if ($row->status_instructor == 0) {
                                                                    echo '<span class="price notfree" title="la cuenta del instructor esta inactiva">¡No publico!</span>';
                                                                } else {
                                                                    if ($contador['cont'] >= $row->cupo_taller) {
                                                                        echo '<span class="price notfree">Completado</span>';
                                                                    } else {
                                                                        echo '<span class="price free">Disponible</span>';
                                                                    }
                                                                }
                                                                ?>
                                                            </div>
                                                            <div class="desc display-flex">
                                                                <form action="taller.php" method="GET">
                                                                    <input type="hidden" name="id" value="<?php echo $row->id_taller; ?>">
                                                                    <button name="editar">Editar</button>
                                                                </form>

                                                                <button Onclick="confirmarRegistro<?php echo $row->id_taller; ?>();">Eliminar</button>

                                                                <form action="lista_alumnos.php" method="POST">
                                                                    <input type="hidden" name="lista_taller" value="<?php echo $row->id_taller; ?>">
                                                                    <button>Ver lista</button>
                                                                </form>
                                                            </div>
                                                            <script type="text/javascript">
                                                                function confirmarRegistro<?php echo $row->id_taller; ?>() {
                                                                    if (window.confirm("¿Seguro que desea eliminar este taller?\nIMPORTANTE: Esto eliminar el registro del instructor incluyendo a los alumnos inscritos a este.") == true) {
                                                                        window.location = "index.php?delete_id=<?php echo $row->id_taller; ?>";
                                                                    }
                                                                }
                                                            </script>
                                                        </div>
                                                    </article>
                                                </div>
                                            <?php
                                            }
                                            ?>

                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="footer mt-auto footer-light">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 small">Sistema de Administración de Eventos y Congresos</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>

    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="../../../plugins/admin/js\scripts.js"></script>
    <script src="../../../plugins/admin/assets\demo\datatables-demo.js"></script>

    <script src="../../../plugins/admin/js\sb-customizer.js"></script>
</body>

</html>