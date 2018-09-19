<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginForm.jsp</h1>
<form action="<c:url value="j_spring_security_check" />" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<c:if test="${param.ng != null }">
		<p>
			login ng! <br/>
			<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL }">
				message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"/>
			</c:if>
		</p>
	</c:if>
	ID : <input type="text" name="userid"> <br />
	PW : <input type="text" name="userpw"> <br />
	<input type="submit" value="LOGIN"> <br />
</form>

</body>
</html>