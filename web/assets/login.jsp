<%@ page contentType="text/html; charset=UTF-8" %>


<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" type="image/png" href="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <title>Đăng nhập</title>
</head>

<body>
    <div class="left-login">
        <div class="top-left-login">
            <img src="https://xuhuongtiepthi.com/Uploads/News/25032018/News/20325184922-Social-Media.jpg" alt="">
        </div>
        <div class="bottom-left-login">
            <div class="full-list">
                <div class="list-bottom">
                    <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/42660492_1280405195434725_7125520725984673792_o.jpg?_nc_cat=109&amp;oh=6cda5c5e142926bf7f2b8213b0b99a11&amp;oe=5C3E73B0"
                        alt="">
                    <p>Võ Văn Hiếu</p>
                </div>
                <div class="list-bottom">
                    <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/41462168_897153417144463_8193596422969360384_n.jpg?_nc_cat=101&amp;oh=5b4819bf7e18ee1b4ebf2fb9c648b061&amp;oe=5C5DAD67"
                        alt="">
                    <p>Viết Thuận</p>
                </div>
                <div class="list-bottom">
                    <img src="https://scontent.fdad1-1.fna.fbcdn.net/v/t1.0-9/20842268_339552823141709_5240653877773345459_n.jpg?_nc_cat=104&amp;oh=634526d4fbaf388c108183d926a6ef63&amp;oe=5C60A800"
                        alt="">
                    <p>Anh Phan</p>
                </div>
                <div class="list-bottom">
                    <img src="https://scontent.fdad3-1.fna.fbcdn.net/v/t1.0-9/10351957_1470237633256064_6576940789155615408_n.jpg?_nc_cat=110&amp;oh=5a0583a065678029bb426c63d3c3b5ed&amp;oe=5C5EBC5E"
                        alt="">
                    <p>Đạo Nguyễn</p>
                </div>
                <div class="list-bottom">
                    <img src="https://scontent.fdad3-3.fna.fbcdn.net/v/t1.0-9/39821273_10156003342464069_5085861235518341120_n.jpg?_nc_cat=100&amp;oh=737abb2d8633be970dfc645566ae6888&amp;oe=5C55D95E"
                        alt="">
                    <p>Thanh Tra Phan</p>
                </div>
            </div>
        </div>
    </div>
    <div class="right-login">
        <div class="top-right-login"></div>
        <div class="main-right-login">
            <div class="cover-login">
                <div class="login-register">
                    <div class="lgr">
                        <p>Login</p>
                    </div>
                    <div class="lgr">
                        <p>Register</p>
                    </div>
                </div>
                <form class="login" action="/login" method="POST">
                    <input class="input-text" name="email" placeholder="Email" type="text">
                    <input class="input-text" name="passWord" placeholder="Mật khẩu" type="password">
                    <input class="input-btn" type="submit" value="Đăng nhập">
                </form>
                <form class="register" action=""></form>
            </div>
        </div>
    </div>
</body>

</html>