<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vineyard insert form</title>
</head>
<body>
<%= request.getRequestURI() %>  <br>
	<form action="<%=request.getContextPath() %>/vineyard/vineyard_insert.jsp">
		<table border = "1">
			<tr>
				<td>vineyard_ID</td>
				<td><input type="text" name="vineyard_ID" required size="10"></td>
			<tr>
			<tr>
				<td>owner</td>
				<td><input type="text" name="owner" size="10"></td>
			<tr>
			<tr>
				<td>address</td>
				<td><input type="text" name="address" size="20"></td>
			<tr>
			<tr>
				<td>tel_number</td>
				<td><input type="text" name="tel_number" size="20"></td>
			<tr>
			<tr>
				<td>inv_white</td>
				<td><input type="number" name="inv_white" value=0 size="20"></td>
			<tr>
			<tr>
				<td>inv_red</td>
				<td><input type="number" name="inv_red" value=0 size="20"></td>
			<tr>
			<tr>
				<td>money</td>
				<td><input type="number" name="money" size="20"></td>
			<tr>
			<tr>
				<td colspan="4"><input type="submit" value="insert button"></td>
			</tr>
		</table>
	</form>
	<button type="button" onclick="location.href='../main_form.jsp'">return to main</button>
</body>
</html>