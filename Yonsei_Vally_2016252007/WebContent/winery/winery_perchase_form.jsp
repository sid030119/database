<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>winery perchase form</title>
</head>
<body>
<%= request.getRequestURI() %>  <br>

<%
	String winery_ID = request.getParameter("winery_ID");

%>

	<form action="<%=request.getContextPath() %>/winery/winery_perchase.jsp">
		<table border = "1">
			<tr>
				<td>red_grape</td>
				<td><input type="number" name="red_grape" value=0 size="10"></td>
			<tr>
			<tr>
				<td>white_grape</td>
				<td><input type="number" name="white_grape" value=0 size="20"></td>
			<tr>
			<tr>
				<td>winery_ID</td>
				<td><input type="hidden" name=winery_ID value=<%=winery_ID%> size="10"></td>
			<tr>
			<tr>
				<td colspan="5"><input type="submit" value="perchase button"></td>
			</tr>
		</table>
	</form>
	<button type="button" onclick="location.href='../main_form.jsp'">return to main</button>
</body>
</html>