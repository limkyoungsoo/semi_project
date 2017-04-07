<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
alert("로그인 후 사용 가능한 페이지 입니다.");
location.href="${pageContext.request.contextPath}/board/login.jsp"
//location.href="${pageContext.request.contextPath}/main.jsp"
</script>