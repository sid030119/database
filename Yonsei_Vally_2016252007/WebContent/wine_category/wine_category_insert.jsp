<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>    
<%@ page import = "java.sql.ResultSet" %>
 
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs=null;
	
	String category_ID = request.getParameter("category_ID");
	String title = request.getParameter("title");
	String standardPrice = request.getParameter("standardPrice");
	
	System.out.println(category_ID + "<-- category_ID /wine_category_insert.jsp");
	System.out.println(title + "<-- title /wine_category_insert.jsp");
	System.out.println(standardPrice + "<-- standardPrice /wine_category_insert.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"INSERT INTO winecategory VALUES (?, ?, ?)");
		System.out.println(stmt + "<-- stmt 1");
		System.out.println(stmt.getClass() + "<-- stmt.getClass() 1");
		
		stmt.setString(1, category_ID);
		stmt.setString(2, title);
		stmt.setString(3, standardPrice);
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