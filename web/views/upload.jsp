<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File Upload</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
    Select file to upload:
    <input type="file" name="uploadFile"/>
    <br/><br/>
    <input type="submit" value="Upload"/>
</form>
    <h2>URL image: ${message}</h2>
    <img src="${message}" alt=""/>
</body>
</html>
