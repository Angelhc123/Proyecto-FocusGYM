CREATE DATABASE gym;
USE gym;

-- Tabla Clientes
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(9),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Medidas
CREATE TABLE Medidas (
    medida_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    peso DECIMAL(5,2),
    altura DECIMAL(5,2),
    porcentaje_grasa DECIMAL(5,2),
    fecha_medicion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla Metas (crear antes de Progreso)
CREATE TABLE Metas (
    meta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    descripcion TEXT,
    fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_fin DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla Progreso (crear después de Medidas y Metas)
CREATE TABLE Progreso (
    progreso_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    medida_id INT,
    meta_id INT,
    fecha_progreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (medida_id) REFERENCES Medidas(medida_id),
    FOREIGN KEY (meta_id) REFERENCES Metas(meta_id)
);

-- Tabla Entrenamientos
CREATE TABLE Entrenamientos (
    entrenamiento_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    descripcion TEXT,
    fecha_entrenamiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla Asistencias
CREATE TABLE Asistencias (
    asistencia_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_asistencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla Entrenadores
CREATE TABLE Entrenadores (
    entrenador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(9),
    usuario VARCHAR(100) UNIQUE,
    clave VARCHAR(100)
);

-- Tabla Citas
CREATE TABLE Citas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    entrenador_id INT,
    fecha_cita DATETIME,
    estado VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (entrenador_id) REFERENCES Entrenadores(entrenador_id)
);

-- Tabla Nutricionistas
CREATE TABLE Nutricionistas (
    nutricionista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(9),
    usuario VARCHAR(100) UNIQUE,
    clave VARCHAR(100)
);
-- Tabla Notificaciones
CREATE TABLE Notificaciones (
    notificacion_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    mensaje TEXT,
    plataforma VARCHAR(50),
    fecha_notificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
