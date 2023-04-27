var slider = document.getElementById("slider");
var slideIndex = 0;
var dots = document.getElementsByClassName("dots")[0].getElementsByTagName("span");

function showSlides() {
	var slides = slider.getElementsByTagName("ul")[0].getElementsByTagName("li");
	for (var i = 0; i < slides.length; i++) {
		slides[i].style.transform = "translateX(-" + (slideIndex * 320) + "px)"; /* 300 + 20 margin-right */
	}
	for (var i = 0; i < dots.length; i++) {
		dots[i].classList.remove("active");
	}
	dots[slideIndex].classList.add("active");
}

showSlides();

function slideNext() {
	if (slideIndex < 4) {
		slideIndex++;
	} else {
		slideIndex = 0;
	}
	showSlides();
}

function slidePrev() {
	if (slideIndex > 0) {
		slideIndex--;
	} else {
		slideIndex = 4;
	}
	showSlides();
}

function slideTo(index) {
	slideIndex = index;
	showSlides();
}

var intervalId = setInterval(slideNext, 3000);

for (var i = 0; i < dots.length; i++) {
	dots[i].addEventListener("click", function() {
		clearInterval(intervalId);
		slideTo(Array.prototype.indexOf.call(this.parentNode.children, this));
		intervalId = setInterval(slideNext, 3000);
	});
}

slider.addEventListener("mouseenter", function() {
	clearInterval(intervalId);
});

slider.addEventListener("mouseleave", function() {
	intervalId = setInterval(slideNext, 3000);
});

document.getElementsByClassName("prev")[0].addEventListener("click", function() {
	clearInterval(intervalId);
	slidePrev();
	intervalId = setInterval(slideNext, 3000);
});

document.getElementsByClassName("next")[0].addEventListener("click", function() {
	clearInterval(intervalId);
	slideNext();
	intervalId = setInterval(slideNext, 3000);
});
