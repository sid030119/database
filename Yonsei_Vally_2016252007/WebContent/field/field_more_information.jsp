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
<title>field_more_info</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	Field more information<br>
	<img src="../field.jpg" width="30%" heigh="10%" align="middle">
	<table width="100%" border="1">
		<tr>
			<td>Field_ID</td><td>location</td><td>area</td><td>variety</td><td>vineyard_ID</td>
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
					"SELECT * FROM FIELD");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs field_show.jsp");
		
			String Field_ID=request.getParameter("Field_ID");
			rs.next();
				
				
%>
		<tr>
			<td><%= Field_ID%></td>
			<td><%= rs.getString("location")%></td>
			<td><%= rs.getString("area")%></td>
			<td><%= rs.getString("variety")%></td>
			<td><%= rs.getString("vineyard_ID")%></td>
			
		</tr>
					
<%
			

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
</body>
</html>
