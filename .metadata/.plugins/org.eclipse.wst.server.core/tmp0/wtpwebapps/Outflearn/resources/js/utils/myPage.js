function selectOptionBuild(data) {

    var html = `<p>강좌 선택: <select id="configRoom">`;

    data.forEach(item => {
        html += `<option value="${item.class_num}">${item.class_title}</option>`
    })
    html += '</select></p>'
    return html
}

$(function () {
    $('.configLiveRoom').on('click', function () {
        $.ajax({
            url: 'getMyClass',
            success: function (data) {
                console.log(data);
                Swal.fire({
                    title: '간단하게 방 설정하기',
                    html: selectOptionBuild(data),
                    allowOutsideClick: false,
                    showCancelButton: true,
                    showCloseButton: true
                })
                    .then((result) => {
                        if (result.value) {
                        	var room = $('#configRoom').val()
                        	console.log($('#configRoom').val())
                            location.href = `casterRoom?room=${room}`
                        }
                    })
            },
            error: function (err) {
                Swal.fire({
                    type: 'error',
                    title: 'Ooops...',
                    text: '혹시 만드신 강의가 없으신가요?',
                    footer: '강의 만들기'
                })
            }
        })
    })
})