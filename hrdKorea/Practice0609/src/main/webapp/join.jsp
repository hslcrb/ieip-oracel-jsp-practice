<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>

<h1 align="center">일정등록</h1>

<%-- 도미니카공화국의 특산품은 무엇일까 --%>
<form name="frm" method="post" action="joinok.jsp">
<table align="center" name="식탁" border="1">
<tr>
	<td align="center">일련번호(자동발생)</td>
	<td><input type=text ></td>
</tr>



</table>


</form>
</body>
</html>