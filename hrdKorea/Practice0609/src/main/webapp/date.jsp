<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pk_schedule = request.getParameter("pk_schedule");
String do_date = request.getParameter("do_date");
String fk_member = request.getParameter("fk_member");
String do_memo = request.getParameter("do_memo");

String sql = "insert into tbl_schedule values(?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, pk_schedule);
pstmt.setString(2, do_date);
pstmt.setString(3, do_memo);
pstmt.setString(4, fk_member);

pstmt.executeUpdate();
%>





</body>
</html>