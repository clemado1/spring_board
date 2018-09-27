<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
    $('#search_bar').submit(function(){
    	
        if($('#keyword').val().length<2){ 
            alert('2자리 이상 입력해주세요'); // password라고 경고
            return false; // 폼은 전송시키지않고 false반환
        }
    });
});
</script>
</head>
<body>
	<div class="col-md-4">

		<!-- Search Widget -->
		<form action="list" name="search_bar" id="search_bar" method="get">
		<div class="card my-4">
			<h5 class="card-header">Search</h5>
			<div class="card-body">
				<div class="input-group">
					<input type="text" name="keyword" id="keyword" class="form-control" value="" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-secondary" type="submit">검색</button>
					</span>
					
				</div>
			</div>
		</div>
	</form>
		<!-- Categories Widget -->
		<div class="card my-4">
			<h5 class="card-header">Categories</h5>
			<div class="card-body">
				<div class="row">
					<div class="col-lg-6">
						<ul class="list-unstyled mb-0">
							<li><a href="write_form">질문하기</a></li>
							<li>My정보</li>
							<li>알람</li>
						</ul>
					</div>
					<div class="col-lg-6">
						<ul class="list-unstyled mb-0">
							<li>내가쓴글</li>
							<li>답변한글</li>
							<li><a href="about">이용안내</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Side Widget -->
		<div class="card my-4">
			<h5 class="card-header">Tag Rank</h5>
			<div class="card-body">
			<c:forEach items="${tags}" var="tag">
				<a href="tag?q=${tag }">#${tag }</a>&nbsp;
			</c:forEach>
			</div>
		</div>
		<c:if test="${randList != null }">
		<div class="card my-4">
			<h5 class="card-header">Random List</h5>
			<div class="card-body">
			<c:forEach items="${randList}" var="rand">
				<a href="view?id=${rand.bId }">${rand.title }</a><br />
			</c:forEach>
			</div>
		</div>
		</c:if>

	</div>
</body>
</html>