<?php
class Entrenador {
    private $entrenador_id;
    private $nombre;
    private $apellido;
    private $email;
    private $telefono;
    private $usuario;
    private $clave;

    public function __construct($nombre, $apellido, $email, $telefono, $usuario, $clave) {
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->email = $email;
        $this->telefono = $telefono;
        $this->usuario = $usuario;
        $this->clave = $clave;
    }

    // Getters
    public function getId() {
        return $this->entrenador_id;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getApellido() {
        return $this->apellido;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getTelefono() {
        return $this->telefono;
    }

    public function getUsuario() {
        return $this->usuario;
    }

    public function getClave() {
        return $this->clave;
    }

    // Setters
    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setApellido($apellido) {
        $this->apellido = $apellido;
    }

    public function setEmail($email) {
        $this->email = $email;
    }

    public function setTelefono($telefono) {
        $this->telefono = $telefono;
    }

    public function setUsuario($usuario) {
        $this->usuario = $usuario;
    }

    public function setClave($clave) {
        $this->clave = $clave;
    }
}
?>
