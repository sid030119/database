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
	PreparedStatement stmt4 = null;
	
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_vally";
		String dbUser = "root";
		String dbPass = "12345";
		String winery_ID=request.getParameter("winery_ID");
		String category_ID = request.getParameter("category_ID");
		
		System.out.println("winery_ID");
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		stmt1 = conn.prepareStatement(
				"SELECT count(*) as count FROM wineproduction"); 
				
		
		System.out.println(stmt1 + "<-- stmt 1");
		System.out.println(stmt1.getClass() + "<-- stmt1.getClass() 1");
		
		
		rs1=stmt1.executeQuery();
		
		rs1.next();
		
		int WP_ID = rs1.getInt("count")+1;
		System.out.println(WP_ID);
		stmt2 = conn.prepareStatement(
				"SELECT inv_red, inv_white FROM winery where winery_ID=\""+winery_ID+"\""); 
		
		System.out.println(stmt2 + "<-- stmt 1");
		System.out.println(stmt2.getClass() + "<-- stmt1.getClass() 1");
		
		rs2 = stmt2.executeQuery();
		rs2.next();
		
		int inv_red, inv_white;
		
		inv_red = rs2.getInt("inv_red");
		inv_white = rs2.getInt("inv_white");
		
		if(category_ID=="1"&&inv_red<1)
		{%>
				<meta http-equiv="refresh" content="5;url=../main_form">
				포도의 잔여량이 낮아 만들 수 없습니다. 메인으로 이동합니다.
<%		}
		else if(category_ID=="2"&&inv_white<1)
		{%>
		<meta http-equiv="refresh" content="5;url=../main_form">
		포도의 잔여량이 낮아 만들 수 없습니다. 메인으로 이동합니다.
<%		}
		else if(category_ID=="3"&&inv_red<1||category_ID=="3"&&inv_white<1){
		%>
		<meta http-equiv="refresh" content="5;url=../main_form">
		포도의 잔여량이 낮아 만들 수 없습니다. 메인으로 이동합니다.
<%	
		}
		else if(category_ID=="4"&&inv_red<2||category_ID=="4"&&inv_white<1){
		%>
		<meta http-equiv="refresh" content="5;url=../main_form">
		포도의 잔여량이 낮아 만들 수 없습니다. 메인으로 이동합니다.
<%		
		}
		else{}
		int year=2021;
		int amount = 1;
		stmt3 = conn.prepareStatement(
				"INSERT INTO wineproduction VALUES ("+WP_ID+", \""+category_ID+"\", "+year+", "+amount+", \""+winery_ID+"\")");

		System.out.println(stmt3 + "<-- stmt 2");
		System.out.println(stmt3.getClass() + "<-- stmt2.getClass() 2");
		
		stmt3.executeUpdate();
		
		int use_red=0, use_white=0;
		if(category_ID.equals("1")){use_red=1; use_white=0;}
		else if(category_ID.equals("2")){use_red=0; use_white=1;}
		else if(category_ID.equals("3")){use_red=1; use_white=1;}
		else if(category_ID.equals("4")){use_red=2; use_white=1;}
		else{%><meta http-equiv="refresh" content="5;url=../main_form"><%}
		
		stmt4 = conn.prepareStatement(
				"UPDATE WINERY SET inv_red="+(inv_red-use_red)+
				", inv_white="+(inv_white-use_white)+ " WHERE winery_ID=\""+winery_ID+"\"");
		
		System.out.println(stmt4 + "<-- stmt 2");
		System.out.println(stmt4.getClass() + "<-- stmt2.getClass() 2");
		
		
		rs4=stmt4.executeQuery();
		
		
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
	
	response.sendRedirect("wine_production_show.jsp");
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wineproduction insert success</title>
</head>
<body>
	
</body>
</html>