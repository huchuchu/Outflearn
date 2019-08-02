document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        defaultView: 'dayGridMonth',
        defaultDate: '2019-07-07',
        eventLimit: true,
        views: {
            timeGrid: {
                eventLimit: 5
            }
        },
        eventRender: function(info) {
            var tooltip = new Tooltip(info.el, {
              title: info.event.extendedProps.description,
              placement: 'top',
              trigger: 'hover',
              container: '#calendar'
            });
          },
//        eventClick: function (info) {
//            var tooltip = new Tooltip(info.el, {
//                title: info.event.title,
//                placement: 'top',
//                trigger: 'hover',
//                container: 'body'
//            });
//            console.log('Title: ', info.event.title);
//            console.log('Id: ', info.event.id);
//            console.log('Coordinates: ' + info.jsEvent.pageX + ', ' + info.jsEvent.pageY);
//            console.log('View: ' + info.view.type);
//        },
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: [
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
                groupId: '999',
                title: 'Repeating Event',
                start: '2019-07-09T16:00:00'
            },
            {
                groupId: '999',
                title: 'Repeating Event',
                start: '2019-07-16T16:00:00'
            },
            {
                title: 'Conference',
                start: '2019-07-11',
                end: '2019-07-13'
            },
            {
                title: 'Meeting',
                start: '2019-07-12T10:30:00',
                end: '2019-07-12T12:30:00'
            },
            {
                title: 'Lunch',
                start: '2019-07-12T12:00:00'
            },
            {
                title: 'Meeting',
                start: '2019-07-12T14:30:00'
            },
            {
                title: 'Birthday Party',
                start: '2019-07-13T07:00:00'
            },
            {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2019-07-28'
            }
        ],
    });

    calendar.render();
});