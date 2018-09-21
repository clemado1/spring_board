<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>

<html>
<head>
    <meta charset="utf-8">
    <title>개발자 커뮤니티</title>
 </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">괴발개발</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li id="nav-home" class="nav-item">
              <a class="nav-link" href="#">Home</a>
            </li>
            <li id="nav-about" class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li id="nav-join" class="nav-item">
              <a class="nav-link" href="joinForm">Join</a>
            </li>
            <li id="nav-login" class="nav-item">
            <s:authorize access = "hasRole('ROLE_USER')">
			<a class="nav-link" href="#">Logout</a>
			</s:authorize>
			
			<s:authorize access = "!hasRole('ROLE_USER')">
			<a class="nav-link" href="#">Login</a>
			</s:authorize>
            </li>
          </ul>
        </div>
      </div>
    </nav>   
  </body>
</html>
