function loginProcess() {
    var _id = $("#loginId").val()
    var _pw = $("#loginPw").val()

    if (_id == null || _id == "") {
        alert("ID를 확인해 주세요")
    } else if (_pw == null || _pw == "") {
        alert("PW를 확인해 주세요")
    } else {
        $.ajax({
            url: "loginDo",
            type: "post",
            data: "id=" + _id + "&pw=" + _pw,
            success: function (msg) {
                if (msg.loginChk == true) {
                    location.href = '/Outflearn/';
                } else {
                    $('#loginchk').html("ID or PW 확인!")
                }
            },
            error: function () {
                alert("통신 실패")
            }
        })
    }

}