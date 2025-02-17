let slideIndex = 0;
const slides = document.querySelectorAll(".slide");
const totalSlides = slides.length;
const prevButton = document.querySelector(".prev");
const nextButton = document.querySelector(".next");
let slideInterval; 

function showSlides(index) {
    slides.forEach((slide) => {
        slide.style.display = "none";
        slide.style.opacity = "0"; 
    });

    slides[index].style.display = "block";
    slides[index].style.opacity = "1"; 
}

function nextSlide() {
    slideIndex = (slideIndex + 1) % totalSlides;
    showSlides(slideIndex);
    resetTimer();
}

function prevSlide() {
    slideIndex = (slideIndex - 1 + totalSlides) % totalSlides;
    showSlides(slideIndex);
    resetTimer();
}

function resetTimer() {
    clearInterval(slideInterval);
    slideInterval = setInterval(nextSlide, 3000); 
}

prevButton.addEventListener("click", prevSlide);
nextButton.addEventListener("click", nextSlide);


showSlides(slideIndex);  
resetTimer(); 
