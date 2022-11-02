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
<title>WineProduction list</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	WineProduction list<br>
	<table width="100%" border="1">
		<tr>
			<td>WP_ID</td><td>category_ID</td><td>year</td><td>amount</td><td>winery_ID</td>
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
					"SELECT * FROM WINEPRODUCTION");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs wine_production_show.jsp");
		
			while(rs.next()){
				
				int WP_ID = rs.getInt("WP_ID");
%>				
		<tr>
			<td><%= rs.getString("WP_ID")%></td>
			<td><%= rs.getString("category_ID")%></td>
			<td><%= rs.getString("year")%></td>
			<td><%= rs.getString("amount")%></td>
			<td><%= rs.getString("winery_ID")%></td>
			<td><button type="button" onclick="location.href='../wineproduction/wine_production_modify_form.jsp?WP_ID=<%=WP_ID%>'">MODIFY</button></td>
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
</body>
</html>
