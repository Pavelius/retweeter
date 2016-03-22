<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Send and read short messages. Only for education purpose.">
    <meta name="author" content="Pavel Chistyakov">
    <title>Re-Tweeter</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<c:url value="/"/>">Main</a></li>
                    <li><a href="<c:url value="/messages"/>">Messages</a></li>
                    <li><a href="<c:url value="/settings"/>">Settings</a></li>
                    <li><a href="<c:url value="/contacts"/>">Contacts</a></li>
                    <c:if test="${user==null}">
                        <form class="navbar-form navbar-right" action="<c:url value="/user/login"/>" method="post">
                            <div class="form-group">
                                <input type="text" id="username" name="username" placeholder="User" class="form-control"/>
                                <input type="password" id="password" name="password" placeholder="Password" class="form-control"/>
                            </div>
                            <button type="submit" class="btn btn-default">Log in</button>
                        </form>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <div class="jumbotron">
        <h2>Re-Tweeter</h2>

        <p>Exchange small messages between users.
            <c:if test="${user==null}">
                Not register yet? You can <a href="<c:url value="/user/register"/>">register</a> or <a href="<c:url value="/user/login"/>">log in</a>
                existing user.
            </c:if>
            <c:if test="${user!=null}">
                 Hello, ${user.name}. You can read <a href="<c:url value="/messages"/>">messages</a> for you.
            </c:if>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>How to use?</h2>
            <ul>
                <li>Register or login.</li>
                <li>Open messages. Add new one.</li>
                <li>Open settings.</li>
                <li>Add users or subjects you want to read.</li>
                <li>Open message again.</li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Technologies</h2>

            <p>Spring MVC, Spring Security, JPA (Hibernate), JPQL, JSTL, CSS, JS, Tweeter Bootstrap, Java Core. Deployed using Google Cloud Services.</p>
        </div>
        <div class="col-md-4">
            <h2>Currently in database</h2>
            <ul class="list-group">
                <li class="list-group-item">
                    <span class="badge">${users}</span>
                    Users
                </li>
                <li class="list-group-item">
                    <span class="badge">${messages}</span>
                    Messages
                </li>
                <li class="list-group-item">
                    <span class="badge">${groups}</span>
                    Subjects
                </li>
            </ul>
        </div>
    </div>

    <hr>
    <footer>
        <p>&copy; Pavel Chistyakov 2016. For education purposes only.</p>
    </footer>

</div>

</body>
</html>