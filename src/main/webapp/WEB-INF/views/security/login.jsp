<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:authorize access = "hasRole('ROLE_USER')">
<p> is Log-In</p>
</s:authorize>

<s:authorize access = "!hasRole('ROLE_USER')">
<p> is Log-Out</p>
</s:authorize>
USER ID : <s:authentication property="name"/><br/>
<c:url value="/logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post">
<input type="submit" value="Logout"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>