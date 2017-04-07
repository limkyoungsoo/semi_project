<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function openPopup() {
		open("${pageContext.request.contextPath}/board/login.jsp", "mypopup",
				"width=220, height=220, top=150, left=650");
	}
	function logoutCheck() {
		if (confirm("로그아웃 하시겠습니까 ? ")) {
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=logout"
		}
	}
</script>



<div class="registerInfo">
	<c:choose>
		<c:when test="${sessionScope.member==null}">
			<a href="#" onclick="openPopup()"><font color="white">로그인</font></a>
			<a href="${pageContext.request.contextPath}/board/register.jsp"><font
				color="white">회원가입</font></a>
		</c:when>
		<c:otherwise>
			${sessionScope.member.mNick}님
			<a href="#" onclick="logoutCheck()"><font color="white">로그아웃</font></a>
		</c:otherwise>
	</c:choose>

</div>
<div class="brand">Menu Selector Guide</div>
<div class="address-bar">김성환, 김지원, 강정호, 이현근, 임경수, 한지선</div>