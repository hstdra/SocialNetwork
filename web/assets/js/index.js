$("#contact-main-online").show();
$("#contact-main-recent").hide();

$("#contact-button-online").click(function () {
    $("#contact-main-online").show();
    $("#contact-main-recent").hide();
});

$("#contact-button-recent").click(function () {
    $("#contact-main-online").hide();
    $("#contact-main-recent").show();
});

$(function () {
    //The passed argument has to be at least a empty object or a object with your desired options
    $('#contact-main').overlayScrollbars({
        scrollbars: {
            visibility: "auto",
            autoHide: "leave",
            autoHideDelay: 100
        }
    });
});