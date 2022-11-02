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
			<td>Field_ID</td><td>location</td><td>area</td><td>variety</td><td>vineyard_ID</td><td>Modify</td><td>Buy</td>
		</tr>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
			String dbUser = "root";
			String dbPass = "12345";
			String search_ID = request.getParameter("search_ID");
			String new_vineyard_ID = request.getParameter("new_vineyard_ID");
		
			System.out.println(search_ID);
			System.out.println(new_vineyard_ID);
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(
					"SELECT * FROM FIELD WHERE vineyard_ID =  \"" + search_ID+ "\"");
			
			rs = stmt.executeQuery();
			
			System.out.println(rs + "<-- rs field_show.jsp");
		
			while(rs.next()){
				
				String Field_ID = rs.getString("Field_ID");
				int area = rs.getInt("area");
%>
		<tr>
			<td><%= Field_ID%></td>
			<td><%= rs.getString("location")%></td>
			<td><%= area%></td>
			<td><%= rs.getString("variety")%></td>
			<td><%= rs.getString("vineyard_ID")%></td>
			<td><button type="button" onclick="location.href='../field/field_modify_form.jsp?Field_ID=<%=Field_ID%>'">MODIFY</button></td>
			<td><button type="button" onclick="location.href='buy_unowned_field.jsp?vineyard_ID=<%=new_vineyard_ID%>&Field_ID=<%=Field_ID%>&area=<%=area%>'">buy</button></td>
		</tr>
					
<%
			}
			
%>
			
			
			</table>
			<button type="button" onclick="location.href='search_own_fields.jsp?search_ID=<%=""%>&new_vineyard_ID=<%=new_vineyard_ID%>'">show not owned fields</button>
			<button type="button" onclick="location.href='../main_form.jsp'">return to main</button>
			<button type="button" onclick="location.href='../field/field_insert_form.jsp'">insert field</button>
		</body>
		</html>


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