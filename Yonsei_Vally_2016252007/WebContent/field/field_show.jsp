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
<title>Field list</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	Field list<br>
	<table width="100%" border="1">
		<tr>
			<td>Field_ID</td><td>location</td><td>area</td><td>variety</td><td>vineyard_ID</td><td>MODIFY</td>
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
		
			while(rs.next()){
				
				String Field_ID=rs.getString("Field_ID");
				int area = rs.getInt("area");
%>				
		<tr>
			<td><%= Field_ID%></td>
			<td><%= rs.getString("location")%></td>
			<td><%= area%></td>
			<td><%= rs.getString("variety")%></td>
			<td><%= rs.getString("vineyard_ID")%></td>
			<td><button type="button" onclick="location.href='../field/field_modify_form.jsp?Field_ID=<%=Field_ID%>'">MODIFY</button></td>
			<td><button type="button" onclick="location.href='../grapeproduction/grape_production_insert.jsp?Field_ID=<%=Field_ID%>&amount=<%=area%>'">PRODUCTION</button></td>
			<td><button type="button" onclick="location.href='../field/field_more_information.jsp?Field_ID=<%=Field_ID%>'">MORE_INFO</button></td>
			
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
	<button type="button" onclick="location.href='field_insert_form.jsp'">insert field</button>
</body>
</html>
