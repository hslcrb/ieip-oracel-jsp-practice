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
<h1 align="center">일정현황</h1>
<table border="1" align="center">
	<tr>
		<td>일정코드 </td>
		<td>일정일자 </td>
		<td>일정메모 </td>
		<td>회원코드 </td>
		<td>회원명 </td>
	</tr>
	
	
	<%
	String sql = "select sc.pk_schedulem, sc.do_date, sc.do_memo, sc.fk_member, me.name "
				+"from tbl_schedule.sc JOIN tbl_member.me "
				+"on sc.fk_member = me.pk_member ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
	%>
	
	
	
	<%
	}
	
	%>
	
</table>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>