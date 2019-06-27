var reactClass = ["react","fab","fa-react"];
var heartClass = ["heart","fas","fa-heart"];
var upClass = ["thumbs","far","fa-thumbs-up"];
var downClass = ["thumbs","far","fa-thumbs-down"];
var lolClass = ["face","far","fa-laugh-squint"];
var cryClass = ["face","far","fa-sad-cry"];
var font = "react_font";

$(document).ready(function(){
    $(".reactBtn").mouseenter(function () {
        $(".heartBtn").fadeIn();
        $(".thumbs-upBtn").fadeIn();
        $(".thumbs-downBtn").fadeIn();
        $(".laughBtn").fadeIn();
        $(".cryBtn").fadeIn();
    });
    $(".reactBtn").mouseleave(function () {
        $(".heartBtn").fadeOut(2500);
        $(".thumbs-upBtn").fadeOut(2500);
        $(".thumbs-downBtn").fadeOut(2500);
        $(".laughBtn").fadeOut(2500);
        $(".cryBtn").fadeOut(2500);
    });
    $(".heartBtn").click(function () {
        $(".reactBtn span")
            .removeClass()
            .addClass(font)
            .addClass(heartClass[0]);
        $(".reactBtn span i")
            .removeClass()
            .addClass(heartClass[1])
            .addClass(heartClass[2]);
    });
    $(".thumbs-upBtn").click(function () {
        $(".reactBtn span")
            .removeClass()
            .addClass(font)
            .addClass(upClass[0]);
        $(".reactBtn span i")
            .removeClass()
            .addClass(upClass[1])
            .addClass(upClass[2]);
    });
    $(".thumbs-downBtn").click(function () {
        $(".reactBtn span")
            .removeClass()
            .addClass(font)
            .addClass(downClass[0]);
        $(".reactBtn span i")
            .removeClass()
            .addClass(downClass[1])
            .addClass(downClass[2]);
    });
    $(".laughBtn").click(function () {
        $(".reactBtn span")
            .removeClass()
            .addClass(font)
            .addClass(lolClass[0]);
        $(".reactBtn span i")
            .removeClass()
            .addClass(lolClass[1])
            .addClass(lolClass[2]);
    });
    $(".cryBtn").click(function () {
        $(".reactBtn span")
            .removeClass()
            .addClass(font)
            .addClass(cryClass[0]);
        $(".reactBtn span i")
            .removeClass()
            .addClass(cryClass[1])
            .addClass(cryClass[2]);
    });
    $(".reactBtn").click(function () {
        $(".reactBtn span")
            .removeClass()
            .addClass(font)
            .addClass(reactClass[0]);
        $(".reactBtn span i")
            .removeClass()
            .addClass(reactClass[1])
            .addClass(reactClass[2]);
    });
});