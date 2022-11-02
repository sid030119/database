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
<title>winery_more_info</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	Winery more information<br>
	<table width="100%" border="1">
		<tr>
			<td>winery_ID</td><td>inv_white</td><td>inv_red</td><td>money</td><td>grade_ID</td><td>vineyard_ID</td>
		</tr>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String winery_ID=request.getParameter("winery_ID");
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(
					"SELECT * FROM winery where winery_ID=\""+winery_ID+"\"");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs winery_more_info.jsp");
		
			
			rs.next();
				
				
%>
		<tr>
			<td><%= winery_ID%></td>
			<td><%= rs.getString("inv_white")%></td>
			<td><%= rs.getString("inv_red")%></td>
			<td><%= rs.getString("money")%></td>
			<td><%= rs.getString("grade_ID")%></td>
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
