/**
 * main.js - Funcionalidades principais
 * Portfólio de Eduardo Azevedo
 */

document.addEventListener('DOMContentLoaded', () => {
    // Definir ano atual no rodapé
    const currentYearEl = document.getElementById('current-year');
    if (currentYearEl) {
        currentYearEl.textContent = new Date().getFullYear();
    }

    // Navegação por abas
    setupTabNavigation();

    // Configurar FAB (Floating Action Button)
    setupFAB();

    // Configurar modais
    setupModals();

    // Configurar formulário de contato
    setupContactForm();

    // Configurar botão de voltar ao topo
    setupBackToTop();

    // Adicionar efeito de flip para a imagem de perfil
    setupProfileImageFlip();
});

/**
 * Configura a navegação por abas
 */
function setupTabNavigation() {
    const navLinks = document.querySelectorAll('#nav-menu a');
    const sections = document.querySelectorAll('.section');

    // Configurar navegação inicial com base na URL
    const hash = window.location.hash;
    if (hash) {
        const targetSection = document.querySelector(hash);
        if (targetSection) {
            sections.forEach(section => section.classList.remove('active'));
            targetSection.classList.add('active');

            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === hash) {
                    link.classList.add('active');
                }
            });
        }
    }

    // Configurar navegação ao clicar nos links
    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('href');
            const targetSection = document.querySelector(targetId);

            if (targetSection) {
                // Atualizar classes ativas
                sections.forEach(section => section.classList.remove('active'));
                targetSection.classList.add('active');

                navLinks.forEach(link => link.classList.remove('active'));
                link.classList.add('active');

                // Atualizar URL sem recarregar a página
                history.pushState(null, null, targetId);

                // Scroll suave para o topo
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Lidar com a navegação de volta/avançar do navegador
    window.addEventListener('popstate', () => {
        const hash = window.location.hash;
        if (hash) {
            const targetSection = document.querySelector(hash);
            if (targetSection) {
                sections.forEach(section => section.classList.remove('active'));
                targetSection.classList.add('active');

                navLinks.forEach(link => {
                    link.classList.remove('active');
                    if (link.getAttribute('href') === hash) {
                        link.classList.add('active');
                    }
                });
            }
        }
    });
}

/**
 * Configurar botão de ação flutuante
 */
function setupFAB() {
    const fabMain = document.getElementById('fab-main');
    const settingsFab = document.querySelector('.settings-fab');
    const themeToggle = document.getElementById('theme-toggle');
    const languageToggle = document.getElementById('language-toggle');
    const themeModal = document.getElementById('theme-modal');
    const languageModal = document.getElementById('language-modal');

    if (fabMain && settingsFab) {
        fabMain.addEventListener('click', () => {
            settingsFab.classList.toggle('active');
        });

        // Fechar FAB ao clicar fora
        document.addEventListener('click', (e) => {
            if (settingsFab.classList.contains('active') &&
                !settingsFab.contains(e.target)) {
                settingsFab.classList.remove('active');
            }
        });

        // Configurar botões do FAB
        if (themeToggle && themeModal) {
            themeToggle.addEventListener('click', () => {
                themeModal.classList.add('active');
                settingsFab.classList.remove('active');
            });
        }

        if (languageToggle && languageModal) {
            languageToggle.addEventListener('click', () => {
                languageModal.classList.add('active');
                settingsFab.classList.remove('active');
            });
        }
    }
}

/**
 * Configurar modais
 */
function setupModals() {
    const modals = document.querySelectorAll('.modal');
    const closeButtons = document.querySelectorAll('.close-modal');

    // Fechar modais ao clicar no botão de fechar
    closeButtons.forEach(button => {
        button.addEventListener('click', () => {
            const modal = button.closest('.modal');
            if (modal) {
                modal.classList.remove('active');
            }
        });
    });

    // Fechar modais ao clicar fora
    modals.forEach(modal => {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.remove('active');
            }
        });
    });

    // Fechar modais com tecla ESC
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            modals.forEach(modal => {
                modal.classList.remove('active');
            });
        }
    });
}

/**
 * Configurar formulário de contato
 */
function setupContactForm() {
    const contactForm = document.getElementById('contact-form');
    const clearFormButton = document.getElementById('clear-form');
    const subjectInput = document.getElementById('subject');
    const messageInput = document.getElementById('message');

    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const subject = subjectInput.value.trim();
            const message = messageInput.value.trim();

            if (subject && message) {
                const mailtoLink = `mailto:eduardoazvd17@gmail.com?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(message)}`;
                window.location.href = mailtoLink;
                clearForm();
            }
        });
    }

    if (clearFormButton) {
        clearFormButton.addEventListener('click', clearForm);
    }

    function clearForm() {
        if (subjectInput) subjectInput.value = '';
        if (messageInput) messageInput.value = '';
    }
}

/**
 * Configurar botão de voltar ao topo
 */
function setupBackToTop() {
    const backToTopBtn = document.getElementById('back-to-top-btn');

    if (backToTopBtn) {
        backToTopBtn.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
}

/**
 * Configurar efeito de flip para a imagem de perfil
 */
function setupProfileImageFlip() {
    const profileImg = document.getElementById('profile-img');

    if (profileImg) {
        profileImg.addEventListener('mouseenter', () => {
            profileImg.style.transform = 'scaleX(-1)';
        });

        profileImg.addEventListener('mouseleave', () => {
            profileImg.style.transform = 'scaleX(1)';
        });
    }
} 