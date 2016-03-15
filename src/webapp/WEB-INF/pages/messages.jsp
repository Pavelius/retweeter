<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Pavel Chistyakov">
    <title>Re-Tweeter</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="<c:url value="/"/>">Main</a></li>
                    <li class="active"><a href="<c:url value="/messages"/>">Messages</a></li>
                    <li><a href="<c:url value="/settings"/>">Settings</a></li>
                    <li><a href="<c:url value="/contacts"/>">Contacts</a></li>
                    <form class="navbar-form navbar-right">
                        <div class="form-group"><a class="btn btn-default" href="<c:url value="/message/add"/>">Add</a></div>
                    </form>
                </ul>
            </div>
        </div>
    </nav>
    <div class="row">
        <c:forEach items="${messages}" var="message">
            <div class="col-md-4">
                <div class="thumbnail">
                    <p><small><b>${message.user.username}</b>, ${String.format("%1$tD %1$tR", message.date)}
                        <c:forEach items="${message.subjects}" var="subject">
                            #${subject.name}
                        </c:forEach>
                    </small><br>
                    ${message.content}<br>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>