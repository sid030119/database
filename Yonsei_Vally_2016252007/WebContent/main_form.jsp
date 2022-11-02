<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_form</title>
</head>
<body>
<%= request.getRequestURI() %>  <br>
	<button type="button" onclick="location.href='field/field_show.jsp'">show field</button>
	<button type="button" onclick="location.href='vineyard/vineyard_show.jsp'">show vineyard</button>
	<button type="button" onclick="location.href='winery/winery_show.jsp'">show winery</button>
	<button type="button" onclick="location.href='wine_category/wine_category_show.jsp'">show wine_category</button>
	<button type="button" onclick="location.href='wine_grade/wine_grade_show.jsp'">show wine_grade</button>
	
</body>
</html>