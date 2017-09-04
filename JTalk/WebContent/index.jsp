<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("member", "a");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="/JTalk/index.do" name="index" method="post"></form>
	</body>
	<script>
		document.index.submit();
	</script>
</html>