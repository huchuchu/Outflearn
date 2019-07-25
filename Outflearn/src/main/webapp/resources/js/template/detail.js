$(document).ready(function () {
    $('.nav-tabs > li > a').on('click', function() {
        $(this).css({ 'border-bottom': '2px solid #6473ff'});
        $(this).parents().siblings().children().css({ 'border-bottom': ''});
    })
})