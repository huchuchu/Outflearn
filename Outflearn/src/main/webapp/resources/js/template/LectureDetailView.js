var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
var video_data;

$(document).ready(function(){
	
	console.log($(`[src="${tag.src}"]`))
	
	var playlist_url = '';
	
	
    $.ajax({
        type: 'GET',
        url: 'LectureDetailView',
        success: function () {
        	video_data = $('#video_id').val();
        	
        	$('#content-media').html(
        			`<div style="width: 100%; height: 100%; max-width: 900px">
        		   	<div id="lectureyoutube"></div>
        		   </div>`
        	)
        	console.log(video_data)
        	

        	
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
    		playlist = "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=" + playlist + "&part=contentDetails,snippet&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
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
    
    $('#bookmark_group').css({'top': $('#header').height()*2 + $('#content').outerHeight()})
    
    // 메뉴 슬라이드 바
    $('.fa-bars').on('click', function() {
        var sidebar = $('#view_sidebar')
        $(sidebar).toggleClass('visible')
        
        if(sidebar.attr('class').indexOf('visible') != -1) {
            $('#header, #content, #bookmark_group').css({'transition': 'width 0.7s ease', 'width': $('#header').width()-sidebar.width()});
            $('#main').css({'width': $(window).innerWidth() - $('aside').width()})
        } else {
            $('#header, #content, #bookmark_group').css({'width': '100%', 'transition': 'width 0.5s ease'})
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
            		   `<div style="width: 100%; height: 100%; max-width: 900px">
            		   	<div id="lectureyoutube"></div>
            		   </div>`
               )
               
               
				  player = new YT.Player('lectureyoutube', {
				    height: '100%',            
				    width: '100%',             
				    videoId: `${video_data}`,   
				    events: {
				      'onReady': onPlayerReady,               
				      'onStateChange': onPlayerStateChange    
				    },
				  });
				  window.ytplayer = player
				
               
           })
           
          

        },
        error: function (err) {
            alert('callback hell!!!!!')
        }
    })
}

function onYouTubeIframeAPIReady () {
  player = new YT.Player('lectureyoutube', {
    height: '100%',            
    width: '100%',             
    videoId: `${video_data}`,   
    events: {
      'onReady': onPlayerReady,               
      'onStateChange': onPlayerStateChange    
    },
  });
  console.log('test')
  window.ytplayer = player
}


function onPlayerReady (event) {
  console.log('onPlayerReady 실행');
}

var playerState;
function onPlayerStateChange (event) {
  playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
    event.data == YT.PlayerState.PLAYING ? '재생 중' :
    event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
    event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
    event.data == -1 ? '시작되지 않음' : '예외';
  
  collectPlayCount(event.data);
}
var played = false;
function collectPlayCount (data) {
	  
  if (data == YT.PlayerState.PLAYING && played == false) {
        
    played = true;
  }
}

function stopVideo() {
  player.stopVideo();
}
function bookmark() {
  
  $('#bookmark').append(
    `<p><a href="#" class="bookmarktime">${player.getCurrentTime()}</a></p>`
  )
	  $('.bookmarktime').on('click', function() {
    player.loadVideoById({
      'videoId': `${video_data}`,
      'startSeconds': $(this).text()
    })
  })
}