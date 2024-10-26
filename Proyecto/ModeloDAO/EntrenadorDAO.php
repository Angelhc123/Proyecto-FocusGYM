<?php
require_once __DIR__ . '/../Conexion/conexion.php';
require_once __DIR__ . '/../Interfaces/EntrenadorDAOInterface.php';

class EntrenadorDAO implements EntrenadorDAOInterface {
    private $conn;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    // Método para verificar el login
    public function login($usuario, $clave) {
        try {
            $query = "SELECT * FROM Entrenadores WHERE usuario = :usuario";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(":usuario", $usuario);
            $stmt->execute();
            
            $entrenador = $stmt->fetch(PDO::FETCH_ASSOC);

            // Verificar si se encontró el usuario y si la contraseña es correcta
            if ($entrenador && password_verify($clave, $entrenador['clave'])) {
                return $entrenador;  // Retorna los datos del entrenador si el login es exitoso
            }
            return null;
        } catch (PDOException $e) {
            echo "Error en el login: " . $e->getMessage();
            return null;
        }
    }
}
?>
