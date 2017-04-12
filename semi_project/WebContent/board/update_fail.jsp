<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update_fail.jsp</title>
</head>
<script type="text/javascript">
	alert("회원정보수정은 로그인 후 이용해주세요");
	location.href="${pageContext.request.contextPath}/main.jsp";
</script>
<body>
</body>
</html>