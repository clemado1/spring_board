<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>개발자 커뮤니티</title>

    <link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link type="text/css" href="${pageContext.request.contextPath}/resources/css/blog-home.css" rel="stylesheet">
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

var emailck = 0;
var nameck = 0;
var passwdck = 0;

function emailCheck(){
		var email = $('#email').val();
		alert(email);
		$.ajax({
			url : "emailck",
			data : {
				email : email
			},
			success : function(data) {
				if ($.trim(data)==0) {
					$('#emailResult').html("<font color='green'>사용가능한 이메일</font>");
					$('#name').focus();
					idck = 1;
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
	alert(email);
	$.ajax({
		url : "nameck",
		data : {
			name : name
		},
		success : function(data) {
			if ($.trim(data)==0) {
				$('#nameResult').html("<font color='green'>사용가능한 닉네임</font>");
				$('#passwd').focus();
				idck = 1;
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
		$('#passwdResult').html("");
		passwdck = 1;
	}
}
function signUp(){
	if(emailck == 1 && nameck == 1 && passwdck == 1){
		$("#joinForm").submit();
	}else{
		if(emailck == 0)//모달 
	}
}
</script>
  </head>

  <body>
  
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>

    <!-- Page Content -->
    <br><br><br>
    <article class="container">
        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입</h1>
        </div>
        <br>
        <form class="form-horizontal" name="joinForm" method="post" action="join">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="email">이메일</label>
        <div class="col-sm-6">
         <div class="input-group">
             <input class="form-control" id="email" name="email" type="email" placeholder="이메일">
             <span class="input-group-btn">
                <button class="btn btn-success" onclick="emailCheck();" type="button">중복확인<i class="fa fa-mail-forward spaceLeft"></i></button>
             </span>
          </div>
          <p class="help-block" id="emailResult">중복확인을 눌러주세요.</p>
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="name">닉네임</label>
        <div class="col-sm-6">
          <div class="input-group">
             <input class="form-control" id="name" name="name" type="text" placeholder="닉네임">
             <span class="input-group-btn">
                <button class="btn btn-success" id="nameck" type="button">중복확인<i class="fa fa-mail-forward spaceLeft"></i></button>
             </span>
           </div>
           <p class="help-block" id="nameResult">중복확인을 눌러주세요.</p>
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="passwd">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" onkeyup="passwdCheck();" id="passwd" name="passwd" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="passwd2">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" onkeyup="passwdCheck();" id="passwd2" type="password" placeholder="비밀번호 확인">
                <p class="help-block" id="passwdResult">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
        <br><br>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="button" onclick="signUp()">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="location.href='list'">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>



    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
  </body>
</html>
