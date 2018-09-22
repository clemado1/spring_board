<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="hidden" name="bId" value="${board.bId}" /> 
			<tr>
				<td> 이름 </td>
				<td> ${board.name }</td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" size = "50" value="${board.title }"> </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea name="bContent" rows="10">${board.content }</textarea> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="list.do">목록보기</a></td>
			</tr>
		</form>
	</table>
</body>
</html>