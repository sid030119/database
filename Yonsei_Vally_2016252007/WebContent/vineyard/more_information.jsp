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
<title>More information</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	more information<br>
	<table width="100%" border="1">
		<tr>
			<td>vineyard_ID</td><td>총 생산량</td><td>white_생산량</td><td>red_생산량</td><td>inv_white</td><td>inv_red</td>
		</tr>
	<%
		Connection conn = null;
		PreparedStatement stmt1 = null;
		PreparedStatement stmt2 = null;
		PreparedStatement stmt3 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String vineyard_ID = request.getParameter("vineyard_ID");
		
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt1 = conn.prepareStatement(
					"SELECT *, sum(area) FROM vineyard natural join field where vineyard_ID=\"" + vineyard_ID + "\"  group by vineyard_ID");
			
			stmt2 = conn.prepareStatement(
					"SELECT vineyard_ID, sum(area) as white FROM vineyard natural join field where vineyard_ID=\"" + vineyard_ID + "\" AND variety=\"white\" group by vineyard_ID");
			
			stmt3 = conn.prepareStatement(
					"SELECT vineyard_ID, sum(area) as red FROM vineyard natural join field where vineyard_ID=\"" + vineyard_ID + "\" AND variety=\"red\" group by vineyard_ID");
			
			System.out.println(stmt1 + "<-- stmt1 vineyard_show.jsp");
			System.out.println(stmt2 + "<-- stmt2 vineyard_show.jsp");
			System.out.println(stmt3 + "<-- stmt3 vineyard_show.jsp");
			
			rs1 = stmt1.executeQuery();
			rs2 = stmt2.executeQuery();
			rs3 = stmt3.executeQuery();
			
			System.out.println(rs1 + "<-- rs vineyard_show.jsp");
			System.out.println(rs2 + "<-- rs vineyard_show.jsp");
			System.out.println(rs3 + "<-- rs vineyard_show.jsp");
		
			while(rs1.next()&&rs2.next()&&rs3.next()){
				
%>
		<tr>
			<td><%= rs1.getString("vineyard_ID")%></td>
			<td><%= rs1.getString("sum(area)")%></td>
			<td><%= rs2.getString("white")%></td>
			<td><%= rs3.getString("red")%></td>
			<td><%= rs1.getString("inv_white")%></td>
			<td><%= rs1.getString("inv_red")%></td>
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
