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
	
	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		int red_wine = Integer.parseInt(request.getParameter("red_wine"));
		int white_wine = Integer.parseInt(request.getParameter("white_wine"));
		int blush_wine = Integer.parseInt(request.getParameter("blush_wine"));
		int sparkling_wine = Integer.parseInt(request.getParameter("sparkling_wine"));
		String winery_ID = request.getParameter("winery_ID");
		
		stmt1 = conn.prepareStatement("select grade_ID from winery where winery_ID=\""
				+winery_ID+"\"");
		
		System.out.println(stmt1);

		rs1=stmt1.executeQuery();
		rs1.next();
		
		int grade_ID = Integer.parseInt(rs1.getString("grade_ID"));
		double ratio = 4/Math.pow(2,grade_ID);
		int use_red = red_wine + blush_wine + 2*sparkling_wine;
		int use_white = white_wine + blush_wine + sparkling_wine;
		double earn = 10*(red_wine+white_wine) + 14*blush_wine + 20*sparkling_wine;
		
		
		stmt2 = conn.prepareStatement("UPDATE winery SET inv_red=inv_red-"+(use_red)+
				", inv_white=inv_white-"+(use_white)+", money=money+"+
		(ratio*earn)+" WHERE winery_ID=\""+winery_ID+"\"");
				
		System.out.println(stmt2+ "<-- stmt2");
		
		rs2=stmt2.executeQuery();
		
		
		
		for(int i=1;i<=4;i++){
			
			
			stmt3 = conn.prepareStatement(
					"SELECT count(*) as count FROM winetrade"); 
					
			
			System.out.println(stmt3 + "<-- stmt 1");
			System.out.println(stmt3.getClass() + "<-- stmt1.getClass() 1");
			
			
			rs3=stmt3.executeQuery();
			
			rs3.next();
			int count = rs3.getInt("count")+1;
	
		
		
		
			switch(i){
			case 1:
				stmt4=conn.prepareStatement("INSERT INTO winetrade values("+count +", "+ i +", "+2021+", "+red_wine+", \""+winery_ID+"\")" );
				break; 
			
			case 2:
				stmt4=conn.prepareStatement("INSERT INTO winetrade values("+count +",  "+i+", "+2021+", "+white_wine+", \""+winery_ID+"\")" );
				break;
			
			case 3:
				stmt4=conn.prepareStatement("INSERT INTO winetrade values("+count+", "+ i+", "+ 2021+", "+blush_wine+", \""+winery_ID+"\")" );
				break;
			
			case 4:
				stmt4=conn.prepareStatement("INSERT INTO winetrade values("+count+", "+i+", "+2021+", "+sparkling_wine+", \""+winery_ID+"\")" );
				break;
			
			}
			System.out.println(stmt4);
			
			rs4 = stmt4.executeQuery();
			
			
		}
		
		
		
		
		
		
		
		System.out.println("sell success!");
	
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