$(document).ready(function() {
	
	$('.reply-update').hide()
	$('.update-complete-btn').hide()
	
	$('.update-btn').on('click', function() {
		$(this).parents('div.question_content').children('.question-content').hide()
		$(this).parents().children('.update-complete-btn').children('.reply-update').show()
		$(this).hide()
		$(this).parents().children('.update-complete-btn').show()
	})
})