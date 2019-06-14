<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="../assets/css/index.css">
    <link rel="stylesheet" href="../assets/css/contact.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.1.0/css/all.css" media="all">
    <script src="https://kit.fontawesome.com/2b45e9c5d6.js"></script>

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
</head>

<body>
<div id="main-task-bar"></div>
<div id="main-section">
    <!--TRÍ CODE HERE-->
    <div id="view"></div>

    <!--PORN CODE HERE-->
    <div id="message"></div>

    <!--HÂN CODE HERE-->
    <div id="contact">
        <div id="contact-search" class="if">
            <input type="text" placeholder="Tìm kiếm..." name="contact-search-input" class="ma">
        </div>
        <div id="contact-main">
            <div class="contact-main-people">
                <div class="col-sm-3 if">
                    <img class="contact-main-people-img ma" src="https://bit.ly/2ZeCbaL" alt="">
                    <img class="contact-main-people-online"
                         src="https://cdn.clipart.email/33e1f7cb7397d141c79db0c12ad1ac75_filegreen-light-iconsvg-wikimedia-commons_232-232.png"
                         alt="">
                </div>
                <div class="col-sm-7 if">
                    <p class="contact-main-people-name ma">Vĩnh Hân</p>
                </div>
                <i class="far fa-comment fa-lg ma"></i>
            </div>
            <div class="contact-main-people">
                <div class="col-sm-3 if">
                    <img class="contact-main-people-img ma" src="https://bit.ly/2ZeCbaL" alt="">
                    <img class="contact-main-people-online"
                         src="https://cdn.clipart.email/33e1f7cb7397d141c79db0c12ad1ac75_filegreen-light-iconsvg-wikimedia-commons_232-232.png"
                         alt="">
                </div>
                <div class="col-sm-7 if">
                    <p class="contact-main-people-name ma">Vĩnh Hân</p>
                </div>
                <i class="far fa-comment fa-lg ma"></i>
            </div>
            <div class="contact-main-people">
                <div class="col-sm-3 if">
                    <img class="contact-main-people-img ma" src="https://bit.ly/2ZeCbaL" alt="">
                    <img class="contact-main-people-online"
                         src="https://cdn.clipart.email/33e1f7cb7397d141c79db0c12ad1ac75_filegreen-light-iconsvg-wikimedia-commons_232-232.png"
                         alt="">
                </div>
                <div class="col-sm-7 if">
                    <p class="contact-main-people-name ma">Vĩnh Hân</p>
                </div>
                <i class="far fa-comment fa-lg ma"></i>
            </div>
            <div class="contact-main-people">
                <div class="col-sm-3 if">
                    <img class="contact-main-people-img ma" src="https://bit.ly/2ZeCbaL" alt="">
                    <div class="contact-main-people-offline if">
                        <p class="ma">25m</p>
                    </div>
                </div>
                <div class="col-sm-7 if">
                    <p class="contact-main-people-name ma">Vĩnh Hân</p>
                </div>
                <i class="far fa-comment fa-lg ma"></i>
            </div>
            <div class="contact-main-people">
                <div class="col-sm-3 if">
                    <img class="contact-main-people-img ma" src="https://bit.ly/2ZeCbaL" alt="">
                    <div class="contact-main-people-offline if">
                        <p class="ma">25m</p>
                    </div>
                </div>
                <div class="col-sm-7 if">
                    <p class="contact-main-people-name ma">Vĩnh Hân</p>
                </div>
                <i class="far fa-comment fa-lg ma"></i>
            </div>
        </div>
        <div id="contact-button" class="row ma">
            <div id="contact-button-recent" class="col if">
                <i class="fal fa-envelope-open fa-lg ma"></i>
            </div>
            <div id="contact-button-online" class="col if">
                <i class="fal fa-user-friends fa-lg ma"></i>
            </div>
            <div id="contact-button-setting" class="col if">
                <i class="fal fa-cog fa-lg ma"></i>
            </div>
        </div>
    </div>
</div>

<script type="text/babel" src="../assets/js/contact.jsx"></script>

</body>
</html>