<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<h1> Welcome ${sessionScope.username }</h1>
	<h2>${pageContext.request.contextPath}/tutor/logout.html</h2>
	<a href = ${pageContext.request.contextPath}/tutor/logout.html>Logout</a>
</body>
</html>