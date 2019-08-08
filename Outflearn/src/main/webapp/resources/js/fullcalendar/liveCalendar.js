document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = document.getElementById('calendar');

    // Array(1)
    // 0: { live_num: 1, class_num: 1, live_title: "TEST페이지", live_author: "TEST강사", live_time: "2019-08-15" }
    // length: 1
    // __proto__: Array(0)
    // {
    //     id: 'test',
    //         title: 'All Day Event',
    //             description: 'asdf',
    //                 start: '2019-07-01',
    //                     color: 'yellow',
    //         },
    // {
    //     title: 'Long Event',
    //         start: '2019-07-07',
    //             end: '2019-07-10',
    //                 description: 'asdf',
    //         },
    // {
    //     title: 'Click for Google',
    //         url: 'http://google.com/',
    //             start: '2019-07-28'
    // }
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