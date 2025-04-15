<?php include 'connect.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokédex - Base de Datos de Pokémon</title>
    <link rel="icon" type="image/png" href="Media/Poké_Ball.svg.png">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Interruptor de tema -->
    <div class="theme-toggle">
        <input type="checkbox" id="theme-switch">
        <label for="theme-switch" class="toggle-label">
            <i class="fas fa-sun"></i>
            <i class="fas fa-moon"></i>
            <span class="toggle-ball"></span>
        </label>
    </div>

    <!-- Encabezado -->
    <header>
        <div class="logo-container">
            <img src="Media/pokedex-logo.png" alt="Pokédex Logo" class="logo">
        </div>
        <div class="search-container">
            <div class="search-wrapper">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="search-input" placeholder="Buscar Pokémon por nombre o número...">
                <button id="search-button">Buscar</button>
            </div>
            <div class="filter-options">
                <select id="type-filter">
                    <option value="">Todos los tipos</option>
                    <option value="normal">Normal</option>
                    <option value="fire">Fuego</option>
                    <option value="water">Agua</option>
                    <option value="electric">Eléctrico</option>
                    <option value="grass">Planta</option>
                    <option value="ice">Hielo</option>
                    <option value="fighting">Lucha</option>
                    <option value="poison">Veneno</option>
                    <option value="ground">Tierra</option>
                    <option value="flying">Volador</option>
                    <option value="psychic">Psíquico</option>
                    <option value="bug">Bicho</option>
                    <option value="rock">Roca</option>
                    <option value="ghost">Fantasma</option>
                    <option value="dragon">Dragón</option>
                    <option value="dark">Siniestro</option>
                    <option value="steel">Acero</option>
                    <option value="fairy">Hada</option>
                </select>
                <select id="generation-filter">
                    <option value="">Todas las generaciones</option>
                    <option value="1">Primera generación</option>
                    <option value="2">Segunda generación</option>
                    <option value="3">Tercera generación</option>
                    <option value="4">Cuarta generación</option>
                    <option value="5">Quinta generación</option>
                    <option value="6">Sexta generación</option>
                    <option value="7">Séptima generación</option>
                    <option value="8">Octava generación</option>
                </select>
                <select id="attribute-filter">
                    <option value="">Todos los atributos</option>
                    <option value="legendary">Legendario</option>
                    <option value="mythical">Mítico</option>
                    <option value="shiny">Shiny</option>
                </select>
                <button class="reset-button" id="reset-filters">
                    <i class="fas fa-undo"></i> Reiniciar filtros
                </button>
            </div>
        </div>
    </header>

    <!-- Contenido principal -->
    <main>
        <div id="pokedex-container" class="pokedex-container">
            <!-- Las tarjetas de Pokémon se generarán dinámicamente con JavaScript -->
        </div>

        <!-- Paginación -->
        <div class="pagination">
            <button id="prev-button" class="pagination-button">
                <i class="fas fa-chevron-left"></i> Anterior
            </button>
            <div id="page-info" class="page-info">Página 1 de 5</div>
            <button id="next-button" class="pagination-button">
                Siguiente <i class="fas fa-chevron-right"></i>
            </button>
        </div>
    </main>

    <!-- Modal para detalles de Pokémon -->
    <div id="pokemon-modal" class="modal">
        <div class="modal-content">
            <span class="close-button" id="close-modal">&times;</span>
            <div id="modal-content-container">
                <!-- El contenido del modal se generará dinámicamente -->
            </div>
        </div>
    </div>

    <!-- Pie de página -->
    <footer>
        <div class="footer-container">
            <div class="footer-content">
            <div class="footer-section">
                <h3>Pokédex</h3>
                <p>La guía definitiva de Pokémon con información detallada sobre cada especie, tipos, habilidades y estadísticas.</p>
            </div>
            <div class="footer-section">
                <h3>Enlaces rápidos</h3>
                <ul class="footer-links">
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Pokémon legendarios</a></li>
                <li><a href="#">Pokémon míticos</a></li>
                <li><a href="#">Generaciones</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contacto</h3>
                <p>¿Tienes alguna sugerencia o encontraste un error?</p>
                <a href="mailto:info@pokedex.com" class="contact-button">Contáctanos</a>
            </div>
            </div>
            <div class="footer-bottom">
            <p>&copy; 2025 Pokédex. Todos los derechos reservados.</p>
            <p>Pokémon y todos los nombres relacionados son marcas registradas de Nintendo.</p>
            </div>
        </div>
    </footer>


    <!-- Script para pasar los datos de PHP a JavaScript -->
    <script>
        const pokemonsData = <?php echo $pokemonsJSON; ?>;
    </script>
    <script src="script.js"></script>
</body>
</html>
