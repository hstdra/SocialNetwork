$(document).ready(function() {
  $(".avatar").click(function(e) {
    e.preventDefault();
    $(".menu-title").hide();
    $(".name2").hide();
    $(".something2").hide();
    $(".left-menu").css("width", "5%");
    $(".left-menu").css("min-width", "unset");
  });

  $(".search-chat2").click(function(e) {
    e.preventDefault();
    $(".test").css("display", "unset");
  });

  //Auto set width phan tu
  setInterval(function() {
    //Can left-menu & main
    var x = "calc(100% - " + $(".left-menu").width() + "px)";
    $(".main").width(x);

    //Can top-menu
    $(".top-menu").width(x);

    //Can content
    var y =
      "calc(" +
      $(".container").width() +
      "px" +
      " - " +
      $(".people").width() +
      "px" +
      " - " +
      $(".chat").width() +
      "px" +
      " - " +
      $(".main-people2").width() +
      "px" +
      ")";
    $(".content").width(y);

    //Can first-top-menu
    var z =
      "calc(" +
      $(".top-menu").width() +
      "px" +
      " - " +
      $(".second-top-menu").width() +
      "px" +
      " - " +
      $(".third-top-menu").width() +
      "px" +
      " - " +
      $(".bonus-top-menu").width() +
      "px" +
      ")";
    $(".first-top-menu").width(z);
  }, 0);
});
