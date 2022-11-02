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
<title>Wine Production for modify</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	WIne Production for modify<br>

	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String WP_ID=request.getParameter("WP_ID");
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(
					"SELECT * FROM WINEPRODUCTION WHERE WP_ID=\""+WP_ID+"\"");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs wineproduction_modify_form.jsp");
		rs.next();
			
%>
	<form action="<%=request.getContextPath() %>/wineproduction/wine_production_modify.jsp">
		<table border = "1">
			<tr>
				<td>WP_ID</td>
				<td><input type="text" name="WP_ID" value=<%=rs.getString("WP_ID") %> required size="10"></td>
			<tr>
			<tr>
				<td>category_ID</td>
				<td><input type="text" name="category_ID" value=<%=rs.getString("category_ID") %> size="20"></td>
			<tr>
			<tr>
				<td>year</td>
				<td><input type="text" name="year" value=<%=rs.getString("year") %> size="11"></td>
			<tr>
			<tr>
				<td>amount</td>
				<td><input type="number" name="amount" value=<%=rs.getString("amount") %> size="11"></td>
			<tr>
			<tr>
				<td>winery_ID</td>
				<td><input type="text" name="winery_ID" value=<%=rs.getString("winery_ID") %> size="10"></td>
			<tr>
			<tr>
				<td colspan="5"><input type="submit" value="modify button"></td>
				<td colspan="5"><button type="button" onclick="location.href='../main_form.jsp'">return to main</button></td>
			</tr>
		</table>
	</form>		
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
	
</body>
</html>
