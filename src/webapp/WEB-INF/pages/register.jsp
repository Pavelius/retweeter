<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" enctype="multipart/form-data" class="form-horizontal" action="<c:url value="/user/register"/>" method="post">
        <div class="form-group"><h3>Register new user</h3></div>
        <div class="form-group"><input type="text" class="form-control" name="name" placeholder="Name"
                                       value="${username}"></div>
        <c:if test="${error_user ne null}">
            <div class="alert alert-danger">
                <strong>Error!</strong> ${error_user}
            </div>
        </c:if>
        <div class="form-group"><input type="text" class="form-control" name="email" placeholder="E-mail"
                                       value="${email}"></div>
        <c:if test="${error_email ne null}">
            <div class="alert alert-danger">
                <strong>Error!</strong> ${error_email}
            </div>
        </c:if>
        <div class="form-group"><input type="password" class="form-control" name="password" placeholder="Password"></div>
        <div class="form-group"><input type="password" class="form-control" name="password_confirm"
                                       placeholder="Confirm password"></div>
        <c:if test="${error_password ne null}">
            <div class="alert alert-danger">
                <strong>Error!</strong> ${error_password}
            </div>
        </c:if>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Register"></div>
    </form>
</div>
</body>
</html>