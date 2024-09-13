document.querySelector('.select-selected').addEventListener('click', function() {
    this.nextElementSibling.classList.toggle('select-hide');
    this.classList.toggle('select-arrow-active');
});

document.querySelectorAll('.select-items div').forEach(function(item) {
    item.addEventListener('click', function() {
        let selectedText = this.textContent;
        let selectedValue = this.getAttribute('data-value');
        let selectedImage = this.querySelector('img').src;
        
        document.querySelector('.select-selected').textContent = selectedText;
        document.getElementById('preview-image').src = selectedImage;

        this.parentElement.classList.add('select-hide');
        document.querySelector('.select-selected').classList.remove('select-arrow-active');
    });
});

document.addEventListener('click', function(e) {
    if (!e.target.matches('.select-selected')) {
        document.querySelectorAll('.select-items').forEach(function(el) {
            el.classList.add('select-hide');
        });
        document.querySelector('.select-selected').classList.remove('select-arrow-active');
    }
});