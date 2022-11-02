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

	String field_ID = request.getParameter("Field_ID");
	String location = request.getParameter("location");
	String area = request.getParameter("area");
	String variety = request.getParameter("variety");
	String vineyard_ID = request.getParameter("vineyard_ID");
	
	System.out.println(field_ID + "<-- Field_ID /field_insert.jsp");
	System.out.println(location + "<-- location /field_insert.jsp");
	System.out.println(area + "<-- area /field_insert.jsp");
	System.out.println(variety + "<-- variety /field_insert.jsp");
	System.out.println(vineyard_ID + "<-- vineyard_ID /field_insert.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"INSERT INTO field VALUES (?, ?, ?, ?, ?)");
		System.out.println(stmt + "<-- stmt 1");
		System.out.println(stmt.getClass() + "<-- stmt.getClass() 1");
		
		stmt.setString(1, field_ID);
		stmt.setString(2, location);
		stmt.setString(3, area);
		stmt.setString(4, variety);
		stmt.setString(5, vineyard_ID);
		System.out.println(stmt + "<-- stmt 2");
		
		stmt.executeUpdate();
		
		System.out.println("insert success!");
	
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
<title>field insert success</title>
</head>
<body>
	
</body>
</html>