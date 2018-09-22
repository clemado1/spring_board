<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="form-horizontal" name="write_form" method="post" action="write">
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">제목</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
		</div>
	</div>
	<div class="form-group">
		<label for="message" class="col-sm-2 control-label">내용</label>
		<div class="col-sm-10">
			<textarea class="form-control" rows="6" name="message"></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-2">
			<input id="submit" name="submit" type="submit" value="Send" class="btn btn-primary">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-2">
			<!--  Will be used to display an alert to the user -->
		</div>
	</div>
</form>
<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="write" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" size = "50"> </td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" size = "50"> </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea name="bContent" rows="10" ></textarea> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="list">목록보기</a></td>
			</tr>
		</form>
	</table>
</body>
</html>