var count_sum = 0
var hour_sum = 0
var minite_sum = 0
var second_sum = 0

$(document).ready(function () {

    rating_star($('#rating').val())

    var _class_num = $('#selectone').val()
    var playlist = ''
    var playOne = new Array()
    var playlist_id = new Array()
    
    if ($('.nav-tabs > li > a').text().indexOf('대쉬보드') != -1) {
        $(".nav-tabs > li > a:contains('대쉬보드')").css({ 'border-bottom': '2px solid #6473ff' });
        $.ajax({
            type: 'GET',
            url: 'DetailDashBoard',
            success: function (play_id) {
            	DashboardHeader()
            
                for(var i = 0; i < play_id.length; i++) {
                	
                	if(play_id[i].indexOf("v=") != -1){
                		
                		play_id[i] = play_id[i].split('v=', 2)[1]
	                	playOne[i] = play_id[i]
                		playlist = "https://www.googleapis.com/youtube/v3/videos?id= " + play_id[i] + "&part=contentDetails,snippet&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
	                	DashboardOne(playlist, playOne[i])
	                	
                	} else if(play_id[i].indexOf("list") != -1) {
                		
                		play_id[i] = play_id[i].split('list=', 2)[1]
                		playlist_id[i] = play_id[i]
                		playlist = "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=" + play_id[i] + "&part=contentDetails,snippet&maxResults=5&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
	                	DashboardList(playlist, playlist_id[i])
	                	
                	}
                }
            },
            error: function (err) {
                console.log('실패!!')
            }
        })
    }

    console.log($('div#main nav li a.selected').attr('href'))
    $('div#page-switch > div:not(' + $('div#main nav li a.selected').attr('href') + ')').hide()

    $('.nav-tabs > li > a').on('click', function () {

        $(this).css({ 'border-bottom': '2px solid #6473ff' })
        $(this).parents().siblings().children().css({ 'border-bottom': '' })

        $('div#main nav li a').removeClass('selected')
        $(this).addClass('selected')
        $('div#page-switch > div').hide()
        $($(this).attr('href')).show()

        console.log($(this).attr('href') + " : this attr href")

        if ($(this).text() == '대쉬보드') {
        	DashboardHeader()
        } else if ($(this).text() == '질문&답변') {
            ReviewAnswer()
        }
    })

    $('#main, #dashboard').css({ 'width': '75%' })
    $('#box').css({ 'top': $('#menu').height() * 2 })

    $('.reply_group').hide()
    ReviewReply()

    $("#Question-btn").on('click', function () {
        $("#QuestionForm").modal({ backdrop: "static" })
    });
})

function DashboardHeader() {
	$('#dashboard').empty()
	$('#dashboard').html(
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
}

function DashboardOne(video_list, playlist_id) {
	$.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: video_list,
        success: function (vi_list) {
        	console.log(video_list, ' : ')

        	var count = 0;
        	var timer = 0;
        	var hour = 0;
        	var min = 0;
        	var sec = 0;
        	
        	var video_id = vi_list.items[0].id;
        	var video_title = vi_list.items[0].snippet.title
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
            
            hour_sum = hour_sum + hour
            minite_sum = minite_sum + min
            second_sum = second_sum + sec
        
        count_sum = count_sum + count
        
        $('#count').html(`${count_sum} 개 수업`)
        $('#timer').html(`${timer}`)
        $('#dashboard').append("</table></div>")
        	
            count_sum++

        },
        error: function (err) {
            alert('callback hell!!!!!');
        }
    })
}

function DashboardList(video_list, playlist_id) {
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
                
//                hour_sum = hour_sum + hour
//                minite_sum = minite_sum + min
//                second_sum = second_sum + sec
                
                if(min > 59) {
                	hour_sum ++;
                	min -= 60;
                }
                
                if(sec > 59) {
                	minite_sum ++;
                	sec = sec - 60;
                }
            }
            
            if(isNaN(sec) && isNaN(minite_sum)) {
            	timer = "총 " + hour + "시간 ";
            } else if(isNaN(sec) || isNaN(minite_sum)) {
            	if(isNaN(sec)) {
            		timer = "총 " + hour_sum + "시간 " +  minite_sum + "분 ";
            	} else {
            		timer = "총 " + hour_sum + "시간 " + sec + "초";
            	}
            } else {
            	timer = "총 " + hour_sum + "시간 " +  minite_sum + "분 " + sec + "초";
            }
            
            count_sum = count_sum + count
            
            $('#count').html(`${count_sum} 개 수업`)
            $('#timer').html(`${timer}`)
            $('#dashboard').append("</table></div>")

        },
        error: function (err) {
            alert('callback hell!!!!!');
        }
    })
}

function ReviewAnswer() {
    $('#dashboard').append(
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
    if (rating >= 0 && rating < 0.5) {
        return $('#rating-tag').prepend(`<span><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="fas fa-star-half-alt"></i></span>`)
    } else if (rating >= 0.5 && rating < 1) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 1 && rating < 1.5) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 1.5 && rating < 2) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 2 && rating < 2.5) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 2.5 && rating < 3) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 3 && rating < 3.5) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 3.5 && rating < 4) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></span>`)
    } else if (rating >= 4 && rating < 4.5) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></span>`)
    } else if (rating >= 4.5 && rating <= 5) {
        return $('#rating-tag').prepend(`<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>`)
    } else {
        return $('#rating-tag').prepend(`별점 없음.`)
    }
}

function ReviewReply() {

    $('.ReviewReply').on('click', function () {
        $(this).parents('tr').next().toggle();
    })

}
