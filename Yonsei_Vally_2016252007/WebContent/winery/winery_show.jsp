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
<title>winery list</title>
</head>

<body>
	<%= request.getRequestURI() %> <br>
	winery list<br>
	<table width="100%" border="1">
		<tr>
			<td>winery_ID</td><td>owner</td><td>address</td><td>tel_number</td><td>수정</td><td>구매</td><td>생산</td><td>판매</td><td>MORE_INFO</td>
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
					"SELECT * FROM winery");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs vineyard_show.jsp");
		
			while(rs.next()){
				
				String winery_ID = rs.getString("winery_ID");
%>
		<tr>
			<td><%= winery_ID%></td>
			<td><%= rs.getString("owner")%></td>
			<td><%= rs.getString("address")%></td>
			<td><%= rs.getString("tel_number")%></td>
			<td><button type="button" onclick="location.href='../winery/winery_modify_form.jsp?winery_ID=<%=winery_ID%>'">MODIFY</button></td>
			<td><button type="button" onclick="location.href='../winery/winery_perchase_form.jsp?winery_ID=<%=winery_ID%>'">PERCHASE</button></td>
			<td><button type="button" onclick="location.href='../wineproduction/wine_production_insert_form.jsp?winery_ID=<%=winery_ID%>'">PRODUCTION</button></td>
			<td><button type="button" onclick="location.href='../winery/winery_sell_form.jsp?winery_ID=<%=winery_ID%>'">SELL</button></td>
			<td><button type="button" onclick="location.href='../winery/winery_more_information.jsp?winery_ID=<%=winery_ID%>'">MORE_INFO</button></td>
			
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
	<button type="button" onclick="location.href='winery_insert_form.jsp'">insert winery</button>
</body>
</html>
