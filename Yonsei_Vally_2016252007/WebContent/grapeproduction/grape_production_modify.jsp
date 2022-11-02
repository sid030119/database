<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>    
    
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement stmt = null;

	int GP_ID = Integer.parseInt(request.getParameter("GP_ID"));
	int year = Integer.parseInt(request.getParameter("year"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	String field_ID = request.getParameter("vineyard_ID");
	
	System.out.println(GP_ID + "<-- GP_ID /grape_production_modify.jsp");
	System.out.println(year + "<-- year /grape_production_modify.jsp");
	System.out.println(amount + "<-- amount /grape_production_modify.jsp");
	System.out.println(field_ID + "<-- field_ID /grape_production_modify.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"UPDATE field SET GP_ID=\""+GP_ID+"\", year=\""+year+
				"\", amount=\""+amount+"\", field_id=\""+field_ID
				+"\" WHERE GP_ID=\""+GP_ID+"\"");
		System.out.println(stmt + "<-- stmt 1");
		System.out.println(stmt.getClass() + "<-- stmt.getClass() 1");
		
		stmt.executeUpdate();
		
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



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>grape production modify success</title>
</head>
<body>
	
</body>
</html>