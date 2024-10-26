<?php
require_once '../ModeloDAO/EntrenadorDAO.php';

class EntrenadorController {
    private $entrenadorDAO;

    public function __construct() {
        $this->entrenadorDAO = new EntrenadorDAO();
    }

    // Método para manejar el login de entrenadores
    public function login($usuario, $clave) {
        return $this->entrenadorDAO->login($usuario, $clave);
    }
}
?>
