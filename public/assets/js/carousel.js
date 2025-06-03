document.addEventListener('DOMContentLoaded', function() {
    // Get all the elements we need
    const carousel = document.querySelector('.carousel-container');
    
    // Check if carousel exists on the page
    if(!carousel) {
        return;
    }
    
    const slides = carousel.querySelectorAll('.carousel-picture');
    const prevButton = document.getElementById('prev');
    const nextButton = document.getElementById('next');
    const indicators = document.getElementById('indicators');
    
    // Keep track of which slide we're on
    let currentSlideNumber = 0;
    
    // Create the dots (one for each slide)
    for(let i = 0; i < slides.length; i++) {
        let dot = document.createElement('div');
        dot.className = 'indicator';
        
        // Make the first dot active
        if(i === 0) {
            dot.className = 'indicator active';
        }
        
        // When a dot is clicked, show that slide
        dot.addEventListener('click', function() {
            showSlide(i);
        });
        
        indicators.appendChild(dot);
    }
    
    // Function to show a specific slide
    function showSlide(slideNumber) {
        // Remove active class from all slides
        for(let i = 0; i < slides.length; i++) {
            slides[i].classList.remove('active');
        }
        
        // Add active class to the current slide
        slides[slideNumber].classList.add('active');
        
        // Update the dots
        let dots = indicators.getElementsByClassName('indicator');
        for(let i = 0; i < dots.length; i++) {
            dots[i].classList.remove('active');
        }
        dots[slideNumber].classList.add('active');
        
        // Update current slide number
        currentSlideNumber = slideNumber;
    }
    
    // Previous button click
    prevButton.addEventListener('click', function() {
        let newSlideNumber;
        if(currentSlideNumber === 0) {
            newSlideNumber = slides.length - 1;
        } else {
            newSlideNumber = currentSlideNumber - 1;
        }
        showSlide(newSlideNumber);
    });
    
    // Next button click
    nextButton.addEventListener('click', function() {
        let newSlideNumber;
        if(currentSlideNumber === slides.length - 1) {
            newSlideNumber = 0;
        } else {
            newSlideNumber = currentSlideNumber + 1;
        }
        showSlide(newSlideNumber);
    });
});

//Réécrit pour une meilleure simplicité de compréhension (pour moi 🙃)