<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="reply" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="hidden" name="bId" value="${bId}">
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10"  name="bContent"></textarea></td>
			</tr>
			<tr >
				<td colspan="2"><input type="submit" value="답변"> <a href="list" >목록</a></td>
			</tr>
		</form>
	</table>
	
</body>
</html>