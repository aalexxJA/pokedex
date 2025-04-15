// Variables globales
const pokedexContainer = document.getElementById('pokedex-container');
const searchInput = document.getElementById('search-input');
const searchButton = document.getElementById('search-button');
const prevButton = document.getElementById('prev-button');
const nextButton = document.getElementById('next-button');
const pageInfo = document.getElementById('page-info');
const typeFilter = document.getElementById('type-filter');
const generationFilter = document.getElementById('generation-filter');
const attributeFilter = document.getElementById('attribute-filter');
const resetFiltersButton = document.getElementById('reset-filters');
const modal = document.getElementById('pokemon-modal');
const closeModal = document.getElementById('close-modal');
const modalContentContainer = document.getElementById('modal-content-container');
const themeSwitch = document.getElementById('theme-switch');

// Configuración de la paginación
let currentPage = 1;
const pokemonsPerPage = 20;
let filteredPokemons = [];

// Inicialización
document.addEventListener('DOMContentLoaded', () => {
    // Inicializar filteredPokemons con todos los Pokémon
    filteredPokemons = [...pokemonsData];
    
    // Cargar Pokémon
    loadPokemons(currentPage);
    
    // Eventos
    searchButton.addEventListener('click', applyFilters);
    searchInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') applyFilters();
    });
    
    prevButton.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            loadPokemons(currentPage);
        }
    });
    
    nextButton.addEventListener('click', () => {
        if (currentPage < Math.ceil(filteredPokemons.length / pokemonsPerPage)) {
            currentPage++;
            loadPokemons(currentPage);
        }
    });
    
    // Eventos para los filtros
    typeFilter.addEventListener('change', applyFilters);
    generationFilter.addEventListener('change', applyFilters);
    if (attributeFilter) {
        attributeFilter.addEventListener('change', applyFilters);
    }
    resetFiltersButton.addEventListener('click', resetFilters);
    
    closeModal.addEventListener('click', () => {
        modal.classList.remove('show');
    });
    
    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.classList.remove('show');
        }
    });
    
    // Cambio de tema
    themeSwitch.addEventListener('change', () => {
        document.body.setAttribute('data-theme', themeSwitch.checked ? 'dark' : 'light');
        localStorage.setItem('theme', themeSwitch.checked ? 'dark' : 'light');
    });
    
    // Verificar preferencia de tema guardada
    if (localStorage.getItem('theme') === 'dark') {
        themeSwitch.checked = true;
        document.body.setAttribute('data-theme', 'dark');
    }
});

// Función para cargar Pokémon por página
function loadPokemons(page) {
    pokedexContainer.innerHTML = `
        <div class="loading-container">
            <div class="pokeball-loading">
                <div class="pokeball-loading-inner"></div>
            </div>
            <p>Cargando Pokémon...</p>
        </div>
    `;
    
    setTimeout(() => {
        pokedexContainer.innerHTML = '';
        
        const start = (page - 1) * pokemonsPerPage;
        const end = start + pokemonsPerPage;
        const pokemonsToShow = filteredPokemons.slice(start, end);
        
        if (pokemonsToShow.length === 0) {
            pokedexContainer.innerHTML = '<p class="no-results">No se encontraron Pokémon que coincidan con los filtros.</p>';
        } else {
            pokemonsToShow.forEach(pokemon => {
                createPokemonCard(pokemon);
            });
        }
        
        updatePaginationInfo();
        updatePaginationButtons();
    }, 500);
}

// Función para crear tarjeta de Pokémon
function createPokemonCard(pokemon) {
    const card = document.createElement('div');
    card.className = 'pokemon-card';
    card.setAttribute('data-id', pokemon.id);
    
    // Determinar el color de fondo según el tipo principal
    const type1 = pokemon.type1.toLowerCase();
    
    // Añadir clases adicionales para Pokémon especiales
    if (pokemon.is_legendary) card.classList.add('legendary-pokemon');
    if (pokemon.is_mythical) card.classList.add('mythical-pokemon');
    if (pokemon.is_shiny) card.classList.add('shiny-pokemon');
    
    card.innerHTML = `
        <div class="card-header" style="background: var(--type-${type1})">
            <span class="pokemon-id">#${String(pokemon.id).padStart(3, '0')}</span>
            <img src="${pokemon.sprite_url}" alt="${pokemon.name}" class="pokemon-image">
        </div>
        <div class="card-body">
            <h2 class="pokemon-name">${pokemon.name}</h2>
            <div class="pokemon-types">
                <span class="type-badge type-${type1}">${pokemon.type1}</span>
                ${pokemon.type2 ? `<span class="type-badge type-${pokemon.type2.toLowerCase()}">${pokemon.type2}</span>` : ''}
            </div>
        </div>
    `;
    
    card.addEventListener('click', () => showPokemonDetails(pokemon));
    pokedexContainer.appendChild(card);
}

// Función para mostrar detalles de Pokémon
function showPokemonDetails(pokemon) {
    // Preparar información de categoría
    let categoryInfo = 'Normal';
    if (pokemon.is_legendary) categoryInfo = 'Legendario';
    if (pokemon.is_mythical) categoryInfo = 'Mítico';
    if (pokemon.is_shiny) categoryInfo += ' (Shiny)';

    // Preparar sección de estadísticas si están disponibles
    let statsHTML = '';
    if (pokemon.base_hp !== undefined) {
        statsHTML = `
            <div class="info-section">
                <h3>Estadísticas base</h3>
                <div class="pokemon-stats">
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">HP</span>
                            <span class="stat-value">${pokemon.base_hp}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_hp / 2.55)}%; background-color: #ff5959;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Ataque</span>
                            <span class="stat-value">${pokemon.base_attack}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_attack / 2.55)}%; background-color: #f5ac78;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Defensa</span>
                            <span class="stat-value">${pokemon.base_defense}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_defense / 2.55)}%; background-color: #fae078;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Ataque Esp.</span>
                            <span class="stat-value">${pokemon.base_sp_attack}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_sp_attack / 2.55)}%; background-color: #9db7f5;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Defensa Esp.</span>
                            <span class="stat-value">${pokemon.base_sp_defense}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_sp_defense / 2.55)}%; background-color: #a7db8d;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Velocidad</span>
                            <span class="stat-value">${pokemon.base_speed}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_speed / 2.55)}%; background-color: #fa92b2;"></div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    modalContentContainer.innerHTML = `
        <div class="modal-pokemon-header" style="background: var(--type-${pokemon.type1.toLowerCase()})">
            <span class="modal-pokemon-id">#${String(pokemon.id).padStart(3, '0')}</span>
            <h2 class="modal-pokemon-name">${pokemon.name}</h2>
            <div class="modal-pokemon-types">
                <span class="type-badge type-${pokemon.type1.toLowerCase()}">${pokemon.type1}</span>
                ${pokemon.type2 ? `<span class="type-badge type-${pokemon.type2.toLowerCase()}">${pokemon.type2}</span>` : ''}
            </div>
            <div class="modal-pokemon-image-container">
                <img src="${pokemon.sprite_url}" alt="${pokemon.name}" class="modal-pokemon-image">
            </div>
        </div>
        <div class="modal-pokemon-info">
            <div class="info-section">
                <h3>Información básica</h3>
                <div class="pokemon-details">
                    <div class="detail-item">
                        <span class="detail-label">Altura</span>
                        <span class="detail-value">${pokemon.height ? pokemon.height + ' m' : '? m'}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Peso</span>
                        <span class="detail-value">${pokemon.weight ? pokemon.weight + ' kg' : '? kg'}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Generación</span>
                        <span class="detail-value">${pokemon.generation}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Categoría</span>
                        <span class="detail-value">${categoryInfo}</span>
                    </div>
                </div>
            </div>
            <div class="info-section">
                <h3>Descripción</h3>
                <p class="pokemon-description">${pokemon.description || 'No hay información disponible para este Pokémon.'}</p>
            </div>
            ${statsHTML}
        </div>
    `;
    
    modal.classList.add('show');
}

// Función para aplicar filtros
function applyFilters() {
    const searchTerm = searchInput.value.trim().toLowerCase();
    const selectedType = typeFilter.value.toLowerCase();
    const selectedGeneration = generationFilter.value;
    const selectedAttribute = attributeFilter ? attributeFilter.value : '';
    
    filteredPokemons = pokemonsData.filter(pokemon => {
        // Filtro de búsqueda por nombre o ID
        const searchMatch = !searchTerm || 
                           pokemon.name.toLowerCase().includes(searchTerm) || 
                           pokemon.id.toString() === searchTerm;
        
        // Filtro por tipo
        const typeMatch = !selectedType || 
                         pokemon.type1.toLowerCase() === selectedType || 
                         (pokemon.type2 && pokemon.type2.toLowerCase() === selectedType);
        
        // Filtro por generación
        const generationMatch = !selectedGeneration || 
                               pokemon.generation.toString() === selectedGeneration;
        
        // Filtro por atributo (legendario, mítico, shiny)
        let attributeMatch = true;
        if (attributeFilter && selectedAttribute) {
            if (selectedAttribute === 'legendary') {
                attributeMatch = pokemon.is_legendary;
            } else if (selectedAttribute === 'mythical') {
                attributeMatch = pokemon.is_mythical;
            } else if (selectedAttribute === 'shiny') {
                attributeMatch = pokemon.is_shiny;
            }
        }
        
        // Combinar todos los filtros con operador AND
        return searchMatch && typeMatch && generationMatch && attributeMatch;
    });
    
    currentPage = 1;
    loadPokemons(currentPage);
}

// Función para reiniciar filtros
function resetFilters() {
    searchInput.value = '';
    typeFilter.value = '';
    generationFilter.value = '';
    if (attributeFilter) {
        attributeFilter.value = '';
    }
    
    filteredPokemons = [...pokemonsData];
    currentPage = 1;
    loadPokemons(currentPage);
}

// Función para actualizar información de paginación
function updatePaginationInfo() {
    const totalPages = Math.ceil(filteredPokemons.length / pokemonsPerPage);
    pageInfo.textContent = `Página ${currentPage} de ${totalPages || 1}`;
}

// Función para actualizar botones de paginación
function updatePaginationButtons() {
    const totalPages = Math.ceil(filteredPokemons.length / pokemonsPerPage);
    
    prevButton.disabled = currentPage === 1;
    nextButton.disabled = currentPage === totalPages || totalPages === 0;
}

// Función para aplicar filtros
function applyFilters() {
    const searchTerm = searchInput.value.trim().toLowerCase();
    const selectedType = typeFilter.value.toLowerCase();
    const selectedGeneration = generationFilter.value;
    const selectedAttribute = attributeFilter ? attributeFilter.value : '';
    
    filteredPokemons = pokemonsData.filter(pokemon => {
        // Filtro de búsqueda por nombre o ID
        const searchMatch = !searchTerm || 
                           pokemon.name.toLowerCase().includes(searchTerm) || 
                           pokemon.id.toString() === searchTerm;
        
        // Filtro por tipo
        const typeMatch = !selectedType || 
                         pokemon.type1.toLowerCase() === selectedType || 
                         (pokemon.type2 && pokemon.type2.toLowerCase() === selectedType);
        
        // Filtro por generación
        const generationMatch = !selectedGeneration || 
                               pokemon.generation.toString() === selectedGeneration;
        
        // Filtro por atributo (legendario, mítico, shiny)
        let attributeMatch = true;
        if (attributeFilter && selectedAttribute) {
            if (selectedAttribute === 'legendary') {
                attributeMatch = pokemon.is_legendary;
            } else if (selectedAttribute === 'mythical') {
                attributeMatch = pokemon.is_mythical;
            } else if (selectedAttribute === 'shiny') {
                attributeMatch = pokemon.is_shiny;
            }
        }
        
        // Combinar todos los filtros con operador AND
        return searchMatch && typeMatch && generationMatch && attributeMatch;
    });
    
    currentPage = 1;
    loadPokemons(currentPage);
}

// Función para mostrar detalles de Pokémon
function showPokemonDetails(pokemon) {
    // Preparar información de categoría
    let categoryInfo = 'Normal';
    if (pokemon.is_legendary) categoryInfo = 'Legendario';
    if (pokemon.is_mythical) categoryInfo = 'Mítico';
    if (pokemon.is_shiny) categoryInfo += ' (Shiny)';

    // Preparar sección de estadísticas si están disponibles
    let statsHTML = '';
    if (pokemon.base_hp !== undefined) {
        statsHTML = `
            <div class="info-section">
                <h3>Estadísticas base</h3>
                <div class="pokemon-stats">
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">HP</span>
                            <span class="stat-value">${pokemon.base_hp}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_hp / 2.55)}%; background-color: #ff5959;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Ataque</span>
                            <span class="stat-value">${pokemon.base_attack}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_attack / 2.55)}%; background-color: #f5ac78;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Defensa</span>
                            <span class="stat-value">${pokemon.base_defense}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_defense / 2.55)}%; background-color: #fae078;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Ataque Esp.</span>
                            <span class="stat-value">${pokemon.base_sp_attack}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_sp_attack / 2.55)}%; background-color: #9db7f5;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Defensa Esp.</span>
                            <span class="stat-value">${pokemon.base_sp_defense}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_sp_defense / 2.55)}%; background-color: #a7db8d;"></div>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">
                            <span class="stat-name">Velocidad</span>
                            <span class="stat-value">${pokemon.base_speed}</span>
                        </div>
                        <div class="stat-bar">
                            <div class="stat-fill" style="width: ${Math.min(100, pokemon.base_speed / 2.55)}%; background-color: #fa92b2;"></div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    modalContentContainer.innerHTML = `
        <div class="modal-pokemon-header" style="background: var(--type-${pokemon.type1.toLowerCase()})">
            <span class="modal-pokemon-id">#${String(pokemon.id).padStart(3, '0')}</span>
            <h2 class="modal-pokemon-name">${pokemon.name}</h2>
            <div class="modal-pokemon-types">
                <span class="type-badge type-${pokemon.type1.toLowerCase()}">${pokemon.type1}</span>
                ${pokemon.type2 ? `<span class="type-badge type-${pokemon.type2.toLowerCase()}">${pokemon.type2}</span>` : ''}
            </div>
            <div class="modal-pokemon-image-container">
                <img src="${pokemon.sprite_url}" alt="${pokemon.name}" class="modal-pokemon-image">
            </div>
        </div>
        <div class="modal-pokemon-info">
            <div class="info-section">
                <h3>Información básica</h3>
                <div class="pokemon-details">
                    <div class="detail-item">
                        <span class="detail-label">Altura</span>
                        <span class="detail-value">${pokemon.height ? pokemon.height + ' m' : '? m'}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Peso</span>
                        <span class="detail-value">${pokemon.weight ? pokemon.weight + ' kg' : '? kg'}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Generación</span>
                        <span class="detail-value">${pokemon.generation}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Categoría</span>
                        <span class="detail-value">${categoryInfo}</span>
                    </div>
                </div>
            </div>
            <div class="info-section">
                <h3>Descripción</h3>
                <p class="pokemon-description">${pokemon.description || 'No hay información disponible para este Pokémon.'}</p>
            </div>
            ${statsHTML}
        </div>
    `;
    
    modal.classList.add('show');
}
