<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Pavel Chistyakov">
    <title>Messages</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form role="form" enctype="multipart/form-data" class="form-horizontal" accept-charset="utf-8" charset="utf-8" action="<c:url value="/message/add"/>" method="post">
        <div class="form-group"><h3>Message</h3></div>
        <div class="form-group"><input type="text" class="form-control" name="content" placeholder="Message text"></div>
        <div class="form-group"><input type="text" class="form-control" name="subject" placeholder="Subjects (coma separated)"></div>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="OK"></div>
    </form>
</div>
</body>
</html>