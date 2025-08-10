let index = 0;

function showSlides() {
    let slides = document.getElementsByClassName("mySlides");

    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    index++;
    if (index > slides.length) { index = 1; }

    slides[index - 1].style.display = "block";
    setTimeout(showSlides, 4000);
}

window.onload = showSlides;