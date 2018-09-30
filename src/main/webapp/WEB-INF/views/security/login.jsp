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
<script>
$(function(){
	var userId = getCookie("Cookie_userid");
	alert(userId);
    $("#j_username").val(userId);
    
    if($("#j_username").val() != "")
        $("#rememberMe").attr("checked", true);
});
 
function loginProcess(){
    var id = $("#j_username").val();
    var pw = $("#j_password").val();
    
    if(id.value==""){
        alert("이메일을 입력하세요.");
        id.focus();
        return false;
    }else if(pw.value==""){
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    }
    
    if($("#rememberMe")[0].checked){
    	setCookie("Cookie_userid", id, 7);
        $("#loginForm").submit();
    }else{
    	deleteCookie("Cookie_userid");
        $("#loginForm").submit();
    }
}
function setCookie(cookieName, value, exdays){
	var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

</script>
</head>

<body>
	<!-- Menu -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="wrapper">
		<form class="form-signin" name="loginForm" id="loginForm"
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
					class="form-control" placeholder="Password" required="required" onKeyDown="if(event.keyCode==13)loginProcess()">
			</div>
			<span class="pull-right"> <label class="checkbox"> <input
					type="checkbox" value="remember-me" id="rememberMe"
					name="rememberMe"> Remember me
			</label>
			</span>
			<p class="text-center">
				<a href="joinForm">Create an Account</a>
			</p>
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="loginProcess()">Login</button>
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