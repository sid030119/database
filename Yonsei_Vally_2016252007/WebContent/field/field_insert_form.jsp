<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Field insert form</title>
</head>
<body>
<%= request.getRequestURI() %>  <br>
	<form action="<%=request.getContextPath() %>/field/field_insert.jsp">
		<table border = "1">
			<tr>
				<td>Field_ID</td>
				<td><input type="text" name="Field_ID" required size="10"></td>
			<tr>
			<tr>
				<td>location</td>
				<td><input type="text" name="location" size="20"></td>
			<tr>
			<tr>
				<td>area</td>
				<td><input type="number" name="area" size="11"></td>
			<tr>
			<tr>
				<td>variety</td>
				<td><input type="text" name="variety" size="10"></td>
			<tr>
			<tr>
				<td>vineyard_ID</td>
				<td><input type="text" name="vineyard_ID" size="10"></td>
			<tr>
			<tr>
				<td colspan="5"><input type="submit" value="insert button"></td>
			</tr>
		</table>
	</form>
	<button type="button" onclick="location.href='../main_form.jsp'">return to main</button>
</body>
</html>