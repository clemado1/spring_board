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

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link type="text/css" href="${pageContext.request.contextPath}/resources/css/blog-home.css" rel="stylesheet">
    
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  </head>

  <body>
<script type="text/javascript">
    jQuery.noConflict();
    var j$ = jQuery;
</script>
  
  
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">
			<!-- 검색 키워드 노출 -->
          <h1 class="my-4">최근 질문
            <!--<small>Secondary Text</small> -->
          </h1>

          <!-- Blog Post -->
          <c:forEach items="${list}" var="dto">
          <div class="card mb-4">
            <div class="card-body">
              <h2 class="card-title">${dto.title}</h2>
              <p class="card-text">${dto.content}</p>
              <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on ${dto.date } by ${dto.name }
              <a href="#">Start Bootstrap</a>
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
	              <a href="javascript:void(0);" onclick="location.href=encodeURI('list?page=${pageInfo.page-1}<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')">&larr;</a>
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
						<a class="page-link" href="javascript:void(0);" onclick="location.href=encodeURI('list.bo?page=${a }<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')">${a }</a>
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
						<a a class="page-link" href="javascript:void(0);" onclick="location.href=encodeURI('csList.bo?page=${pageInfo.page+1 }<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')"><span id="pagebn">></span></a>
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

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
     <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <%
   	String messageContent = null;
   if(session.getAttribute("messageContent") != null){
	   messageContent = (String) session.getAttribute("messageContent");
   }
   String messageType = null;
   if(session.getAttribute("messageType")!=null){
	   messageType = (String) session.getAttribute("messageType");
   }
   System.out.println(messageType+","+messageContent);
   if(messageContent != null){
   %>
   <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle"><%=messageType %></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <%=messageContent %>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
   <script>
  	j$('#messageModal').modal("show");
   </script>
   <%
   	session.removeAttribute("messageContent");
   	session.removeAttribute("messageType");
   	} 
   %>
  </body>
</html>
