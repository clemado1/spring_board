<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

  <body>
  
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">
			 <h5 class="my-4">#${tag } 검색 결과 ${pageInfo.listCount }건</h5>
			 <div style="width:100%;text-align:right;padding:10px;">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-outline-primary <c:out value="${std eq 'bid' ? 'active' : '' }"/>" onclick="location.href='tag?std=bid&q=${tag}'">
				    <input type="radio" autocomplete="off" <c:out value="${std eq 'bid' ? 'checked' : '' }"/>> New
				  </label>
				  <label class="btn btn-outline-primary <c:out value="${std eq 'hit' ? 'active' : '' }"/>" onclick="location.href='tag?std=hit&q=${tag}'">
				    <input type="radio" autocomplete="off" <c:out value="${std eq 'hit' ? 'checked' : '' }"/>> Hit
				  </label>
				</div>
			</div>

          <!-- Blog Post -->
          <c:forEach items="${list}" var="dto">
          <div class="card mb-4">
            <div class="card-body">
              <h2 class="card-title">${dto.title}</h2>
              <p class="card-text">${dto.content}</p>
              <a href="view?id=${dto.bId }" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.date }" /> by ${dto.name }
              <font color="black">답변</font> ${dto.bReply } <font color="black">추천</font> ${dto.hit } <font color="black">열람</font> ${dto.readcount }<br>
					<span><c:forEach items="${dto.tags}" var="tag"><a href="tag?q=${tag }">#${tag }</a> </c:forEach></span>
            </div>
          </div>
          </c:forEach>
          
          <ul class="pagination justify-content-center mb-4">
          	<c:choose>
         	<c:when test="${pageInfo.page<=1 }">
				<li class="page-item disabled">
              		<a class="page-link" href="#">&larr;</a>
            	</li>		
			</c:when>
			<c:otherwise>
				<li class="page-item">
	              <a class="page-link" href="javascript:void(0);" onclick="location.href=encodeURI('tag?page=${pageInfo.page-1}&std=${std}&q=${tag}')">&larr;</a>
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
						<a class="page-link" href="javascript:void(0);" onclick="location.href=encodeURI('tag?page=${a }&std=${std}&q=${tag}')">${a }</a>
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
						<a a class="page-link" href="javascript:void(0);" onclick="location.href=encodeURI('tag?page=${pageInfo.page+1 }&std=${std}&q=${tag}')">&rarr;</a>
					</li>
				</c:otherwise>
			</c:choose>
          </ul>

        </div>

        <!-- Sidebar Widgets Column -->
        <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	<br>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
     <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
