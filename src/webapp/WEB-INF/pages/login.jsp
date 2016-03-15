<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authorization</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" action="<c:url value="/user/login"/>" method="post">
        <div class="form-group"><h3>Enter user name and password</h3></div>
        <div class="form-group">
            <label for="username">User</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>
        <c:if test="${error ne null}">
            <div class="alert alert-danger">
                <strong>Error!</strong> User or password is not correct.
            </div>
        </c:if>
        <div class="form-actions">
            <button type="submit" class="btn btn-primary">Log in</button>
        </div>
    </form>
</div>
</body>
</html>