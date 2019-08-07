$(document).ready(function() {
	
	$('#side_server_menu').hide();
	$('#side_web_menu').hide();
	$('#side_db_menu').hide();
	
	$('#side_server').on('click', function () {

		if ($('#side_server > i').attr('class') == 'fas fa-chevron-right') {
			$('#side_server i').attr('class', 'fas fa-chevron-down')
			$('#side_server_menu').show();
		} else {
			$('#side_server i').attr('class', 'fas fa-chevron-right')
			$('#side_server_menu').hide();
		}
	})

	$('#side_web').on('click', function () {

		if ($('#side_web > i').attr('class') == 'fas fa-chevron-right') {
			$('#side_web i').attr('class', 'fas fa-chevron-down')
			$('#side_web_menu').show();
		} else {
			$('#side_web i').attr('class', 'fas fa-chevron-right')
			$('#side_web_menu').hide();
		}
	})

	$('#side_db').on('click', function () {
		if ($('#side_db > i').attr('class') == 'fas fa-chevron-right') {
			$('#side_db i').attr('class', 'fas fa-chevron-down')
			$('#side_db_menu').show();
		} else {
			$('#side_db i').attr('class', 'fas fa-chevron-right')
			$('#side_db_menu').hide();
		}

	})
})