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
	
	System.out.println(field_ID + "<-- Field_ID /field_modify.jsp");
	System.out.println(location + "<-- location /field_modify.jsp");
	System.out.println(area + "<-- area /field_modify.jsp");
	System.out.println(variety + "<-- variety /field_modify.jsp");
	System.out.println(vineyard_ID + "<-- vineyard_ID /field_modify.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"UPDATE field SET field_id=\""+field_ID+"\", location=\""+location+
				"\", area=\""+area+"\", variety=\""+variety+"\", vineyard_id=\""+vineyard_ID
				+"\" WHERE FIELD_ID=\""+field_ID+"\"");
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
<title>field modify success</title>
</head>
<body>
	
</body>
</html>