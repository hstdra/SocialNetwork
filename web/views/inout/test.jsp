<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="en">
<head>
    <title>Signup</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../views/inout/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../views/inout/css/util.css">
    <link rel="stylesheet" type="text/css" href="../views/inout/css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('../views/inout/images/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" method="post" action="${pageContext.request.contextPath}/signup">
					<span class="login100-form-title p-b-49">
						Sign up
					</span>

                <input id="ava" class="btn input100 btn-outline-default waves-effect float-center" type="file"
                       accept="image/*" style="padding: 0; margin-top: 15px" name="uploadFile"
                       onchange="readURL(this);">

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            Sign up
                        </button>
                    </div>
                </div>
            </form>
            <form method="post" action="${pageContext.request.contextPath}/signup">
                Select file to upload:
                <input type="file" name="uploadFile"/>
                <br/><br/>
                <input type="submit" value="Upload"/>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="../views/inout/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="../views/inout/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="../views/inout/vendor/bootstrap/js/popper.js"></script>
<script src="../views/inout/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="../views/inout/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="../views/inout/vendor/daterangepicker/moment.min.js"></script>
<script src="../views/inout/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="../views/inout/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="../views/inout/js/main.js"></script>

</body>
</html>