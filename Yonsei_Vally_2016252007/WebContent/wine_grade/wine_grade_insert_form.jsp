<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wine grade insert form</title>
</head>
<body>
<%= request.getRequestURI() %>  <br>
	<form action="<%=request.getContextPath() %>/wine_grade/wine_grade_insert.jsp">
		<table border = "1">
			<tr>
				<td>grade_ID</td>
				<td><input type="text" name="grade_ID" required size="10"></td>
			<tr>
			<tr>
				<td>title</td>
				<td><input type="text" name="title" size="20"></td>
			<tr>
			<tr>
				<td>ratio</td>
				<td><input type="text" name="ratio" size="10"></td>
			<tr>
			<tr>
				<td colspan="5"><input type="submit" value="insert button"></td>
			<tr>
		</table>
	</form>
	<button type="button" onclick="location.href='../main_form.jsp'">cancel</button>
</body>
</html>