$(document).ready(function() {
	
	$('.reply-update').hide()
	$('.update-complete-btn').hide()
	
	$('.update-btn').on('click', function() {
		console.log('test')
		$('.question-content').hide()
		$('.reply-update').show()
		$(this).hide()
		$(this).parents().children('.update-complete-btn').show()
	})
})