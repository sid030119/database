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

	String vineyard_ID = request.getParameter("vineyard_ID");
	String owner = request.getParameter("owner");
	String address = request.getParameter("address");
	String tel_number = request.getParameter("tel_number");
	String inv_white = request.getParameter("inv_white");
	String inv_red = request.getParameter("inv_red");
	String money = request.getParameter("money");
	
	System.out.println(vineyard_ID + "<-- vineyard_ID /vineyard_modify.jsp");
	System.out.println(owner + "<-- owner /vineyard_modify.jsp");
	System.out.println(address + "<-- area /vineyard_modify.jsp");
	System.out.println(tel_number + "<-- variety /vineyard_modify.jsp");
	System.out.println(inv_white + "<-- inv_white /vineyard_modify.jsp");
	System.out.println(inv_red + "<-- inv_red /vineyard_modify.jsp");
	System.out.println(money + "<-- money /vineyard_modify.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"UPDATE vineyard SET vineyard_id=\""+vineyard_ID+"\", owner=\""+owner+
				"\", address=\""+address+"\", tel_number=\""+tel_number+"\", inv_white="+
				inv_white+", inv_red="+inv_red+", money="+
				money+" WHERE vineyard_ID=\""+vineyard_ID+"\"");
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
<title>vineyard modify success</title>
</head>
<body>
	
</body>
</html>