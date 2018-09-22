<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>개발자 커뮤니티 괴발개발</title>

<!-- Bootstrap core CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/css/blog-home.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
body {
	background: #eee !important;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}
</style>
</head>

<body>
	<!-- Menu -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="wrapper">
		<form class="form-signin"
			action="<c:url value="j_spring_security_check" />" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<s:authorize access="hasRole('ROLE_USER')">
				<p>you are already log-in</p>
			</s:authorize>

			<s:authorize access="!hasRole('ROLE_USER')">
				<br>
			</s:authorize>
			<h2 class="form-signin-heading">Please login</h2>
			<c:choose>
				<c:when test="${param.error != null }">
					<p class="blockquote-footer">${error }</p>
				</c:when>
				<c:otherwise>
					<br />
				</c:otherwise>
			</c:choose>
			<div class="form-group">
				<input type="text" id="j_username" name="username"
					class="form-control" placeholder="Email" required="required">
			</div>
			<div class="form-group">
				<input type="password" id="j_password" name="password"
					class="form-control" placeholder="Password" required="required">
			</div>
			<span class="pull-right"> <label class="checkbox"> <input
					type="checkbox" value="remember-me" id="rememberMe"
					name="rememberMe"> Remember me
			</label>
			</span>
			<p class="text-center">
				<a href="joinForm">Create an Account</a>
			</p>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
	<br>
	<br>
	<!-- /container -->
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>