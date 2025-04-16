<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "alex";
$password = "123";
$dbname = "pokedex";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Establecer el conjunto de caracteres
$conn->set_charset("utf8mb4");

// Consulta SQL para recuperar los Pokémon con todos los campos necesarios
$sql = "SELECT id, name, type1, type2, generation, sprite_url, height, weight, description, 
        is_legendary, is_mythical, is_shiny, base_hp, base_attack, base_defense, 
        base_sp_attack, base_sp_defense, base_speed FROM pokemon";
$result = $conn->query($sql);

// Crear un array para almacenar los datos
$pokemons = array();
if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Asegurar que los campos booleanos estén correctamente definidos
        $row['is_legendary'] = isset($row['is_legendary']) ? (bool)$row['is_legendary'] : false;
        $row['is_mythical'] = isset($row['is_mythical']) ? (bool)$row['is_mythical'] : false;
        $row['is_shiny'] = isset($row['is_shiny']) ? (bool)$row['is_shiny'] : false;
        
        $pokemons[] = $row;
    }
}

// Cerrar conexión
$conn->close();

// Convertir el array a formato JSON para usar con JavaScript
$pokemonsJSON = json_encode($pokemons);
?>
