const dropdownButtons = document.querySelectorAll('.dropdown-button');
dropdownButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        const dropdown = button.nextElementSibling;
        dropdown.classList.toggle('hidden');
        event.stopPropagation(); 
    });
});

document.addEventListener('click', (event) => {
    dropdownButtons.forEach(button => {
        const dropdown = button.nextElementSibling;
        if (!dropdown.classList.contains('hidden')) { 
            if (!button.contains(event.target) && !dropdown.contains(event.target)) {
                dropdown.classList.add('hidden');
            }
        }
    });
});
const filterButton = document.getElementById('filterButton');
const filterSidebar = document.getElementById('filterSidebar');
const overlay = document.getElementById('overlay');

filterSidebar.style.transition = 'transform 0.3s ease-in-out';
overlay.style.transition = 'opacity 0.3s ease-in-out';

filterButton.addEventListener('click', () => {
    overlay.style.display = 'block';
    setTimeout(() => {
        overlay.style.opacity = '0.5'; 
    }, 10); 
    filterSidebar.style.transform = 'translateX(0)'; 
});

overlay.addEventListener('click', () => {
    overlay.style.opacity = '0'; 
    setTimeout(() => {
        overlay.style.display = 'none'; 
    }, 300); 
    filterSidebar.style.transform = 'translateX(100%)'; 
});

document.addEventListener('DOMContentLoaded', () => {
    const labels = document.querySelectorAll('label');

    labels.forEach(label => {
        label.addEventListener('click', (event) => {
            const inputId = label.getAttribute('for');
            const inputElement = document.getElementById(inputId);

            if (inputElement) {
                if (inputElement.style.display === 'none' || inputElement.style.display === '') {
                    inputElement.style.display = 'block';
                } else {
                    inputElement.style.display = 'none';
                }
            }
            event.stopPropagation(); 
        });
    });
});



