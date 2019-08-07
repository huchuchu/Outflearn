$(document).ready(function() {
	
	$('#level').collapse('show')
	$('#charged').collapse('show')
	
	$('#side_server').on('click', function () {

		if ($('#side_server > i').attr('class') == 'fas fa-chevron-right') {
			$('#side_server i').attr('class', 'fas fa-chevron-down')
			$('#side_server_menu').collapse('toggle')
		} else {
			$('#side_server i').attr('class', 'fas fa-chevron-right')
			$('#side_server_menu').collapse('toggle')
		}
	})

	$('#side_web').on('click', function () {

		if ($('#side_web > i').attr('class') == 'fas fa-chevron-right') {
			$('#side_web i').attr('class', 'fas fa-chevron-down')
			$('#side_web_menu').collapse('toggle')
		} else {
			$('#side_web i').attr('class', 'fas fa-chevron-right')
			$('#side_web_menu').collapse('toggle')
		}
	})

	$('#side_db').on('click', function () {
		if ($('#side_db > i').attr('class') == 'fas fa-chevron-right') {
			$('#side_db i').attr('class', 'fas fa-chevron-down')
			$('#side_db_menu').collapse('toggle')
		} else {
			$('#side_db i').attr('class', 'fas fa-chevron-right')
			$('#side_db_menu').collapse('toggle')
		}
	})
	
	$('#level_btn').on('click', function () {
		if ($('#level_btn > i').attr('class') == 'fas fa-chevron-right') {
			$('#level_btn i').attr('class', 'fas fa-chevron-down')
			$('#level').collapse('toggle')
		} else {
			$('#level_btn i').attr('class', 'fas fa-chevron-right')
			$('#level').collapse('toggle')
		}
	})
	
	$('#charged_btn').on('click', function () {
		if ($('#charged_btn > i').attr('class') == 'fas fa-chevron-right') {
			$('#charged_btn i').attr('class', 'fas fa-chevron-down')
			$('#charged').collapse('toggle')
		} else {
			$('#charged_btn i').attr('class', 'fas fa-chevron-right')
			$('#charged').collapse('toggle')
		}
	})
})