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
	PreparedStatement stmt3 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;

	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		int red_grape = Integer.parseInt(request.getParameter("red_grape"));
		int white_grape = Integer.parseInt(request.getParameter("white_grape"));
		String winery_ID = request.getParameter("winery_ID");
		
		stmt1 = conn.prepareStatement("select vineyard_ID from winery where winery_ID=\""
				+winery_ID+"\"");
		
		System.out.println(stmt1);

		rs1=stmt1.executeQuery();
		rs1.next();
		
		String vineyard_ID = rs1.getString("vineyard_ID");
		
		stmt2= conn.prepareStatement("UPDATE vineyard SET inv_red=inv_red-"+(red_grape)+
				", inv_white=inv_white-"+(white_grape)+", money=money+"+(red_grape+white_grape));
		
		System.out.println(stmt2);
		
		rs2= stmt2.executeQuery();
		
		stmt3 = conn.prepareStatement("UPDATE winery SET inv_red=inv_red+"+red_grape+
				", inv_white=inv_white+"+white_grape+", money=money-"+(white_grape+red_grape));
				
		System.out.println(stmt3);
		
		rs3=stmt3.executeQuery();
		
		
		System.out.println("Perchase success!");
	
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