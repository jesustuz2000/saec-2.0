<?php
session_start();
$mensaje = "";

if (isset($_POST['btnAccion'])) {
    switch ($_POST['btnAccion']) {
        case 'Agregar':
            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);
                // $mensaje ="Ok ID Correcto ".$ID;
            } else {
                $mensaje = "Upsss... ID Correcto " . $ID;
            }

            if (is_string(openssl_decrypt($_POST['nombre'], COD, KEY))) {
                $NOMBRE = openssl_decrypt($_POST['nombre'], COD, KEY);
            } else {
                $mensaje = "Upsss... Algo Pasa con el nombre ";
                break;
            }

            if (is_numeric(openssl_decrypt($_POST['cantidad'], COD, KEY))) {
                $CANTIDAD = openssl_decrypt($_POST['cantidad'], COD, KEY);
            } else {
                $mensaje = "Upsss... Algo pasa con la cantidad ";
                break;
            }

            if (is_numeric(openssl_decrypt($_POST['precio'], COD, KEY))) {
                $PRECIO = openssl_decrypt($_POST['precio'], COD, KEY);
            } else {
                $mensaje = "Upsss... Algo pasa con el precio ";
                break;
            }


            // SECCIONES
            if (!isset($_SESSION['CARRITO'])) {
                $producto = array(
                    'ID' => $ID,
                    'NOMBRE' => $NOMBRE,
                    'CANTIDAD' => $CANTIDAD,
                    'PRECIO' => $PRECIO
                );
                $_SESSION['CARRITO'][0] = $producto;
                $mensaje = "Producto agregado al carrito.";
            } else {
                $idproducto = array_column($_SESSION['CARRITO'], "ID");
                if (in_array($ID, $idproducto)) {
                    echo '<script> alert("El producto ya ha sido selecionada"); </script>';
                } else {

                    // si hay selecciona mas de un producto
                    $NumeroProductos = count($_SESSION['CARRITO']);
                    $producto = array(
                        'ID' => $ID,
                        'NOMBRE' => $NOMBRE,
                        'CANTIDAD' => $CANTIDAD,
                        'PRECIO' => $PRECIO
                    );
                    $_SESSION['CARRITO'][$NumeroProductos] = $producto;
                    $mensaje = "Producto agregado al carrito.";
                }
            }

            // $mensaje = print_r($_SESSION, true);
            break;

        case 'Eliminar':
            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);

                foreach ($_SESSION['CARRITO'] as $indice => $producto) {
                    if ($producto['ID'] == $ID) {
                        unset($_SESSION['CARRITO'][$indice]);
                        echo '<script>alert("Elemento Borrado...");</script>';
                    }
                }
            } else {
                $mensaje = "Upsss... ID Correcto " . $ID;
            }

            break;


        default:
            break;
    }
}
