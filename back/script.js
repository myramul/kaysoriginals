let slideIndex = 0;
const slides = document.querySelectorAll(".slide");
const totalSlides = slides.length;
const prevButton = document.querySelector(".prev");
const nextButton = document.querySelector(".next");

function showSlides(index) {
    slides.forEach((slide) => {
        slide.style.opacity = "0";
        slide.classList.remove("active");
    });

    slides[index].classList.add("active");
    slides[index].style.opacity = "1";
}

function nextSlide() {
    slideIndex = (slideIndex + 1) % totalSlides;
    showSlides(slideIndex);
}

function prevSlide() {
    slideIndex = (slideIndex - 1 + totalSlides) % totalSlides;
    showSlides(slideIndex);
}


prevButton.addEventListener("click", prevSlide);
nextButton.addEventListener("click", nextSlide);


setInterval(nextSlide, 4000);


showSlides(slideIndex);
