<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contacts</title>
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
          <li><a href="<c:url value="/settings"/>">Settings</a></li>
          <li class="active"><a href="<c:url value="/contacts"/>">Contacts</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <hr>
  <footer>
    <p>&copy; Pavel Chistyakov 2016. For education purposes only.</p>
  </footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>