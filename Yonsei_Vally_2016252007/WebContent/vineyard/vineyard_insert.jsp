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
	
	System.out.println(vineyard_ID + "<-- vineyard_ID /vineyard_insert.jsp");
	System.out.println(owner + "<-- owner /vineyard_insert.jsp");
	System.out.println(address + "<-- address /vineyard_insert.jsp");
	System.out.println(tel_number + "<-- tel_number /vineyard_insert.jsp");
	System.out.println(inv_white + "<-- inv_white /vineyard_insert.jsp");
	System.out.println(inv_red + "<-- inv_red /vineyard_insert.jsp");
	System.out.println(money + "<-- money /vineyard_insert.jsp");
	
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.prepareStatement(
				"INSERT INTO vineyard VALUES (?, ?, ?, ?, ?, ?, ?)");
		System.out.println(stmt + "<-- stmt 1");
		System.out.println(stmt.getClass() + "<-- stmt.getClass() 1");
		
		stmt.setString(1, vineyard_ID);
		stmt.setString(2, owner);
		stmt.setString(3, address);
		stmt.setString(4, tel_number);
		stmt.setString(5, inv_white);
		stmt.setString(6, inv_red);
		stmt.setString(7, money);
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
<title>vineyard insert success choose to buy not owned fields</title>

</head>
<body>
	<%
	response.sendRedirect("select_owned_fields.jsp?&new_vineyard_ID="+vineyard_ID);
	%>
</body>
</html>