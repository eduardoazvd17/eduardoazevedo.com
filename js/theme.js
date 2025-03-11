/**
 * theme.js - Gerenciamento de tema
 * Portfólio de Eduardo Azevedo
 */

document.addEventListener('DOMContentLoaded', () => {
    // Inicializar tema
    initTheme();

    // Configurar eventos dos botões de tema
    setupThemeButtons();
});

/**
 * Inicializa o tema com base na preferência salva ou padrão do sistema
 */
function initTheme() {
    // Verificar se há tema salvo
    const savedTheme = localStorage.getItem('theme');

    if (savedTheme) {
        applyTheme(savedTheme);
    } else {
        // Se não houver tema salvo, usar o padrão do sistema
        applyTheme('system');
    }
}

/**
 * Aplica um tema específico
 * @param {string} theme - O tema a ser aplicado ('light', 'dark' ou 'system')
 */
function applyTheme(theme) {
    // Salvar no localStorage
    localStorage.setItem('theme', theme);

    const themeIcons = {
        light: 'fa-sun',
        dark: 'fa-moon',
        system: 'fa-laptop'
    };

    // Atualizar ícone no botão de alternância
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        const icon = themeToggle.querySelector('i');
        if (icon) {
            // Remover todas as classes de ícones possíveis
            Object.values(themeIcons).forEach(iconClass => {
                icon.classList.remove(iconClass);
            });

            // Adicionar a classe de ícone correta
            icon.classList.add(themeIcons[theme]);
        }
    }

    // Atualizar os botões de tema na modal
    updateThemeButtons(theme);

    // Aplicar tema ao body
    if (theme === 'system') {
        // Remover atributo para usar preferência do sistema
        document.body.removeAttribute('data-theme');

        // Verificar preferência do sistema
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        const systemTheme = prefersDark ? 'dark' : 'light';
        document.documentElement.setAttribute('data-theme-system', systemTheme);
    } else {
        // Definir tema explicitamente
        document.body.setAttribute('data-theme', theme);
        document.documentElement.removeAttribute('data-theme-system');
    }
}

/**
 * Atualiza os botões de tema na modal
 * @param {string} activeTheme - O tema ativo
 */
function updateThemeButtons(activeTheme) {
    const themeButtons = document.querySelectorAll('.theme-option');

    themeButtons.forEach(button => {
        const buttonTheme = button.getAttribute('data-theme');

        if (buttonTheme === activeTheme) {
            button.classList.add('active');
        } else {
            button.classList.remove('active');
        }
    });
}

/**
 * Configura os eventos dos botões de tema
 */
function setupThemeButtons() {
    const themeButtons = document.querySelectorAll('.theme-option');

    themeButtons.forEach(button => {
        button.addEventListener('click', () => {
            const theme = button.getAttribute('data-theme');
            applyTheme(theme);

            // Fechar modal
            const modal = button.closest('.modal');
            if (modal) {
                modal.classList.remove('active');
            }
        });
    });

    // Detectar mudanças na preferência do sistema
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', e => {
        // Se o tema atual for 'system', atualizar para a nova preferência
        if (localStorage.getItem('theme') === 'system') {
            const systemTheme = e.matches ? 'dark' : 'light';
            document.documentElement.setAttribute('data-theme-system', systemTheme);
        }
    });
} 