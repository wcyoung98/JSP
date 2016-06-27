<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function oneCheckBox(a){
		var obj = document.getElementsByName("checkbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
                obj[i].checked = false;
            }
        }
	}
	function deleteCheck(){
		confirm("정말로 삭제하시겠습니까?");
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td>체크</td>
			<td>이름</td>
		</tr>
		<form action="deleteaction.jsp">
<%
	Connection con = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment", "root", "apmsetup");
		String query = "select name from member";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String name = rs.getString("name");
%>
		<tr>
			<td><input type="checkbox" name="checkbox" value=<%=name%> onclick="oneCheckBox(this)" /></td>
			<td><a href="view.jsp?name=<%=name%>"><%=name%></a></td>
		</tr>
<% 
		}
		pstmt.close();
		con.close();
	}catch(Exception e){
	e.printStackTrace();
	}
%>
	</table>
	<a href="insert.jsp">추가하기</a>
	<input type="submit" value="삭제하기" onclick="deleteCheck()" />
	</form>
</body>
</html>