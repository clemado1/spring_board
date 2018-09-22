<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td> 번호 </td>
				<td> ${board.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${board.hit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" value="${board.name}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" value="${board.title}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" name="bContent" >${board.content}</textarea></td>
			</tr>
			<tr >
				<td colspan="2"> <a href="modify_form?bId=${board.bId }">수정</a> &nbsp;&nbsp; <a href="list">목록보기</a> &nbsp;&nbsp; <a href="delete?bId=${board.bId}">삭제</a> &nbsp;&nbsp; <a href="reply_form?bId=${board.bId}">답변</a></td>
			</tr>
	</table>
	
	<c:forEach items="${rboard}" var="reply">
		<c:if test="${reply.bStep eq 2 }">
		 답변 : ${reply.content } [${reply.hit }]<a href="upHit?bId=${board.bId }&rId=${reply.bId }">추천</a> <a href="comment_form?bId=${board.bId }&bReply=${reply.bId }">댓글</a> <br>
		</c:if>
		<c:if test="${reply.bStep eq 3 }">
		 코멘트 : ${reply.content } <br>
		</c:if>
	</c:forEach>
</body>
</html>