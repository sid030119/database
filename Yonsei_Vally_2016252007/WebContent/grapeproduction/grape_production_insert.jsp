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
	PreparedStatement stmt1 = null;
	PreparedStatement stmt2 = null;
	
	ResultSet rs1 = null;
	ResultSet rs2 = null;

	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
		String Field_ID=request.getParameter("Field_ID");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		System.out.println("Field_ID");
		System.out.println("area");
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		stmt1 = conn.prepareStatement(
				"SELECT count(*) as count FROM grapeproduction"); 
				
		
		System.out.println(stmt1 + "<-- stmt 1");
		System.out.println(stmt1.getClass() + "<-- stmt1.getClass() 1");
		
		
		rs1=stmt1.executeQuery();
		
		rs1.next();
		int gp_ID = rs1.getInt("count")+1;
		int year = 2021;
		
		stmt2 = conn.prepareStatement(
				"INSERT INTO grapeproduction VALUES ("+gp_ID+", "+year+", "+amount+", \""+Field_ID+"\")");

		System.out.println(stmt2 + "<-- stmt 2");
		System.out.println(stmt2.getClass() + "<-- stmt2.getClass() 2");
		
		stmt2.executeUpdate();
		
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
	
	response.sendRedirect("grape_production_show.jsp");
	
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