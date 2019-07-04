<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="../assets/css/index.css">
    <link rel="stylesheet" href="../assets/css/taskbar.css">
    <link rel="stylesheet" href="../assets/css/contact.css">
    <link rel="stylesheet" href="../assets/css/message.css">
    <link rel="stylesheet" href="../assets/fontawesome/css/all.css">
    <link rel="stylesheet" href="../assets/css/view.css">
    <link rel="stylesheet" href="../assets/css/reactBtns.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../assets/js/library/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="../assets/js/library/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="../assets/js/library/bootstrap.min.js"></script>
    <!-- Latest compiled React -->
    <script src="../assets/js/library/react.development.js"></script>
    <script src="../assets/js/library/react-dom.development.js"></script>
    <script src="../assets/js/library/react.production.min.js"></script>
    <script src="../assets/js/library/react-dom.production.min.js"></script>
    <script src="../assets/js/library/browser.min.js"></script>
    <!-- Plugin CSS -->
    <link type="text/css" href="../assets/css/OverlayScrollbar.css" rel="stylesheet"/>
    <!-- Plugin JS -->
    <script type="text/javascript" src="../assets/js/jquery.overlayScrollbars.js"></script>

    <script type="text/babel">
        const host = window.location.hostname + ":" + window.location.port;
        $("body").attr("host", host);
    </script>
    <script type="text/babel" src="../assets/js/contact.jsx"></script>
    <script type="text/babel" src="../assets/js/view.jsx"></script>
</head>

<body>
<input id="file-input" type="file" accept="image/*" name="uploadFile" style="display: none;"/>

<div id="main-task-bar">
    <div id="zone1" class="task-bar">
        <div id="main-task-bar-info" class="mid if">
            <div id="main-task-bar-logo" class="mid if">
                <i class="fab fa-windows fa-2x ma"></i>
            </div>
            <div id="main-task-bar-name" class="mid if">
                <p class="mid ma">SPACENET</p>
            </div>
        </div>
        <div id="main-task-bar-search" class="mid if">
            <input id="search-bar" type="text" placeholder="Tìm kiếm...">
            <div id="search-bar-icon" class="if">
                <i class="far fa-search fa-lg ma"></i>
            </div>
        </div>
        <div id="notification-icon" class="task-bar-icon mid if">
            <i class="fas fa-bells fa-lg ma">
                <p id="count-notification" class="contact-count"></p>
            </i>
            <div id="notification-zone">
                <div id="notification-zone-include"></div>
                <div id="notification-zone-mark">
                    <p>Đánh dấu tất cả đã đọc</p>
                </div>
            </div>
        </div>
        <div id="friend-icon" class="task-bar-icon mid if">
            <i class="fas fa-user-friends fa-lg ma"></i>
        </div>
    </div>
    <div id="zone2" class="task-bar"></div>
    <div id="zone3" class="task-bar">
        <div class="col-sm-3 if">
            <img id="task-bar-ava" class="ma" src="${sessionScope.user.avatar}" alt="">
        </div>
        <div class="col-sm-7 if">
            <p id="task-bar-name" userid="${sessionScope.user.userID}" class="ma">${sessionScope.user.getFullName()}</p>
        </div>
        <i class="far fa-chevron-down fa-lg ma"></i>
        <div id="zone3-down">
            <div id="homepage" class="zone3-option">
                <div class="col-sm-3 if">
                    <i class="fas fa-home-lg-alt fa-lg ma"></i>
                </div>
                <div class="col-sm-7 if">
                    <p class="zone3-option-name ma">Trang cá nhân</p>
                </div>
                <i class="far fa-chevron-right fa-lg ma"></i>
            </div>
            <div class="zone3-option">
                <div class="col-sm-3 if">
                    <i class="fas fa-tools fa-lg ma"></i>
                </div>
                <div class="col-sm-7 if">
                    <p class="zone3-option-name ma">Cài đặt</p>
                </div>
                <i class="far fa-chevron-right fa-lg ma"></i>
            </div>
            <div class="zone3-option" onclick="location.href='logout';">
                <div class="col-sm-3 if">
                    <i class="fas fa-sign-out fa-lg ma"></i>
                </div>
                <div class="col-sm-7 if">
                    <p class="zone3-option-name ma">Đăng xuất</p>
                </div>
                <i class="far fa-chevron-right fa-lg ma"></i>
            </div>
        </div>
    </div>

</div>
<div id="main-section">
    <!--TRÍ CODE HERE-->
    <div id="view">

    </div>

    <!--PORN CODE HERE-->
    <div id="message">
        <div id="chat_bar">
            <div chatid="0" class="chat_tab">
                <div class="chat_tab_ava"><img
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYw07ioamYJtIXSMIpXlMzloyPYEnm4ef_g-jCkm9em6MGsIAa"
                        alt=""></div>
                <div class="chat_tab_name"><p>All</p></div>
            </div>
        </div>
        <div id="chat_body">
            <div chatid="0" class="chat_region">
                <c:forEach items="${applicationScope.ListAllMess}" var="mess">
                    <c:if test="${mess.userID == sessionScope.user.userID}">
                        <div class="your_chat">
                            <div class="your_chat_mess">
                                <p>${mess.content}</p>
                            </div>
                            <div class="your_chat_ava">
                                <img src="${mess.avatar}" alt="">
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${mess.userID != sessionScope.user.userID}">
                        <div class="other_chat">
                            <div class="other_chat_ava">
                                <img class="mid" src="${mess.avatar}" alt="">
                            </div>
                            <div class="other_chat_mess">
                                <p class="mid">${mess.content}</p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div id="input_chat" class="if">
            <div id="input_chat_content">
                <input type="text" id="chat_box" placeholder="Say something...."></input>
            </div>
            <div id="input_chat_send">
                <i class="fas fa-paper-plane fa-lg"></i>
            </div>
        </div>
    </div>

    <!--HÂN CODE HERE-->
    <div id="contact">
        <div id="contact-search" class="if">
            <input type="text" placeholder="Tìm kiếm..." name="contact-search-input" class="ma">
        </div>
        <div id="contact-main">

            <%--REACT LOAD HERE--%>
            <div id="contact-main-online"></div>

            <div id="contact-main-recent">
                <c:forEach items="${sessionScope.listRecent}" var="recent">
                    <div class="contact-main-people" chatid="${recent.chatID}" userid="${recent.userID}">
                        <div class="col-sm-3 if">
                            <img class="contact-main-people-img ma" src="${recent.avatar}" alt="">
                        </div>
                        <div class="col-sm-7">
                            <p class="contact-main-people-name1 ma">${recent.name}</p>
                            <c:if test="${recent.lSMessID != recent.messID}">
                                <p class="contact-main-people-message ma b"
                                   style="font-weight: bolder">${recent.content}</p>
                            </c:if>
                            <c:if test="${recent.lSMessID == recent.messID}">
                                <p class="contact-main-people-message ma">${recent.content}</p>
                            </c:if>
                        </div>
                        <c:if test="${recent.lSMessID != recent.messID}">
                            <i class="far fa-bell fa-lg ma"></i>
                        </c:if>
                        <c:if test="${recent.lSMessID == recent.messID}">
                            <i class="far fa-comment fa-lg ma"></i>
                        </c:if>
                    </div>
                </c:forEach>
            </div>


        </div>
        <div id="contact-button" class="row ma">
            <div id="contact-button-online" class="col if">
                <i class="fal fa-user-friends fa-lg ma"></i>
                <p id="count-online" class="contact-count" style="display: none"></p>
            </div>
            <div id="contact-button-recent" class="col if">
                <i class="fal fa-envelope-open fa-lg ma"></i>
                <p id="count-recent" class="contact-count" style="display: none"></p>
            </div>
            <div id="contact-button-setting" class="col if">
                <i class="fal fa-cog fa-lg ma"></i>
            </div>
        </div>
    </div>
</div>

<script src="../assets/js/index.js"></script>
<%--<script src="../assets/js/react_effect.js"></script>--%>

</body>
</html>