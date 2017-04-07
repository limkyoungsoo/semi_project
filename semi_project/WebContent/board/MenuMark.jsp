<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/business-casual.css"
	rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>

	<div class="container">
		<div class="box">
		<h2>메뉴 찜 목록</h2>
		<table class="table">
			<thead>
				<tr>
					<th>미리보기</th>
					<th>상세정보</th>
					<th>삭제/페이지로 이동</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.markList}" var="mark">
				<tr>
					<td><img src="${pageContext.request.contextPath}/menuImg/${mark.menuVO.menuPic}" class="img-rounded"
						alt="Cinque Terre" width="210" height="150"></td>
					<td>
						<h3>${mark.storeName}</h3>${mark.menuVO.menuName}
						<br>${mark.openHour}<br>${mark.menuVO.menuPrice}<br>
						${mark.storeLoc}
					</td>
					<td><br>
					<br>
					<input type="button" value="삭제"> <br>
					<br>
					<input type="button" value="이동"></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	<c:import url="/template/footer.jsp"></c:import>
</body>
</html>