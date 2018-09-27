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
			<h1>괴발개발 소개</h1>
		</div>
		<br>
		괴발개발은 간단하고 편한 개발자 QnA 사이트입니다.
		<br><br>
		향후 업데이트<br>
		-관리자 모드<br>
		-내가 쓴 글, 내가 쓴 답변 목록<br>
		-마크다운 텍스트 에디터<br>
		등 
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