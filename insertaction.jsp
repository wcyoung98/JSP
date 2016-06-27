<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String db_name = request.getParameter("name");
int db_age = Integer.parseInt(request.getParameter("age"));
Connection con = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment", "root", "apmsetup");
	String query = "insert into member values(?,?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setString(1, db_name);
	pstmt.setInt(2, db_age);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
}catch (Exception e){
	e.printStackTrace();
}
%>
<script>location.href='index.jsp';</script>
</body>
</html>