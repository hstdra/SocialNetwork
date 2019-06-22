function changeColor(_this) {
    _this.style.boxShadow = "0px 7px red";
}

function oldColor(_this) {
    _this.style.boxShadow = "0px 0px red";
}

$(".chat_tab").dblclick(function (e) {
    $(this).remove();
});