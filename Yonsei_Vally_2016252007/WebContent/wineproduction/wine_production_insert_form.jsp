<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무슨 와인을 생산할까요?</title>
</head>
<body>
<%
	String winery_ID = request.getParameter("winery_ID");
	
%>


	<button type="button" onclick="location.href='wine_production_insert.jsp?winery_ID=<%=winery_ID%>&category_ID=1'">레드 와인</button>
	<button type="button" onclick="location.href='wine_production_insert.jsp?winery_ID=<%=winery_ID%>&category_ID=2'">화이트 와인</button>
	<button type="button" onclick="location.href='wine_production_insert.jsp?winery_ID=<%=winery_ID%>&category_ID=3'">블러쉬 와인</button>
	<button type="button" onclick="location.href='wine_production_insert.jsp?winery_ID=<%=winery_ID%>&category_ID=4'">스파클링 와인</button>
	
</body>
</html>