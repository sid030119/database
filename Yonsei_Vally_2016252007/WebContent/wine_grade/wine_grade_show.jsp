<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>    
<%@ page import = "java.sql.ResultSet" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Wine Grade List</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	Field list<br>
	<table width="100%" border="1">
		<tr>
			<td>Grade_ID</td><td>title</td><td>ratio</td>
		</tr>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
		
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(
					"SELECT * FROM WineGrade");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs wine_grade_show.jsp");
		
			while(rs.next()){
%>
		<tr>
			<td><%= rs.getString("grade_ID")%></td>
			<td><%= rs.getString("title")%></td>
			<td><%= rs.getString("ratio")%></td>
		</tr>
					
<%
			}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	%>
	
	
	</table>
	<button type="button" onclick="location.href='../main_form.jsp'">return to main</button>
	<button type="button" onclick="location.href='wine_grade_insert_form.jsp'">insert wine category</button>
</body>
</html>
