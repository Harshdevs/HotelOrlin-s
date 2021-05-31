




$('#right-arrow').click(function(){
    var currentSlide=$('.slide.active');
    var nextSlide=currentSlide.next();
    
    
currentSlide.fadeOut(800).removeClass('active');
nextSlide.fadeIn(2200).addClass('active');
    

if(nextSlide.length==0){
    $('.slide').first().fadeIn(2200).addClass('active');
}

});


$('#left-arrow').click(function() {
    var currentSlide=$('.slide.active');
    var prevSlide=currentSlide.prev();

currentSlide.fadeOut(800).removeClass('active');
prevSlide.fadeIn(1800).addClass('active');

if(prevSlide.length==0){
    $('.slide').last().fadeIn(1800).addClass('active');
}

});


    
