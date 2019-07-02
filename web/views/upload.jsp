<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File Upload</title>
    <script src="../assets/js/library/jquery.min.js"></script>

</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
    Select file to upload:
    <input id="ul" type="file" name="uploadFile"/>
    <br/><br/>
    <div id="ccc">CCC</div>
    <input type="submit" value="Upload"/>

    <img id="output" src="" width="100" height="100">

    <input id="photo" type="file" accept="image/*" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
</form>
    <h2>URL image: ${message}</h2>
    <img src="${message}" alt=""/>
</body>
<script>
    function x() {
        var data = new FormData();
        $.each($('#ul')[0].files, function(i, file) {
            data.append('file-'+i, file);
        });

        $.ajax({
            url: 'http://localhost:8080/uploadImage',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST', // For jQuery < 1.9
            success: function(data){
                console.log(data);
            }
        });
    }
    $("#ccc").click(function () {
        x();
    });

    $('#photo').focus();
    $('#photo').trigger('click');
</script>
</html>
