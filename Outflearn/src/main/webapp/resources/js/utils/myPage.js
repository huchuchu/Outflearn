function selectOptionBuild(data) {

    var html = `<p>강좌 선택: <select id="configRoom">`;

    data.forEach(item => {
        html += `<option value="${item.class_num}">${item.class_title}</option>`
    })
    html += '</select></p>'
    return html
}

function inputHtmlBuild(data) {

    // 강좌 번호 option tag
    var html = `<p>강좌 선택: <select id="setClass">`;

    data.forEach(item => {
        html += `<option value="${item.class_num}">${item.class_title}</option>`
    })
    html += '</select></p>'

    // 제목 input

    html += '<p>제목 : <input type="text" id="setTitle"></p>'

    // 시간 input + select

    html += ` <p>날짜 : <input type="date" id="setDate"></p>`
    html += `    <p>반복 :
        <select id="repeatDate">
            <option value="week">매 주</option>
            <option value="month">매 월</option>
        </select>
    </p>`

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

function handleError() {
    Swal.fire({
        type: 'error',
        title: 'Ooops...',
        text: '혹시 만드신 강의가 없으신가요?',
        confirmButtonText: '강의 만들기'
    })
        .then((result) => {
            if (result.value) {
                location.href = 'ClassInfoInsertForm'
            }
        })
}


$(function () {
    $('.configLiveRoom').on('click', function () {
        $.ajax({
            url: 'getMyClass',
            success: function (data) {
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
                            location.href = `casterRoom?room=${room}`
                        }
                    })
            },
            error: function (err) {
                handleError()
            }
        })
    })

    $('#setLiveSchedule').on('click', function () {
        $.ajax({
            url: `getMyClass`,
            success: function (data) {
                Swal.fire({
                    title: '라이브 스케쥴 세팅',
                    html: inputHtmlBuild(data),
                    allowOutsideClick: false,
                    showCancelButton: true,
                    showCloseButton: true
                })
                    .then((result) => {
                        if (result.value) {
                            var setClass = $('#setClass').val()
                            var setTitle = $('#setTitle').val()
                            var setDate = $('#setDate').val()
                            var repeatDate = $('#repeatDate').val()
                            $.ajax({
                                url: `setLiveSchedule?setClass=${setClass}&setTitle=${setTitle}&setDate=${setDate}&repeatDate=${repeatDate}`,
                                success: function (bool) {
                                    if (bool) {
                                        Swal.fire({
                                            type: 'info',
                                            title: '정상적으로 처리 되셨습니다.'
                                        })
                                    } else {
                                        Swal.fire({
                                            type: 'error',
                                            title: '죄송합니다. 데이터 처리 중 오류가 발생했습니다.',
                                            text: '다시 한번 실행해주세요.',
                                            footer: '혹은 관리자에게 문의바랍니다.'
                                        })
                                    }
                                },
                                error: function (err) {
                                    Swal.fire({
                                        type: 'warning',
                                        title: '죄송합니다. 심각한 오류가 발생했습니다.',
                                        text: '관리자에게 문의 바랍니다.'
                                    })
                                }
                            })
                        }
                    })
            },
            error: function (err) {
                handleError()
            }
        })
    })
})