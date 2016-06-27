<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String[] name = request.getParameterValues("checkbox");
	Connection con = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment", "root", "apmsetup");
		String query = "delete from member where name = '"+name[0]+"'";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}catch(Exception e){
	e.printStackTrace();
	}
%>
<script>location.href='index.jsp';</script>
</body>
</html>