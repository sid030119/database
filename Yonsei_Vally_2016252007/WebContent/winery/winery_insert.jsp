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
	String vineyard_ID="";
	
	System.out.println(winery_ID + "<-- winery_ID /winery_insert.jsp");
	System.out.println(owner + "<-- owner /winery_insert.jsp");
	System.out.println(address + "<-- address /winery_insert.jsp");
	System.out.println(tel_number + "<-- tel_number /winery_insert.jsp");
	System.out.println(inv_white + "<-- inv_white /winery_insert.jsp");
	System.out.println(inv_red + "<-- inv_red /winery_insert.jsp");
	System.out.println(money + "<-- money /winery_insert.jsp");
	System.out.println(grade_ID + "<-- grade_ID /winery_insert.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"INSERT INTO winery VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		System.out.println(stmt + "<-- stmt 1");
		System.out.println(stmt.getClass() + "<-- stmt.getClass() 1");
		
		stmt.setString(1, winery_ID);
		stmt.setString(2, owner);
		stmt.setString(3, address);
		stmt.setString(4, tel_number);
		stmt.setString(5, inv_white);
		stmt.setString(6, inv_red);
		stmt.setString(7, money);
		stmt.setString(8, grade_ID);
		stmt.setString(9, vineyard_ID);
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

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vineyard insert success</title>
</head>
<body>
	<%
	response.sendRedirect("which_vineyard_with.jsp?winery_ID="+winery_ID);
	%>
</body>
</html>