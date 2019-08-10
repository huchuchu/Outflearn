document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = document.getElementById('calendar');

    /*
    Array(1)
    0: { live_num: 1, class_num: 1, live_title: "TEST페이지", live_author: "TEST강사", live_time: "2019-08-15" }
    length: 1
    __proto__: Array(0)
    {
        id: 'test',
            title: 'All Day Event',
                description: 'asdf',
                    start: '2019-07-01',
                        color: 'yellow',
            },
    {
        title: 'Long Event',
            start: '2019-07-07',
                end: '2019-07-10',
                    description: 'asdf',
            },
    {
        title: 'Click for Google',
            url: 'http://google.com/',
                start: '2019-07-28'
    }

*/
    var _events = []

    $.ajax({
        url: `liveCalendar`,
        method: 'get',
        success: function (data) {
            data.forEach(item => {
                _events.push({
                    id: item.live_num,
                    title: item.live_title,
                    start: item.live_time
                })
            });

            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: ['interaction', 'dayGrid', 'timeGrid'],
                defaultView: 'dayGridMonth',
                defaultDate: '2019-08-07',
                eventLimit: true,
                views: {
                    timeGrid: {
                        eventLimit: 5
                    }
                },
                /*
                    class_author: "강사명"
                    class_category: "카테고리"
                    class_intro: "강좌소개"
                    class_live: "Y"
                    class_num: 1
                    class_price: 0
                    class_rating: 0
                    class_studentlevel: "상급자"
                    class_subcount: 0
                    class_title: "제목"
                    */

                eventClick: function (info) {
                    $.ajax({
                        url: `livePopup?live_num=${info.event.id}`,
                        method: 'get',
                        success: function (data) {
                            if (data) {
                                Swal.fire({
                                    title: data.class_title,
                                    html:
                                        `
                                    <p>강좌소개 : ${data.class_intro}</p>
                                    <p>가격 : ${data.class_price}</p>
                                    <button onclick="wishClass(${data.class_num})">찜하기</button>
                                    <button onclick="buyClass(${data.class_num})">구매하기</button>
                                    `
                                })
                            } else {
                                Swal.fire({
                                    title: '<strong>Live Only</strong>',
                                    type: 'info'
                                })
                            }
                        },
                        error: function (err) {
                            console.log(err)
                        }
                    })
                },
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                events: _events
            });

            calendar.render();

        },
        error: function (err) {
            alert(err)
        }
    })
});

function wishClass(class_num) {
    $.ajax({
        url: `addWishClass?class_num=${class_num}`,
        method: 'get',
        success: function (data) {
            console.log(data);
        },
        error: function (err) {
            console.log(err);
        }
    })
}

function buyClass() {

}
