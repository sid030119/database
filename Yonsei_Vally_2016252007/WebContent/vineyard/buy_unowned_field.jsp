<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buy unowned field</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement stmt1 = null;
	PreparedStatement stmt2 = null;
	

	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
		
		
		
		String vineyard_ID = request.getParameter("vineyard_ID");
		String Field_ID = request.getParameter("Field_ID");
		int price = Integer.parseInt(request.getParameter("area"));
		
		
	
		if(vineyard_ID==null){
			%>
			<form action="<%=request.getContextPath() %>/vineyard/buy_unowned_field.jsp">
			<table>
			<tr>
				<td>vineyard_ID</td>
				<td><input type="text" name="new_vineyard_ID" size="10"></td>
			</tr>
			<tr>
				<td>Field_ID</td>
				<td><input type="hidden" name="Field_ID" value=<%=Field_ID %>></td>
			</tr>
			<tr>
				<td colspan="5"><input type="submit" value="buy field"></td>
			</tr>
			</table>
			</form>
			<%
		}
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt1 = conn.prepareStatement(
				"UPDATE field SET vineyard_ID=\"" + vineyard_ID +"\" WHERE Field_ID=\"" + Field_ID + "\"");
		System.out.println(stmt1 + "<-- stmt 1");
		System.out.println(stmt1.getClass() + "<-- stmt.getClass() 1");
		
		
		stmt1.executeUpdate();
		
		
		stmt2 = conn.prepareStatement(
				"UPDATE vineyard SET money=money-10*" + price + " WHERE vineyard_ID=\"" + vineyard_ID + "\"");
		System.out.println(stmt2 + "<-- stmt 2");
		System.out.println(stmt2.getClass() + "<-- stmt.getClass() 2");
		
		
		
	
		
		
		
		stmt2.executeUpdate();
		
		System.out.println("update success!");
	
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	response.sendRedirect("../main_form.jsp");
%>

</body>
</html>