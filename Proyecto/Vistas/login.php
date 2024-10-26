<?php
require_once '../Controlador/EntrenadorController.php';

session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $usuario = $_POST['usuario'];
    $clave = $_POST['clave'];

    $controller = new EntrenadorController();
    $entrenador = $controller->login($usuario, $clave);

    if ($entrenador) {
        // Login exitoso
        $_SESSION['entrenador_id'] = $entrenador['entrenador_id'];
        $_SESSION['nombre'] = $entrenador['nombre'];
        header("Location: VistaEntrenadores/test.php");  // Redirige a la página "test.php" dentro de "VistaEntrenadores"
        exit();
    } else {
        // Login fallido
        $error = "Usuario o contraseña incorrectos.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login de Entrenadores</title>
</head>
<body>
    <h2>Login de Entrenadores</h2>
    
    <?php if (isset($error)): ?>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php endif; ?>
    
    <form action="" method="POST">
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required>
        
        <label for="clave">Contraseña:</label>
        <input type="password" id="clave" name="clave" required>
        
        <button type="submit">Ingresar</button>
    </form>
</body>
</html>
