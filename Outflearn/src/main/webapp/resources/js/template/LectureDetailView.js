$(document).ready(function(){
	
	var playlist_url = '';
    $.ajax({
        type: 'GET',
        url: 'LectureDetailView',
        success: function () {
        	var video_data = $('#video_id').val();
        	$('#content-media').append(
        			`<iframe id="player" type="text/html" style="width: 100%; height: 100%; max-width: 900px;"
                    src="http://www.youtube.com/embed/${video_data}?enablejsapi=1&origin=http://example.com"
                    frameborder="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" 
                    msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>`
        	)
        },
        error: function (err) {
            alert("callback hell!!!!!")
        }
    })
    $.ajax({
    	type: 'GET',
    	dataType: 'TEXT',
    	url: 'LecturePlayList',
    	success: function(playlist) {
    		console.log('성공!!!' + playlist)
    		playlist = "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=" + playlist + "&part=contentDetails,snippet&maxResults=11&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
    		getPlayList(playlist)
    		
    	},
    	error: function(err) {
    		console.log(' 실패!!!')
    	}
    })
	
    $('#side_content_container').css({'height': $(window).height() - $('#side_header_container').height() + 'px'})
    
    $(window).resize(function() {
    	$('#header, #content').css({'width': $(window).innerWidth() - $('aside').width(), 'transition': 'left 0.001s ease'})
    })
    
    $('#content').css({'top': $('#header').height() + 'px'})
    
    $('#content-media').css({'height': $('#content').outerHeight()})
    
    // 메뉴 슬라이드 바
    $('.fa-bars').on('click', function() {
        var sidebar = $('#view_sidebar')
        $(sidebar).toggleClass('visible')
        
        if(sidebar.attr('class').indexOf('visible') != -1) {
            $('#header, #content').css({'transition': 'width 0.7s ease', 'width': $('#header').width()-sidebar.width()});
            $('#main').css({'width': $(window).innerWidth() - $('aside').width()})
        } else {
            $('#header, #content').css({'width': '100%', 'transition': 'width 0.5s ease'})
            $('#main').css({'width': '100%'})
        }
    })
    
})

function getPlayList(video_list) {
	$.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: video_list,
        success: function (vi_list) {

           for(var i = 0; i < vi_list.items.length; i++) {
        	   var video_title = vi_list.items[i].snippet.title
        	   var video = vi_list.items[i].snippet.resourceId.videoId
        	   $('#sidebar').append(
        			   `<li class="list-group-item"><a class="lecturevideo" href="void:0"></a>${video_title}<input type="hidden" class="video_data" value="${video}" /></li>`
        	   );
           }
           $('.list-group-item').on('click', function() {
    		   var video_data = $(this).children('.video_data').val()
    		   $('#content-media').html(
            		   `<iframe id="player" type="text/html" style="width: 100%; height: 100%; max-width: 900px;"
                    src="http://www.youtube.com/embed/${video_data}?enablejsapi=1&origin=http://example.com"
                    frameborder="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" 
                    msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>`
               )
           })
           
          

        },
        error: function (err) {
            alert('callback hell!!!!!')
        }
    })
}