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


	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
		String new_vineyard_ID = request.getParameter("new_vineyard_ID");
		String Field_ID = request.getParameter("Field_ID");
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"UPDATE field SET vineyard_ID=\""+new_vineyard_ID+
				"\" WHERE FIELD_ID=\""+Field_ID+"\"");
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
	pageContext.forward("../vineyard/select_owned_fields.jsp");
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