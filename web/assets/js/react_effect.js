/*For React Buttons*/
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
/*----------------------------------------------------------------------*/
/*For React Announcement*/
var current=0;
var previous=0;
var result;

    $(document).ready(function(){
    $(".react_announce").mouseenter(function () {
        $(".react_announce_content").fadeIn();
    });
    $(".react_announce").mouseleave(function () {
        $(".react_announce_content").fadeOut();
    });
    $(document).on("click", function(e){
        if($(e.target).closest(".div_for_users_react").length || $(e.target).closest(".react_announce_box").length){
            $(".cover").fadeIn();
            $(".react_announce_box").fadeIn();
        }else{
            $(".react_announce_box").fadeOut();
            $(".cover").fadeOut();
        }
    });
    $("button.reactBtns_count span.heart").click(function() {
        previous=current;
        current=1;
        result=16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left':'+='+ result+'%'})
            .css({'background-color':'#ff133d'});
    });
    $("button.reactBtns_count span.thumbs i.fa-thumbs-up").click(function() {
        previous=current;
        current=2;
        result=16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left':'+='+ result+'%'})
            .css({'background-color':'#3176ff'});
    });
    $("button.reactBtns_count span.thumbs i.fa-thumbs-down").click(function() {
        previous=current;
        current=3;
        result=16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left':'+='+ result+'%'})
            .css({'background-color':'#3176ff'});
    });
    $("button.reactBtns_count span.face i.fa-laugh-squint").click(function() {
        previous=current;
        current=4;
        result=16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left':'+='+ result+'%'})
            .css({'background-color':'#d8b019'});
    });
    $("button.reactBtns_count span.face i.fa-sad-cry").click(function() {
        previous=current;
        current=5;
        result=16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left':'+='+ result+'%'})
            .css({'background-color':'#d8b019'});
    });
    $("button.reactBtns_count span.react").click(function() {
        previous=current;
        current=0;
        result=16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left':'+='+ result+'%'})
            .css({'background-color':'forestgreen'});
    });
});


/* For Comment */
$(document).ready(function(){
    $(".div_for_comment_btn").click(function(){
        $(".comment").toggle(500);

    });
});

