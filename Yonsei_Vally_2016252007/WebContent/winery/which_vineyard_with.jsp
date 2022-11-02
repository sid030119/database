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
<title>which vineyard you work with</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	vineyard list<br>
	<table width="100%" border="1">
		<tr>
			<td>vineyard_ID</td><td>owner</td><td>address</td><td>tel_number</td><td>inv_white</td><td>inv_red</td><td>money</td><td>select</td>
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
			System.out.println(winery_ID);
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(
					"SELECT * FROM vineyard");
			
			rs = stmt.executeQuery();
			
			
			System.out.println(rs + "<-- rs vineyard_show.jsp");
		
			while(rs.next()){
				
				String vineyard_ID = rs.getString("vineyard_ID");
				
%>
		<tr>
			<td><%= vineyard_ID%></td>
			<td><%= rs.getString("owner")%></td>
			<td><%= rs.getString("address")%></td>
			<td><%= rs.getString("tel_number")%></td>
			<td><%= rs.getString("inv_white")%></td>
			<td><%= rs.getString("inv_red")%></td>
			<td><%= rs.getString("money")%></td>
			<td><button type="button" onclick="location.href='select_vineyard_id.jsp?winery_ID=<%=winery_ID%>&vineyard_ID=<%=vineyard_ID%>'">select</button></td>
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
	<button type="button" onclick="location.href='vineyard_insert_form.jsp'">insert vineyard</button>
</body>
</html>
