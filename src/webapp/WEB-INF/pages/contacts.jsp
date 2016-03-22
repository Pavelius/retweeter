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
          <li><a href="<c:url value="/messages"/>">Messages</a></li>
          <li><a href="<c:url value="/settings"/>">Settings</a></li>
          <li class="active"><a href="<c:url value="/contacts"/>">Contacts</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <ul>
    <li>Author: Pavel Chistyakov.</li>
    <li>Location: Kiev, Ukraine.</li>
    <li>Phone: (095)843-99-67, (068)598-98-09</li>
    <li>E-mail: p000000000001@gmail.com</li>
    <li>Source files: can be found on <a href="https://github.com/Pavelius/retweeter">github.</a></li>
  </ul>
  <footer>
    <p>&copy; Pavel Chistyakov 2016. For education purposes only.</p>
  </footer>
</div>
</body>
</html>