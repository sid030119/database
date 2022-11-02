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
<title>select vineyard_id</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement stmt1 = null;
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
		
		
		String vineyard_ID = request.getParameter("vineyard_ID");
		String winery_ID = request.getParameter("winery_ID");
		
		
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt1 = conn.prepareStatement(
				"UPDATE winery SET vineyard_ID=\"" + vineyard_ID +"\" WHERE winery_ID=\"" + winery_ID + "\"");
		System.out.println(stmt1 + "<-- stmt 1");
		System.out.println(stmt1.getClass() + "<-- stmt.getClass() 1");
		
		
		stmt1.executeUpdate();
		
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