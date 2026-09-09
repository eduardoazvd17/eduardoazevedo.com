document.addEventListener('DOMContentLoaded', () => {
    const currentYearEl = document.getElementById('current-year');
    if (currentYearEl) {
        currentYearEl.textContent = new Date().getFullYear();
    }

    setupScrollSpy();
    setupScrollReveal();
    setupBackToTop();
    setupCopyEmailButtons();
});

function setupScrollSpy() {
    const navLinks = document.querySelectorAll('#nav-menu a[data-section]');
    const sections = document.querySelectorAll('main .section');

    if (!navLinks.length || !sections.length) return;

    const linkBySection = {};
    navLinks.forEach(link => {
        linkBySection[link.getAttribute('data-section')] = link;
    });

    function setActiveLink(link) {
        navLinks.forEach(navLink => navLink.classList.remove('active'));
        link.classList.add('active');
    }

    // Ao clicar, o link ativo muda na hora; o observer fica suspenso
    // enquanto o scroll suave até a seção ainda está em andamento.
    let suppressUntil = 0;

    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            setActiveLink(link);
            suppressUntil = Date.now() + 1000;
        });
    });

    const observer = new IntersectionObserver((entries) => {
        if (Date.now() < suppressUntil) return;

        entries.forEach(entry => {
            if (!entry.isIntersecting) return;

            const activeLink = linkBySection[entry.target.id];
            if (!activeLink) return;

            setActiveLink(activeLink);
        });
    }, {
        rootMargin: '-45% 0px -45% 0px',
        threshold: 0
    });

    sections.forEach(section => observer.observe(section));
}

function setupScrollReveal() {
    const revealElements = document.querySelectorAll('.animate-on-scroll');
    if (!revealElements.length) return;

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.15
    });

    revealElements.forEach(element => observer.observe(element));
}

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

    const brandLink = document.getElementById('nav-brand-link');

    if (brandLink) {
        brandLink.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
}

function setupCopyEmailButtons() {
    const copyButtons = document.querySelectorAll('.copy-email-btn');

    copyButtons.forEach(button => {
        button.addEventListener('click', async () => {
            const email = button.getAttribute('data-email');
            const icon = button.querySelector('i');

            try {
                await navigator.clipboard.writeText(email);
                showCopiedFeedback(button, icon);
            } catch (err) {
                console.error('Erro ao copiar email:', err);

                const textArea = document.createElement('textarea');
                textArea.value = email;
                textArea.style.position = 'fixed';
                textArea.style.left = '-999999px';
                document.body.appendChild(textArea);
                textArea.select();

                try {
                    document.execCommand('copy');
                    showCopiedFeedback(button, icon);
                } catch (fallbackErr) {
                    console.error('Erro ao copiar email (fallback):', fallbackErr);
                }

                document.body.removeChild(textArea);
            }
        });
    });
}

function showCopiedFeedback(button, icon) {
    const originalClass = icon.className;
    button.classList.add('copied');
    icon.className = 'fas fa-check';

    setTimeout(() => {
        button.classList.remove('copied');
        icon.className = originalClass;
    }, 2000);
}
