<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-4">

		<!-- Search Widget -->
		<form action="list" name="search_bar" id="search_bar" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="card my-4">
			<h5 class="card-header">Search</h5>
			<div class="card-body">
				<div class="input-group">
					<input type="hidden" name="std" value="all">
					<input type="text" name="keyword" id="keyword" class="form-control" placeholder="Search for...">
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
							<li><a href="#">My정보</a></li>
							<li><a href="#">알람</a></li>
						</ul>
					</div>
					<div class="col-lg-6">
						<ul class="list-unstyled mb-0">
							<li><a href="#">내가쓴글</a></li>
							<li><a href="#">답변한글</a></li>
							<li><a href="#">이용안내</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Side Widget -->
		<div class="card my-4">
			<h5 class="card-header">괴발개발</h5>
			<div class="card-body">괴발개발은 한국의 모든 개발자들이 질문을 올릴 수 있는 통합된 사이트를
				지향합니다.</div>
		</div>

	</div>
</body>
</html>