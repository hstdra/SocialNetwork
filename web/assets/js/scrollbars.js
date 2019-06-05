document.addEventListener("DOMContentLoaded", function() {
  var instance = OverlayScrollbars(
    document.getElementsByClassName("main-chat"),
    {
      scrollbars: {
        visibility: "auto",
        autoHide: "leave",
        autoHideDelay: 800,
        dragScrolling: true,
        clickScrolling: false,
        touchSupport: true
      }
    }
  );
  var instance = OverlayScrollbars(
    document.getElementsByClassName("main-people"),
    {
      scrollbars: {
        visibility: "auto",
        autoHide: "leave",
        autoHideDelay: 800,
        dragScrolling: true,
        clickScrolling: false,
        touchSupport: true
      }
    }
  );
  var instance = OverlayScrollbars(
    document.getElementsByClassName("main-chat2"),
    {
      scrollbars: {
        visibility: "auto",
        autoHide: "leave",
        autoHideDelay: 800,
        dragScrolling: true,
        clickScrolling: false,
        touchSupport: true
      }
    }
  );
  var instance = OverlayScrollbars(
    document.getElementsByClassName("main-people2"),
    {
      scrollbars: {
        visibility: "auto",
        autoHide: "leave",
        autoHideDelay: 800,
        dragScrolling: true,
        clickScrolling: false,
        touchSupport: true
      }
    }
  );
});
