function selectOptionBuild(data) {

    var html = `<p>강좌 선택: <select id="configRoom">`;

    data.forEach(item => {
        html += `<option value="${item.class_num}">${item.class_title}</option>`
    })
    html += '</select></p>'
    return html
}

function resultRes(bool) {
    if (bool) {
        location.reload(true)
    } else {
        Swal.fire({
            type: 'error',
            title: '에러가 발생했습니다.',
            text: 'Q class로 문의 해주세요',
            confirmButtonText: '확인'
        })
            .then((result) => {
                location.reload(true)
            })
    }
}

function acceptReq(user_num) {
    $.ajax({
        url: `acceptReq?user_num=${user_num}`,
        success: function (bool) {
            resultRes(bool)
        },
        error: function (err) {
            console.log(err);
        }
    })
}

function deniReq(user_num) {
    $.ajax({
        url: `deniReq?user_num=${user_num}`,
        success: function (bool) {
            resultRes(bool)
        },
        error: function (err) {
            console.log(err);
        }
    })
}

function userEnabled(user_num) {
    Swal.fire({
        type: 'warning',
        title: '해당 유저를 비활성화 시키시겠습니까?',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancleButtonText: '취소'
    })
        .then((result) => {
            if (result.value) {
                $.ajax({
                    url: `userDisabled?user_num=${user_num}`,
                    success: function (bool) {
                        resultRes(bool)
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        })
}

function userDisabled(user_num) {
    Swal.fire({
        type: 'warning',
        title: '해당 유저를 활성화 시키시겠습니까?',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancleButtonText: '취소'
    })
        .then((result) => {
            if (result.value) {
                $.ajax({
                    url: `userEnabled?user_num=${user_num}`,
                    success: function (bool) {
                        resultRes(bool)
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        })
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