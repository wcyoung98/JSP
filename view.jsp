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
String get = request.getParameter("name");
Connection con = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment", "root", "apmsetup");
	String query = "select name, age from member where name = '"+get+"'";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
	String name = "";
	String age = "";
	while(rs.next()){
		name = rs.getString("name");
		age = rs.getString("age");
%>
	<p>
		<span>이름 : </span>
		<span><%= name %></span>
	</p>
	<p>
		<span>나이 : </span>
		<span><%= age %></span>
	</p>
	<% 
		}
	pstmt.close();
	con.close();
	}catch(Exception e){
	e.printStackTrace();
	}
%>
</body>
</html>