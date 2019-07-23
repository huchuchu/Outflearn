
function main() {

(function () {
   'use strict';
   
  	$('a.page-scroll').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top - 50
            }, 900);
            return false;
          }
        }
      });


    $('body').scrollspy({ 
        target: '.navbar-default',
        offset: 80
    });

	// Hide nav on click
  $(".navbar-nav li a").click(function (event) {
    // check if window is small enough so dropdown is created
    var toggle = $(".navbar-toggle").is(":visible");
    if (toggle) {
      $(".navbar-collapse").collapse('hide');
    }
  });
	
	
    // Nivo Lightbox 
    $('.portfolio-item a').nivoLightbox({
            effect: 'slideDown',  
            keyboardNav: true,                            
        });
		
}());

$('#side_server').on('click', function() {

    if($('#side_server > i').attr('class') == 'fas fa-chevron-right') {
      $('#side_server i').attr('class', 'fas fa-chevron-down')
      $('#side_server_menu').show();
    } else {
      $('#side_server i').attr('class', 'fas fa-chevron-right')
      $('#side_server_menu').hide();
    }
  })

  $('#side_web').on('click', function() {

    if($('#side_web > i').attr('class') == 'fas fa-chevron-right') {
      $('#side_web i').attr('class', 'fas fa-chevron-down')
      $('#side_web_menu').show();
    } else {
      $('#side_web i').attr('class', 'fas fa-chevron-right')
      $('#side_web_menu').hide();
    }
  })

  $('#side_db').on('click', function() {

    if($('#side_db > i').attr('class') == 'fas fa-chevron-right') {
      $('#side_db i').attr('class', 'fas fa-chevron-down')
      $('#side_db_menu').show();
    } else {
      $('#side_db i').attr('class', 'fas fa-chevron-right')
      $('#side_db_menu').hide();
    }
  })

}

main();

var slideIndex = [1,3];
var slideId = ["mySlides1", "mySlides2", "mySlides3", "mySlides4"]
showSlides(1, 0);
showSlides(1, 1);
showSlides(1, 2);
showSlides(1, 3);

function plusSlides(n, no) {
  showSlides(slideIndex[no] += n, no);
}

function showSlides(n, no) {
  var i;
  var x = document.getElementsByClassName(slideId[no]);
  if (n > x.length) {slideIndex[no] = 1}    
  if (n < 3) {slideIndex[no] = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex[no]-1].style.display = "block";  
}

$('.dropdown-menu a.dropdown-toggle').on('click', function(e) {
  if (!$(this).next().hasClass('show')) {
    $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
  }
  var $subMenu = $(this).next(".dropdown-menu");
  $subMenu.toggleClass('show');

  return false;
});

