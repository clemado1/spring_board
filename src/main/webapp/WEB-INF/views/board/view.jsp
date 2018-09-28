<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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


 <style>
 	.reply_hit{
 		margin:0.8rem;
 		width:50px;
 		height:50px;
 		display:flex;
 		flex-flow:wrap;
 	}
 	.hit_message{
 		width:50px;
 		text-align:center;
 	}
 	.reply_name{
 		font-weight:700;
 		color:#20819e;
 	}
 	.small_size{
 		font-size:0.8em;
 	}
 	.reply{
 		background-clip:border-box;border-top:1px solid rgba(0,0,0,.125);
 	}
 	.al-right{
 		text-align:right;
 	}
 	
 </style>
 <script>
 function showCommen(v){
	
	 var name = "#commen"+v;
	 if($(name).css("display")=="block") $(name).hide();
	 else $(name).show();
 }
 function deleteArtice(v){
	 var flag = confirm('정말 삭제하시겠습니까?');
		if(flag){
			location.href="delete?id="+v;
		}
 }

 $(function () {
	    $("[name=txt_commen]").keypress(function (e) {
	        var code = (e.keyCode ? e.keyCode : e.which);

	        if (code == 13) {
	          	this.form.submit();
	            return true;
	        }
	    });
	});
 </script>
  </head>

  <body>
  
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <!-- Page Content -->
    <div class="container">

      <div class="row">
<div class="col-lg-8">

          <!-- Title -->
          <h1 class="mt-4">${board.title}</h1>

          <!-- Author -->
          <p class="lead">
            by ${board.name}
          </p>

          <hr>

          <!-- Date/Time -->
          <p class="small_size">Posted on <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${board.date}" />&nbsp;&nbsp;|&nbsp;&nbsp;<b>답변</b> ${board.bReply } <b>조회수</b> ${board.readcount }</p>

          <hr>
          
          <!-- Post Content -->
          <p>${board.content}</p>
			<br>
			<a></a>
			<p><b>tags</b> : <c:forEach items="${board.tags}" var="tag"><a href="tag?q=${tag }">#${tag }</a> </c:forEach></p>
          <div style="text-align:center;"><button type="button" class="btn btn-primary" onclick="location.href='hit?id=${board.bId}'">추천 ${board.hit }</button></div>
          <c:if test="${pageContext.request.userPrincipal.name eq board.email }">
          <div class="al-right">
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='modify_form?id=${board.bId}'">Modify</button>
          <button type="button" class="btn btn-danger btn-sm" onclick="deleteArtice(${board.bId});">Delete</button>
          </div>
          </c:if>
          <hr>
          <!-- Single Comment -->
        <c:forEach items="${rboard}" var="reply">
			<c:if test="${reply.bStep eq 2 }">
			<br>
          <div class="media mb-4 reply">
          <div class="reply_hit"><a href="rehit?bId=${board.bId }&rId=${reply.bId }"><img class="d-flex mr-3" width="40px" height="40px" src="${pageContext.request.contextPath}/resources/images/like.png" alt=""></a><span class="hit_message">${reply.hit }</span></div>
            <div class="media-body">
              <h5 class="reply_name">${reply.name }</h5>
				<p>${reply.content }</p>
				<span class="small_size"><font style="color:gray"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${reply.date }" /></font> <a href="javascript:void(0);" onclick="showCommen(${reply.bId})">댓글</a>
				<c:if test="${pageContext.request.userPrincipal.name eq reply.email }"><a href="re_del?bId=${board.bId }&rId=${reply.bId}">삭제</a></c:if></span>
            </div>
          </div>
          <div class="al-right" id="commen${reply.bId }" style="display:none;">
              <form action="comment" id="form_commen${reply.bId }" method="post">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
              <input type="hidden" name="bId" value="${board.bId}">
              <input type="hidden" name="rId" value="${reply.bId}">
                <div class="form-group">
                	<input type="text" class="form-control" name="txt_commen">
                </div>
                <button type="submit" id="sub_commen" class="btn btn-primary">Submit</button>
              </form>
            </div>
            
          </c:if>
          <c:if test="${reply.bStep eq 3 }">
			<div class="media small_size" style="margin-left:5rem; border-bottom:1px solid rgba(0,0,0,.125);"> 
               <div class="media-body">
                 <p class="mt-0" style="margin-bottom:0.5rem">${reply.content } &mdash; <font class="reply_name">${reply.name }</font> <font style="color:gray; font-size:0.6em"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${reply.date }" /></font>
                 <c:if test="${pageContext.request.userPrincipal.name eq reply.email }"><a href="re_del?bId=${board.bId }&rId=${reply.bId}">삭제</a></c:if></p>
               </div>
             </div>
             </c:if>
            
             </c:forEach>
 		 <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Leave a Reply:</h5>
            <div class="card-body al-right">
              <form id="reply-form" action="reply" method="post">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
              <input type="hidden" name="bId" value="${board.bId}">
                <div class="form-group">
                  <textarea class="form-control" id="reply-ta" name="content" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>
        </div>

        <!-- Sidebar Widgets Column -->
        <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	<br><br>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
     <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>