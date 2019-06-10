<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../assets/cssold/style.css">
    <link rel="stylesheet" type="text/css" href="../assets/cssold/left-menu.css">
    <link rel="stylesheet" type="text/css" href="../assets/cssold/chat-people.css">
    <link rel="stylesheet" type="text/css" href="../assets/cssold/content.css">
    <link rel="stylesheet" type="text/css" href="../assets/cssold/OverlayScrollbars.css">
    <script type="text/javascript" src="../assets/js/OverlayScrollbars.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../assets/js/main.js"></script>

<%--    <script type="text/javascript" src="../assets/js/scrollbars.js"></script>--%>
    <title>Trang chủ</title>
</head>

<body>
    <div class="left-menu">
        <img class="avatar" src="../assets/img/hstava.png" alt="ảnh">
        <div class="profile">
            <div class="name">
                <p class="name2">${sessionScope.user.firstName}</p>
            </div>
            <div id="abcd" class="something">
                <p class="something2">Premium Mem</p>
            </div>
        </div>
        <div class="all-menu">
            <div class="menu">
                <div class="menu-ava">
                    <img src="../assets/img/png/airplane.png" alt="">
                </div>
                <div class="menu-title">
                    <p>Trang chủ</p>
                </div>
            </div>
            <div class="menu">
                <div class="menu-ava">
                    <img src="../assets/img/png/airplane.png" alt="">
                </div>
                <div class="menu-title">
                    <p>Cá nhân</p>
                </div>
            </div>
            <div class="menu">
                <div class="menu-ava">
                    <img src="../assets/img/png/airplane.png" alt="">
                </div>
                <div class="menu-title">
                    <p>Cài đặt</p>
                </div>
            </div>
            <div class="menu">
                <div class="menu-ava">
                    <img src="../assets/img/png/airplane.png" alt="">
                </div>
                <div class="menu-title">
                    <p>Đăng xuất</p>
                </div>
            </div>
        </div>
    </div>

    <div class="main">
        <div class="top-menu">
            <div class="bonus-top-menu">
                <img class="top-mobile-ava" src="../assets/img/hstava.png" alt="">
            </div>
            <div class="first-top-menu">
                <div class="search-top-cover">
                    <div class="search-left-icon">
                        <img src="../assets/img/search-left-icon.png" alt="">
                    </div>
                    <div class="search-top-center">
                        <input type="text" placeholder="Tìm kiếm...">
                        <div class="search-right-icon">
                            <img src="../assets/img/search-chat-icon.png" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="third-top-menu">
                <div class="third-mobile">
                    <img class="top-mobile" src="../assets/img/chat-inbox-white.png" alt="">
                </div>
                <div class="search-chat2">
                    <div class="icon-search-chat2">
                        <img src="../assets/img/chat-inbox.png" alt="">
                    </div>
                    <div class="content-search-chat2">
                        <input class="content-search-chat3" type="text" placeholder="Tin nhắn...">
                    </div>
                </div>
                <div class="test">
                    <div class="main-chat2">
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>
                        <div class="list-chat2">
                            <div class="div-list-chat-ava2">
                                <img class="list-chat-ava2" src="../assets/img/hstava.png" alt="">
                                <img class="list-chat-status2" src="../assets/img/online.png" alt="">
                            </div>
                            <div class="list-chat-name2">
                                <p>Hồ Ngọc Vĩnh Hân</p>
                            </div>
                            <div class="list-chat-img2">
                                <img src="../assets/img/chat.png" alt="">
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="second-top-menu">
                <div class="second-mobile">
                    <img class="top-mobile" src="../assets/img/people-icon.png" alt="">
                </div>
                <div class="type-people2">
                    <div class="type-people-ava2">
                        <img src="../assets/img/hstava.png" alt="">
                    </div>
                    <div class="type-people-content2">
                        <textarea cols="" rows="1" placeholder="Cùng nhắn nào..."></textarea>
                    </div>
                </div>
                <div class="main-people2">
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày</p>
                        </div>
                        <div class=list-people-right></div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày Ha ha ha đồ con khỉ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày</p>
                        </div>
                        <div class=list-people-right></div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày lêu lêu lêu lêu</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày</p>
                        </div>
                        <div class=list-people-right></div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày đi đâu cả rồi ra đây đi</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày há há há</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="content">
                <div class="block-content"></div>
                <iframe src="../views/content.html" frameborder="0" scrolling="yes"></iframe>
            </div>
            <div class="people">
                <div class="block-people"></div>
                <div class="main-people-background"></div>
                <div class="main-people">
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày</p>
                        </div>
                        <div class=list-people-right></div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày Ha ha ha đồ con khỉ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày</p>
                        </div>
                        <div class=list-people-right></div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày lêu lêu lêu lêu</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày</p>
                        </div>
                        <div class=list-people-right></div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày đi đâu cả rồi ra đây đi</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày há há há</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày đi đâu cả rồi ra đây đi</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Bố mày lại sợ mày quá cơ</p>
                        </div>
                    </div>
                    <div class="list-people">
                        <img class="list-people-ava" src="../assets/img/png/airplane.png" alt="">
                        <div class="list-people-cover">
                            <p class="list-people-content">Chào tụi mày há há há</p>
                        </div>
                    </div>
                </div>
                <div class="type-people">
                    <div class="type-people-ava">
                        <img src="../assets/img/hstava.png" alt="">
                    </div>
                    <div class="type-people-content">
                        <textarea cols="" rows="1" placeholder="Cùng nhắn nào..."></textarea>
                    </div>
                </div>
            </div>
            <div class="chat">
                <div class="block-chat"></div>
                <div class="main-chat-background"></div>
                <div class="main-chat">
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                    <div class="list-chat">
                        <div class="div-list-chat-ava">
                            <img class="list-chat-ava" src="../assets/img/hstava.png" alt="">
                            <img class="list-chat-status" src="../assets/img/online.png" alt="">
                        </div>
                        <div class="list-chat-name">
                            <p>Hồ Ngọc Vĩnh Hân</p>
                        </div>
                        <div class="list-chat-img">
                            <img src="../assets/img/chat.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="search-chat">
                    <div class="icon-search-chat">
                        <img src="../assets/img/search-chat-icon.png" alt="">
                    </div>
                    <div class="content-search-chat">
                        <input type="text" placeholder="Tìm kiếm...">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>