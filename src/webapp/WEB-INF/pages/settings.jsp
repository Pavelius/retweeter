<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Pavel Chistyakov">
    <title>Settings</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
        function SubmitButtons() {
            var param = {"users[]": [], "subjects[]": []};
            $('[name="users[]"]:checked').each(function () {
                param['users[]'].push($(this).val());
            });
            $('[name="subjects[]"]:checked').each(function () {
                param['subjects[]'].push($(this).val());
            });
            $.post("<c:url value="/settings"/>", param);
        }
    </script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="<c:url value="/"/>">Main</a></li>
                    <li><a href="<c:url value="/messages"/>">Messages</a></li>
                    <li class="active"><a href="<c:url value="/settings"/>">Settings</a></li>
                    <li><a href="<c:url value="/contacts"/>">Contacts</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div>
        <p><b>From which users you want to receive messages?</b></p>
        <c:forEach items="${users}" var="user">
            <c:if test="${user_supliers.contains(user.id)}">
                <input type="checkbox" checked name="users[]" value="${user.id}">${user.username}<br>
            </c:if>
            <c:if test="${user_supliers.contains(user.id)==false}">
                <input type="checkbox" name="users[]" value="${user.id}">${user.username}<br>
            </c:if>
        </c:forEach>
        <p><b>On what subjects you want to receive messages?</b></p>
        <c:forEach items="${subjects}" var="subject">
            <c:if test="${user_subects.contains(subject.id)}">
                <input type="checkbox" checked name="subjects[]" value="${subject.id}">${subject.name}<br>
            </c:if>
            <c:if test="${user_subects.contains(subject.id)!=true}">
                <input type="checkbox" name="subjects[]" value="${subject.id}">${subject.name}<br>
            </c:if>
        </c:forEach>
    </div>
    <div>
        <button type="button" id="submit_checkbox" class="btn btn-default navbar-btn" onclick="SubmitButtons()">Save</button>
    </div>
</div>

</body>
</html>