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
<title>winery for modify</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	winery for modify<br>

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
					"SELECT * FROM winery WHERE winery_ID=\""+winery_ID+"\"");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs winery_modify_form.jsp");
		rs.next();
			
%>
	<form action="<%=request.getContextPath() %>/winery/winery_modify.jsp">
		<table border = "1">
			<tr>
				<td>winery_ID</td>
				<td><input type="text" name="winery_ID" value=<%=rs.getString("winery_ID") %> required size="10"></td>
			<tr>
			<tr>
				<td>owner</td>
				<td><input type="text" name="owner" value=<%=rs.getString("owner") %> size="10"></td>
			<tr>
			<tr>
				<td>address</td>
				<td><input type="text" name="address" value=<%=rs.getString("address") %> size="20"></td>
			<tr>
			<tr>
				<td>tel_number</td>
				<td><input type="text" name="tel_number" value=<%=rs.getString("tel_number") %> size="20"></td>
			<tr>
			<tr>
				<td>inv_white</td>
				<td><input type="number" name="inv_white" value=<%=rs.getString("inv_white") %> size="11"></td>
			<tr>
			<tr>
				<td>inv_red</td>
				<td><input type="number" name="inv_red" value=<%=rs.getString("inv_red") %> size="11"></td>
			<tr>
			<tr>
				<td>money</td>
				<td><input type="number" name="money" value=<%=rs.getString("money") %> size="11"></td>
			<tr>
			<tr>
				<td>grade_ID</td>
				<td><input type="number" name="grade_ID" value=<%=rs.getString("grade_ID") %> size="11"></td>
			<tr>
			<tr>
				<td>money</td>
				<td><input type="text" name="vineyard_ID" value=<%=rs.getString("vineyard_ID") %> size="11"></td>
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
