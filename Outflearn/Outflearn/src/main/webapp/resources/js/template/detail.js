$(document).ready(function () {
	var _class_num = $('#selectone').val()
	var playlist = '';
	if($('#selectone').val() != '') {
		alert('값은 넘어왔다!')
	} else {
		alert('다시다시다시')
	}
	$.ajax({
		type: 'GET',
		data: 'class_num=' + _class_num,
		url: 'DetailDashBoard',
		success: function(play_id) {
			playlist = "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=" + play_id + "&part=contentDetails,snippet&maxResults=11&key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc";
		},
		error: function(err) {
			console.log('실패!!')
		}
	})

    $('.nav-tabs > li > a').on('click', function () {
        $(this).css({ 'border-bottom': '2px solid #6473ff' });
        $(this).parents().siblings().children().css({ 'border-bottom': '' });
        if ($(this).text() == '대쉬보드') {
            
            $.ajax({
                type: 'GET',
                dataType: 'JSON',
                url: playlist,
                success: function (vi_list) {

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

                        var video_title = vi_list.items[i].snippet.title;
                        var video_id = vi_list.items[i].snippet.resourceId.videoId;
                        var duration = getVideos(video_id);

                        $('.table').append(
                            "<tr class='youtube_data'>" + 
                            "<td><i class=\"far fa-clock\"></i></td>" + 
                            "<td><a href='https://www.youtube.com/watch?v=" + video_id + "'>" + video_title + "</a></td>" + 
                            "<td>" + duration + "</td>" + 
                            "<td>" + duration + "</td></tr>"
                        );
                    }

                    $('#page.switch').append("</table></div>")

                },
                error: function (err) {
                    alert('callback hell!!!!!');
                }
            })
        } else if ($(this).text() == '강좌소개') {
            $('#page-switch').html('abc');
        } else if ($(this).text() == '질문&답변') {
            $('#page-switch').html('def');
        } else {
            $('#page-switch').html('ghi');
        }


    })

})
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