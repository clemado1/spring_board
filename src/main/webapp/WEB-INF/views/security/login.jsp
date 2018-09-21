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
<form action="<c:url value="j_spring_security_check" />" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        <h2 class="text-center">Log in</h2>
        <div class="info-message">
        	<c:if test="${param.error != null }">
			<p>
				${error } <br/>
				<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL }">
					message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"/>
				</c:if>
			</p>
		</c:if>
        </div>      
        <div class="form-group">
            <input type="text" id="email" name="email" class="form-control" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <input type="password" id="passwd" name="passwd" class="form-control" placeholder="Password" required="required">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> 이메일 저장</label>
            <a href="#" class="pull-right">Forgot Password?</a>
        </div>        
   	</form>
    <p class="text-center"><a href="join">Create an Account</a></p>
    
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