<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<script type="text/javascript">
$(function(){
	$("#content").on("keyup",function(){
		var byteTxt = "";
		var byte = function(str){
			var byteNum=0;
			for(i=0;i<str.length;i++){
				byteNum+=(str.charCodeAt(i)>127)?2:1;
				if(byteNum<2000){
					byteTxt+=str.charAt(i);
				};
			};
			return Math.round( byteNum/2 );
		};
		if(byte($("#content").val())>1000){
			alert("25자 이상 입력할수 없습니다.");
			$("#content").val("");
			$("#content").val(byteTxt);
		}
	});
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <!-- Page Content -->
    <br>
	<br>
    <div class="container">
    <div class="col-md-12">
   		 <div class="page-header">
			<h1>질문수정</h1>
		</div>
		<br>
		<form class="form-horizontal" name="modify_form" method="post" action="modify">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="hidden" name="bId" value="${board.bId }" /> 
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${board.title }">
				</div>
			</div>
			<div class="form-group">
				<label for="message" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="10" id="content" name="content">${board.content }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">태그</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="tags" name="tags" placeholder="쉼표 , 로 구분 5개 까지" value="${tag }">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-2" style="text-align:center;">
					<input id="submit" name="submit" type="submit" value="Send" class="btn btn-primary">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-2">
					<!--  Will be used to display an alert to the user -->
				</div>
			</div>
		</form>
		</div>
    </div>
    <!-- /.container -->
	<br>
	<br>
	<br>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
     <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>