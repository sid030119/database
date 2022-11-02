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

	String winery_ID = request.getParameter("winery_ID");
	String owner = request.getParameter("owner");
	String address = request.getParameter("address");
	String tel_number = request.getParameter("tel_number");
	String inv_white = request.getParameter("inv_white");
	String inv_red = request.getParameter("inv_red");
	String money = request.getParameter("money");
	String grade_ID = request.getParameter("grade_ID");
	String vineyard_ID = request.getParameter("vineyard_ID");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"UPDATE winery SET winery_id=\""+winery_ID+"\", owner=\""+owner+
				"\", address=\""+address+"\", tel_number=\""+tel_number+"\", inv_white=\""+
				inv_white+"\", inv_red=\""+inv_red+"\", money=\""+
				money+"\", grade_ID=\""+grade_ID+"\", vineyard_ID=\""+vineyard_ID+
				"\" WHERE winery_ID=\""+winery_ID+"\"");
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
<title>winery modify success</title>
</head>
<body>
	
</body>
</html>