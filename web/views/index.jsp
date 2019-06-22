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

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Latest compiled React -->
    <script crossorigin src="https://unpkg.com/react@16/umd/react.development.js"></script>
    <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
    <script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
    <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>

    <!-- Plugin CSS -->
    <link type="text/css" href="../assets/css/OverlayScrollbar.css" rel="stylesheet"/>
    <!-- Plugin JS -->
    <script type="text/javascript" src="../assets/js/jquery.overlayScrollbars.js"></script>
</head>

<body>
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
            <i class="fas fa-bells fa-lg ma"></i>
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
            <div class="zone3-option">
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
            <div class="zone3-option">
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
    <div id="view"></div>

    <!--PORN CODE HERE-->
    <div id="message">
        <div id="chat_bar">
            <div chatid="0" class="chat_tab">
                <div class="chat_tab_ava"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYw07ioamYJtIXSMIpXlMzloyPYEnm4ef_g-jCkm9em6MGsIAa" alt=""></div>
                <div class="chat_tab_name"><p>All</p></div>
            </div>
        </div>
        <div id="chat_body">
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
                                <p class="contact-main-people-message ma b">${recent.content}</p>
                            </c:if>
                            <c:if test="${recent.lSMessID == recent.messID}">
                                <p class="contact-main-people-message ma">${recent.content}</p>
                            </c:if>
                        </div>
                        <i class="far fa-comment fa-lg ma"></i>
                    </div>
                </c:forEach>
            </div>


        </div>
        <div id="contact-button" class="row ma">
            <div id="contact-button-online" class="col if">
                <i class="fal fa-user-friends fa-lg ma"></i>
            </div>
            <div id="contact-button-recent" class="col if">
                <i class="fal fa-envelope-open fa-lg ma"></i>
            </div>
            <div id="contact-button-setting" class="col if">
                <i class="fal fa-cog fa-lg ma"></i>
            </div>
        </div>
    </div>
</div>
<script type="text/babel">
    const host = window.location.hostname + ":" +window.location.port;
    $("body").attr("host", host);
</script>
<script type="text/babel" src="../assets/js/contact.jsx"></script>
<script src="../assets/js/index.js"></script>

</body>
</html>