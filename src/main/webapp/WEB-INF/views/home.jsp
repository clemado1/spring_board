<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<style type="text/css">
.glyphicon-lg {
	font-size: 4em
}

.info-block {
	border-left: 5px solid #E6E6E6;
	margin-bottom: 25px;
	background-color: #F6F6F6;
	padding: 10px 10px 10px 20px;
}

.info-block.block-info {
	border-color: #20819e
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	 </script>
</head>

<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">
			<br>
			<br>
				<h2>Filtered List</h2>
				<div style="width:100%;text-align:right;padding:10px;">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-outline-primary <c:out value="${std eq 'new' ? 'active' : '' }"/>" onclick="location.href='?std=new'">
				    <input type="radio" name="options" id="option1" autocomplete="off" <c:out value="${std eq 'new' ? 'checked' : '' }"/>> New
				  </label>
				  <label class="btn btn-outline-primary <c:out value="${std eq 'hot' ? 'active' : '' }"/>" onclick="location.href='?std=hot'">
				    <input type="radio" name="options" id="option2" autocomplete="off" <c:out value="${std eq 'hot' ? 'checked' : '' }"/>> Hot
				  </label>
				  <label class="btn btn-outline-primary <c:out value="${std eq 'mon' ? 'active' : '' }"/>" onclick="location.href='?std=mon'">
				    <input type="radio" name="options" id="option3" autocomplete="off" <c:out value="${std eq 'mon' ? 'checked' : '' }"/>> Month
				  </label>
				</div>
				</div>
				<c:forEach items="${list}" var="dto">
				<div class="info-block block-info clearfix">
					<h4><a href="view?id=${dto.bId }">${dto.title}</a></h4>
					<span>답변 ${dto.bReply } 추천 ${dto.hit } 열람 ${dto.readcount }</span><br>
					<span>by ${dto.name } <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${dto.date }" /></span><br>
					<span><c:forEach items="${dto.tags}" var="tag"><a href="tag?q=${tag }">#${tag }</a> </c:forEach></span>
				</div>
				</c:forEach>
				<br>
				<ul class="pagination justify-content-center mb-4">
	          	<c:choose>
	         	<c:when test="${pageInfo.page<=1 }">
					<li class="page-item disabled">
	              		<a class="page-link" href="#">&larr;</a>
	            	</li>		
				</c:when>
				<c:otherwise>
					<li class="page-item">
		              <a class="page-link" href="javascript:void(0);" onclick="location.href='?page=${pageInfo.page-1}&std=${std}'">&larr;</a>
		            </li>
				</c:otherwise>
				</c:choose>
				<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
					<c:choose>
						<c:when test="${a==pageInfo.page }">
							<li class="page-item disabled">
				              <a class="page-link" href="javascript:void(0);">${a }</a>
				            </li>
						</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="javascript:void(0);" onclick="location.href='?page=${a }&std=${std}'">${a }</a>
						</li>
					</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						<li class="page-item disabled">
	              			<a class="page-link" href="#">&rarr;</a>
	            		</li>		
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a a class="page-link" href="javascript:void(0);" onclick="location.href='?page=${pageInfo.page+1 }&std=${std}'">&rarr;</a>
						</li>
					</c:otherwise>
				</c:choose>
	          </ul>
			</div>
			<!-- Sidebar Widgets Column -->
			<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<br>
	<br>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<%
   	String messageContent = null;
   if(session.getAttribute("messageContent") != null){
	   messageContent = (String) session.getAttribute("messageContent");
   }
   String messageType = null;
   if(session.getAttribute("messageType")!=null){
	   messageType = (String) session.getAttribute("messageType");
   }

   if(messageContent != null){
   %>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div
				class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"><%=messageType %></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<%=messageContent %>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
  	$('#messageModal').modal("show");
   </script>
	<%
   	session.removeAttribute("messageContent");
   	session.removeAttribute("messageType");
   	} 
   %>
</body>
</html>
