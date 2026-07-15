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

<%-- 자동 발생 로직 --%>

<form name="frm" method="post" action="">
<table border="1" align="center">
	<tr>
		<td align="center">일련번호(자동발생)</td>
		<td>
			<input type="text" name="pk_schedule">
		</td>
	</tr>
	<tr>
		<td align="center">일정일자</td>
		<td>
			<input type="text" name="do_date">(ex: 25년 1월 1일 > 20250101)
		</td>
	</tr>
	<tr>
		<td align="center">회원번호</td>
		<td>
			<input type="text" name="fk_member">(ex: M0001)
		</td>
	</tr>
	<tr>
		<td align="center">일정메모</td>
		<td>
			<input type="text" name="do_memo">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="등록" onclick="return chk()"> <%-- 아직 함수 없음. chk. --%>
			<input type="button" value="조회" onclick="location.href='index.jsp'"> <%-- 아직 파일 없어서 대체로 index.jsp로 함. --%>
		</td>
	</tr>


</table>
</form>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>