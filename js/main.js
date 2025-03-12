document.addEventListener('DOMContentLoaded', () => {
    document.body.setAttribute('data-theme', 'dark');

    const currentYearEl = document.getElementById('current-year');
    if (currentYearEl) {
        currentYearEl.textContent = new Date().getFullYear();
    }

    setupTabNavigation();
    setupFAB();
    setupModals();
    setupContactForm();
    setupBackToTop();
    setupProfileImageFlip();
    setupMobileMenu();
});

/**
 * Configura a navegação por abas
 */
function setupTabNavigation() {
    const navLinks = document.querySelectorAll('#nav-menu a');
    const sections = document.querySelectorAll('.section');

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

    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('href');
            const targetSection = document.querySelector(targetId);

            if (targetSection) {
                sections.forEach(section => section.classList.remove('active'));
                targetSection.classList.add('active');

                navLinks.forEach(link => link.classList.remove('active'));
                link.classList.add('active');

                history.pushState(null, null, targetId);

                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }
        });
    });

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
 * Configurar botão de seleção de idioma
 */
function setupFAB() {
    const languageToggle = document.getElementById('language-toggle');
    const languageModal = document.getElementById('language-modal');

    if (languageToggle && languageModal) {
        languageToggle.addEventListener('click', () => {
            languageModal.classList.add('active');
        });
    }
}

/**
 * Configurar modais
 */
function setupModals() {
    const modals = document.querySelectorAll('.modal');
    const closeButtons = document.querySelectorAll('.close-modal');

    closeButtons.forEach(button => {
        button.addEventListener('click', () => {
            const modal = button.closest('.modal');
            if (modal) {
                modal.classList.remove('active');
            }
        });
    });

    modals.forEach(modal => {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.remove('active');
            }
        });
    });

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

/**
 * Configurar o comportamento do menu para ficar fixo após o scroll
 * Funciona em todas as resoluções (desktop e mobile)
 */
function setupMobileMenu() {
    const header = document.querySelector('.hero-section');
    const menu = document.getElementById('nav-menu');

    if (header && menu) {
        const menuHeight = menu.offsetHeight;

        function checkScroll() {
            if (window.pageYOffset > header.offsetHeight) {
                menu.style.position = 'fixed';
                menu.style.top = '0';
                menu.style.left = '0';
                menu.style.width = '100%';

                document.body.style.paddingTop = menuHeight + 'px';
            } else {
                menu.style.position = 'static';
                document.body.style.paddingTop = '0';
            }
        }

        window.addEventListener('scroll', checkScroll);
        window.addEventListener('resize', checkScroll);

        checkScroll();
    }
} 