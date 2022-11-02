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
<title>field for modify</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	field for modify<br>

	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String Field_ID=request.getParameter("Field_ID");
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(
					"SELECT * FROM FIELD WHERE FIELD_ID=\""+Field_ID+"\"");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs field_show.jsp");
		rs.next();
			
%>
	<form action="<%=request.getContextPath() %>/field/field_modify.jsp">
		<table border = "1">
			<tr>
				<td>Field_ID</td>
				<td><input type="text" name="Field_ID" value=<%=rs.getString("Field_ID") %> required size="10"></td>
			<tr>
			<tr>
				<td>location</td>
				<td><input type="text" name="location" value=<%=rs.getString("location") %> size="20"></td>
			<tr>
			<tr>
				<td>area</td>
				<td><input type="number" name="area" value=<%=rs.getString("area") %> size="11"></td>
			<tr>
			<tr>
				<td>variety</td>
				<td><input type="text" name="variety" value=<%=rs.getString("variety") %> size="10"></td>
			<tr>
			<tr>
				<td>vineyard_ID</td>
				<td><input type="text" name="vineyard_ID" value=<%=rs.getString("vineyard_ID") %> size="10"></td>
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
