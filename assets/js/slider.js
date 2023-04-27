$(document).ready(function() {
  var sliderImages = $(".slider-images");
  var sliderWidth = sliderImages.width() / 3;
  var currentSlide = 0;

  $(".slider-images img").css("width", sliderWidth + "px");

  $(".slider-prev").click(function() {
    currentSlide = currentSlide > 0 ? currentSlide - 1 : 0;
    sliderImages.css("transform", "translateX(-" + currentSlide * sliderWidth + "px)");
  });

  $(".slider-next").click(function() {
    currentSlide = currentSlide < sliderImages.children().length - 3 ? currentSlide + 1 : currentSlide;
    sliderImages.css("transform", "translateX(-" + currentSlide * sliderWidth + "px)");
  });
});
