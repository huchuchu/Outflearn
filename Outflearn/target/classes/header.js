$(document).ready(function () {
	
	$('.server_list').hide()
	
	$('.server, .fa-chevron-right').mouseover(function(){
		$(this).children('.server_list').show()
	})
	
	$('.server, .fa-chevron-right').mouseleave(function(){
		$('.server_list').hide()
	})
	
})

