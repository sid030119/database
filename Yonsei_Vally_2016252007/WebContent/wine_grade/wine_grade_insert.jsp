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

	String grade_ID = request.getParameter("grade_ID");
	String title = request.getParameter("title");
	String ratio = request.getParameter("ratio");
	
	System.out.println(grade_ID + "<-- grade_ID /wine_grade_insert.jsp");
	System.out.println(title + "<-- title /wine_grade_insert.jsp");
	System.out.println(ratio + "<-- ratio /wine_grade_insert.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"INSERT INTO winegrade VALUES (?, ?, ?)");
		System.out.println(stmt + "<-- stmt 1");
		System.out.println(stmt.getClass() + "<-- stmt.getClass() 1");
		
		stmt.setString(1, grade_ID);
		stmt.setString(2, title);
		stmt.setString(3, ratio);
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