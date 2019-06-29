var password;
var host = document.location.host;

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(150);

        };

        reader.readAsDataURL(input.files[0]);
        $('#blah').show();
    }
}

(function ($) {
    "use strict";


    /*==================================================================
   [ Focus input ]*/
    $('.input100').each(function () {
        $(this).on('blur', function () {
            if ($(this).val().trim() != "") {
                $(this).addClass('has-val');
            } else {
                $(this).removeClass('has-val');
            }
        })
    });


    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit', function () {
        var check = true;

        for (var i = 0; i < input.length; i++) {
            if (validate(input[i]) === false) {
                showValidate(input[i]);
                check = false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function () {
        $(this).focus(function () {
            hideValidate(this);
        });
    });

    function validate(input) {
        var thisAlert = $(input).parent();
        if ($(input).val().trim() == '') {
            thisAlert.attr("data-validate", thisAlert.children().html() + " is required");
            return false;
        }
        switch ($(input).attr('name')) {
            case 'email':
                if ($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                    thisAlert.attr("data-validate", "Email format is not valid");
                    return false;
                }
                break;
            case 'cpassword':
                if ($(input).val() !== $('.input100[name="password"]').val()) {
                    thisAlert.attr("data-validate", "Confirm password doesn't match");
                    return false;
                }
                break;
            case 'gender':
                if ($(input).val() === "") {
                    thisAlert.attr("data-validate", "Password isn't match");
                    return false;
                }
                break;
            case 'avatar':
                if (document.getElementById("ava").files.length === 0) {
                    thisAlert.attr("data-validate", "Password isn't match");
                    return false;
                }
                break;
        }
        return true;
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }


})(jQuery);