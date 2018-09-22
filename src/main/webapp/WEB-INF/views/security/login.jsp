<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>개발자 커뮤니티 괴발개발</title>

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link type="text/css" href="${pageContext.request.contextPath}/resources/css/blog-home.css" rel="stylesheet">
    
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  </head>
</head>
<body>
<!-- Menu -->
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
 <div class="container">
 <div class="col-md-12">
 <br><br><br><br>
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
            <input type="text" id="j_username" name="username" class="form-control" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <input type="password" id="j_password" name="password" class="form-control" placeholder="Password" required="required">
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
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
<br><br><br><br>
</div>
 </div> 
 <!-- /container -->
 	<!-- Footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
     <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>