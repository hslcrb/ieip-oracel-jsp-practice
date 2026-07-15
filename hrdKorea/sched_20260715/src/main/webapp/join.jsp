<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1 align="center">일정등록</h1>

<form name="frm" method="post" action="">
<table border="1" align="center">
	<tr>
		<td>일련번호(자동발생)</td>
		<td>
			<input type="text" name="pk_schedule">
		</td>
	</tr>
	<tr>
		<td>일정일자</td>
		<td>
			<input type="text" name="do_date">
		</td>
	</tr>
	<tr>
		<td>회원번호</td>
		<td>
			<input type="text" name="fk_member">
		</td>
	</tr>
	<tr>
		<td>일정메모</td>
		<td>
			<input type="text" name="do_memo">
		</td>
	</tr>


</table>
</form>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>