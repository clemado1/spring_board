<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>개발자 커뮤니티 괴발개발</title>

<link type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link type="text/css"
	href="${pageContext.request.contextPath}/resources/css/blog-home.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

var emailck = 0;
var nameck = 0;
var passwdck = 0;

function emailCheck(){
		var email = $('#email').val();
		$.ajax({
			url : "emailck",
			data : {
				email : email
			},
			success : function(data) {
				if ($.trim(data)==0) {
					$('#emailResult').html("<font color='green'>사용가능한 이메일</font>");
					$('#name').focus();
					emailck = 1;
				} else {
					$('#emailResult').html("<font color='red'>중복입니다.</font>");
					$('#email').focus();
				}
			},
			error : function(error) {

				alert("error : " + error);
			}
		});
	}
function nameCheck(){
	var name = $('#name').val();
	$.ajax({
		url : "nameck",
		data : {
			name : name
		},
		success : function(data) {
			if ($.trim(data)==0) {
				$('#nameResult').html("<font color='green'>사용가능한 닉네임</font>");
				$('#passwd').focus();
				nameck = 1;
			} else {
				$('#nameResult').html("<font color='red'>중복입니다.</font>");
				$('#name').focus();
			}
		},
		error : function(error) {

			alert("error : " + error);
		}
	});
}
function passwdCheck() {
	var userPasswd1 = $('#passwd').val();
	var userPasswd2 = $('#passwd2').val();
	
	if (userPasswd1 != userPasswd2) {
		$('#passwdResult').html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");
		passwdck = 0;
	} else {
		$('#passwdResult').html("<font color='green'>비밀번호가 일치합니다!</font>");
		passwdck = 1;
	}
}
function signUp(){
	
	var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var regName= RegExp(/^[a-zA-Z0-9가-힣]{4,8}$/);
	
	if($("#email").val().trim() == ""){
        alert("이메일을 입력해주세요.");
        emailck = 0;
        $('#emailResult').html("<font color='red'>중복확인을 눌러주세요.</font>");
        $("#email").focus();
        return false;
    }
	
    if(!regMail.test($("#email").val())){
        alert("올바른 이메일 형식이 아닙니다.");
        emailck = 0;
        $('#emailResult').html("<font color='red'>중복확인을 눌러주세요.</font>");
        $("#email").val("");
        $("#email").focus();
        return false;
    }
     
    if($("#name").val() == ""){
         alert("닉네임을 입력해주세요.");
         nameck = 0;
         $('#nameResult').html("<font color='red'>중복확인을 눌러주세요.</font>");
         $("#name").focus();
         return false;
    }
     
    if(!regName.test($("#name").val())){
     	alert("닉네임은 영문, 숫자, 한글로 4~8자리 입력해주세요.");
     	nameck = 0;
     	$('#nameResult').html("<font color='red'>중복확인을 눌러주세요.</font>");
        $("#name").val("");
        $("#name").focus();
        return false;
    }
 
    if($("#passwd").val().length>12 || $("#passwd").val().length<8) {
      	alert("비밀번호는 8~12자로 입력해주세요.");
      	$("#passwd").focus();
     	return false;
    }
    
    if(emailck == 0){
    	alert("이메일 중복 혹은 중복확인 미실시");
     	return false;
    }
    
    if(nameck == 0){
    	alert("닉네임 중복 혹은 중복확인 미실시");
     	return false;
    }
    
    if(passwdck == 0){
    	alert("비밀번호가 서로 일치하지 않습니다.");
     	return false;
    }
    
    $("#joinForm")[0].submit();
}
$(function () {
    $("#email").keyup(function () {
    	
        if (emailck == 1) {
        	emailck = 0;
            $('#emailResult').html("<font color='red'>중복확인을 눌러주세요.</font>");
            return false;
        }
    });
    
	$("#name").keyup(function () {
	    	
        if (nameck == 1) {
        	nameck = 0;
            $('#nameResult').html("<font color='red'>중복확인을 눌러주세요.</font>");
            return false;
        }
    });
});
</script>
</head>

<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- Page Content -->
	<br>
	<br>
	<br>
	<div class="container">
		<div class="col-md-12">
			<div class="page-header">
				<h1>회원가입</h1>
			</div>
			<br>
			<form class="form-horizontal" name="joinForm" id="joinForm"
				method="post" action="join">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
					<label class="col-sm-3 control-label" for="email">이메일</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="email" name="email" type="email"
								placeholder="이메일"> <span class="input-group-btn">
								<button class="btn btn-success" onclick="emailCheck();"
									type="button">
									중복확인<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</span>
						</div>
						<p class="help-block" id="emailResult">
							<font color="red">중복확인을 눌러주세요.</font>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="name">닉네임</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="name" name="name" type="text"
								placeholder="영문, 숫자, 한글 4~8자리"> <span
								class="input-group-btn">
								<button class="btn btn-success" id="nameck"
									onclick="nameCheck();" type="button">
									중복확인<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</span>
						</div>
						<p class="help-block" id="nameResult">
							<font color="red">중복확인을 눌러주세요.</font>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="passwd">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" onkeyup="passwdCheck();" id="passwd"
							name="passwd" type="password" placeholder="비밀번호">
						<p class="help-block">8자 이상 12자 이하</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="passwd2">비밀번호 확인</label>
					<div class="col-sm-6">
						<input class="form-control" onkeyup="passwdCheck();" id="passwd2"
							type="password" placeholder="비밀번호 확인">
						<p class="help-block" id="passwdResult">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" type="button" onclick="signUp()">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger" type="button"
							onclick="location.href='list'">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</form>
			<hr>
		</div>
	</div>



	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
