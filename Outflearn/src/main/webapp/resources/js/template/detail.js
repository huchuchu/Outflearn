$(document).ready(function () {
	
    rating_star($('#rating').val())
    
	var _class_num = $('#selectone').val()
	var playlist = '';
	var playlist_id = '';
	if($('.nav-tabs > li > a').text().indexOf('대쉬보드') != -1) {
		$(".nav-tabs > li > a:contains('대쉬보드')").css({ 'border-bottom': '2px solid #6473ff' });
		$.ajax({
			type: 'GET',
			url: 'DetailDashBoard',
			success: function(play_id) {
				console.log(play_id)
				playlist_id = play_id
				playlist = "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=" + play_id + "&part=contentDetails,snippet&maxResults=11&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
				Dashboard(playlist, playlist_id);
			},
			error: function(err) {
				console.log('실패!!')
			}
		})
	}
	


    $('.nav-tabs > li > a').on('click', function () {
        $(this).css({ 'border-bottom': '2px solid #6473ff' })
        $(this).parents().siblings().children().css({ 'border-bottom': '' });
        if ($(this).text() == '대쉬보드') {
            Dashboard(playlist, playlist_id)
        } else if ($(this).text() == '강좌소개') {
            LectureIntro(playlist)
        } else if ($(this).text() == '질문&답변') {
            ReviewAnswer()
        } else {
            $('#page-switch').html('ghi');
        }
    })
    
    $('#main, #page-switch').css({'width': '75%'})
    $('#box').css({'top': $('#menu').height() * 2})
    
    $("#modal-btn").click(function(){
        $("#myModal3").modal({backdrop: "static"});
    });
    
    $('.reply_group').hide()
    ReviewReply()
})

function Dashboard(video_list, playlist_id) {
	$.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: video_list,
        success: function (vi_list) {
        	$('#jumbo_row > img').attr('src', vi_list.items[0].snippet.thumbnails.high.url)
        	
        	
        	
        	var count = 0;
        	var timer = 0;
        	var hour = 0;
        	var min = 0;
        	var sec = 0;
        	
            $('#page-switch').empty()
            $('#page-switch').append(
                "<div class='page-header'><h1>유튜브</h1></div>" + 
                "<div class='table-responsive-lg'>" + 
                "<table class='table'>" +
                "<tr class='text-center'>" + 
                "<th>youtube title</th>" +
                "<th>startAt</th>" +
                "<th>endAt</th>" +
                "<th>regdate</th>" +
                "</tr>"
            )
            for (var i = 0; i < vi_list.items.length; i++) {

            	count++;
            	
                var video_title = vi_list.items[i].snippet.title;
                var video_id = vi_list.items[i].snippet.resourceId.videoId;
                var duration = getVideos(video_id);

                $('.table').append(
                    `<tr class='youtube_data'>
                    	<td><i class=\"far fa-clock\"></i></td>
                    	<td><a href='LectureDetailView?DATA_DATA=${video_id}'>${video_title}</a></td>
                    	<td>${duration}</td>
                    	<td>${duration}</td>`
                );
                
                min += parseInt(duration.split(' : ')[0]);
                sec += parseInt(duration.split(' : ')[1]);
                
                if(min > 59) {
                	hour ++;
                	min -= 60;
                }
                
                if(sec > 59) {
                	min ++;
                	sec = sec - 60;
                }
            }
            
            if(isNaN(sec) && isNaN(min)) {
            	timer = "총 " + hour + "시간 ";
            } else if(isNaN(sec) || isNaN(min)) {
            	if(isNaN(sec)) {
            		timer = "총 " + hour + "시간 " +  min + "분 ";
            	} else {
            		timer = "총 " + hour + "시간 " + sec + "초";
            	}
            } else {
            	timer = "총 " + hour + "시간 " +  min + "분 " + sec + "초";
            }
            
            $('#count').html(`${count} 개 수업`)
            $('#timer').html(`${timer}`)
            $('#page-switch').append("</table></div>")

        	$('#jumbo_row > img').attr('src', vi_list.items[0].snippet.thumbnails.high.url)
        	
        	
            var video_id = vi_list.items[5].snippet.resourceId.videoId
            console.log(vi_list.items[0].contentDetails.endAt)
        	
        	$('#page-switch').html(
        			`<iframe id="player" type="text/html" style="width: 100%; height: 100%; max-width: 900px;"
                    src="http://www.youtube.com/embed/${video_id}?end=61&enablejsapi=1&origin=http://example.com"
                    frameborder="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" 
                    msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>`
        	)
                
        },
        error: function (err) {
            alert('callback hell!!!!!');
        }
    })
}

function LectureIntro(video_list) {
	$.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: video_list,
        success: function (vi_list) {

        	$('#jumbo_row > img').attr('src', vi_list.items[0].snippet.thumbnails.high.url)
        	
        	
            var video_id = vi_list.items[5].snippet.resourceId.videoId
            console.log(vi_list.items[0].contentDetails.endAt)
        	
        	$('#page-switch').html(
        			`<iframe id="player" type="text/html" style="width: 100%; height: 100%; max-width: 900px;"
                    src="http://www.youtube.com/embed/${video_id}?end=61&enablejsapi=1&origin=http://example.com"
                    frameborder="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" 
                    msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>`
        	)
                
        },
        error: function (err) {
            alert('callback hell!!!!!');
        }
    })
}

function ReviewAnswer() {
	$('#page-switch').html(
		`<div class="modal fade" id="myModal3" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">×</button>
		          <h4 class="modal-title">Static Backdrop</h4>
		        </div>
		        <div class="modal-body">
		          <p>You cannot click outside of this modal to close it.</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>`
	)
}

function getVideos(video_id) {
    var video = "https://www.googleapis.com/youtube/v3/videos?id= " + video_id + "&part=contentDetails&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
    var duration = '';
    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        async: false,
        url: video,
        success: function (video_data) {
            var duration_split = video_data.items[0].contentDetails.duration.split('PT', 2)[1];
            duration = splitTime(duration_split)
        },
        error: function (err) {
            alert("callback hell!!!!!")
        }
    })
    return duration;
}

function splitTime(duration) {
    var splitDu = duration;

    if (splitDu.indexOf('H') != -1) {
        splitDu = splitDu.replace('H', ' : ')
        splitDu = splitDu.replace('M', ' : ')
        splitDu = splitDu.replace('S', '')
        return splitDu;
    } else if (splitDu.indexOf('H') == -1 && splitDu.indexOf('M') != -1) {
        splitDu = splitDu.replace('M', ' : ')
        splitDu = splitDu.replace('S', '')
        return splitDu;
    } else if (splitDu.indexOf('H') == -1 && splitDu.indexOf('M') == -1 && splitDu.indexOf('S') != -1) {
        splitDu = splitDu.replace('S', '')
        return splitDu;
    }
}

function rating_star(rating) {
	if(rating >= 0 && rating < 0.5) {
		return $('#rating-tag').prepend(`<span><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="fas fa-star-half-alt"></i></span>`)
	} else if(rating >= 0.5 && rating < 1) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 1 && rating < 1.5) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 1.5 && rating < 2) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 2 && rating < 2.5) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 2.5 && rating < 3) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 3 && rating < 3.5) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 3.5 && rating < 4) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></span>`)
	} else if(rating >= 4 && rating < 4.5) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></span>`)
	} else if(rating >= 4.5 && rating <= 5) {
		return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>`)
	} else {
		return $('#rating-tag').prepend(`별점 없음.`)
	}
}

function ReviewReply() {
	
	$('.ReviewReply').on('click', function() {
		$(this).parents('tr').next().toggle();
		
	})
		
}
