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
<jsp:include page="header.jsp"></jsp:include>
<h1 align="center">일정등록</h1>
<%
String sql = "select max(pk_schedule)+1 as pk_schedule from tbl_schedule ";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
while(rs.next()){
%>

<form name="frm" method="post" action="joinok.jsp">
<table align="center" name="식탁" border="1">
<tr>
	<td align="center">일련번호(자동발생)</td>
	<td><input type="text" name="pk_schedule" value=" <%= rs.getString("pk_schedule") %>" ></td>
</tr>
<tr>
	<td align="center">일정일자</td>
	<td><input type="text" name="do_date" ></td>
</tr>
<tr>
	<td align="center">회원번호</td>
	<td><input type="text" name="fk_member" ></td>
</tr>

<tr>
	<td align="center">일정메모</td>
	<td><input type="text" name="do_memo" ></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="등록" onclick="return chk();">
	<input type="button" value="조회" onclick="location.href='list.jsp'">
	</td>
</tr>
<%
}
%>

</table>
</form>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>