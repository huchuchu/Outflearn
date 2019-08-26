$(document).ready(function () {
	
	$('#header').css({'position': 'relative', 'top':$('#menu').outerHeight()})
	$('#menu').css({
		'position': 'relative',
		'margin': '0'
	})
    $(window).scroll(function (event) {
       if ($(window).scrollTop() < 50) {
          $('#menu').css({
             'position': 'relative',
             'margin': '0'
          });
          $('#header').css({'position': 'relative', 'top': '0'})
       } else {
          $('#menu').css({
             'position': 'fixed',
             'z-index': '9999'
          });
       }
    });
	
	$('.server_list').hide()
	
	$('.server, .fa-chevron-right').mouseover(function(){
		$(this).children('.server_list').show()
	})
	
	$('.server, .fa-chevron-right').mouseleave(function(){
		$('.server_list').hide()
	})
	
})

