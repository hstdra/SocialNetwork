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
            <form success="false" class="login100-form validate-form" method="post" action="upload" enctype="multipart/form-data">
					<span class="login100-form-title p-b-49">
						Sign up
					</span>

                <div class="wrap-input100 validate-input m-b-23" data-validate="Email is required">
                    <span class="label-input100">Email</span>
                    <input class="input100" type="text" name="email" placeholder="Type your email">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="First Name is required">
                    <span class="label-input100">First Name</span>
                    <input class="input100" type="text" name="firstname" placeholder="Type your first name">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="Last Name is required">
                    <span class="label-input100">Last Name</span>
                    <input class="input100" type="text" name="lastname" placeholder="Type your last name">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100" type="password" name="password" placeholder="Type your password">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="Confirm is required">
                    <span class="label-input100">Confirm Password</span>
                    <input class="input100" type="password" name="cpassword" placeholder="Confirm your password">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="DOB is required">
                    <span class="label-input100">DOB</span>
                    <input class="input100" type="date" name="dob" placeholder="Choose your birthday">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="Gender is required">
                    <span class="label-input100">Gender</span>
                    <select class="input100" name="gender">
                        <option value="">Choose your gender</option>
                        <option value="Male">Male</option>
                        <option value="FeMale">FeMale</option>
                    </select>
                    <span class="focus-input100" data-symbol="&#9892;"></span>
                </div>
                <div class="wrap-input100 validate-input m-b-23" data-validate="Avatar is required">
                    <span class="label-input100">Avatar</span>
                    <input id="ava" class="btn input100 btn-outline-default waves-effect float-center" type="file"
                           accept="image/*" style="padding: 0; margin-top: 15px" name="uploadFile"
                           onchange="readURL(this);">
                    <img id="blah" style="display: none" src="#" onerror="this.onerror=null;this.src='';">
                </div>


                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            Sign up
                        </button>
                    </div>
                </div>
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