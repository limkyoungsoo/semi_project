<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>가게 정보 수정</title>
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css"
	rel="stylesheet">
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
<c:import url="/template/straplink.html"></c:import>
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

<script type="text/javascript">
	function editItem() {
		var frm = document.getElementsByName("frmItem");
		alert("수정");
		frm.submit();
	}
</script>
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>

	<form name="frmItem" method="post"
		action="${pageContext.request.contextPath}/DispatcherServlet">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<div class="container">
						<table class="table table-hover">
							<thead>
								<tr>
									<th rowspan="6"><img
										src="${pageContext.request.contextPath}/storeImg/${requestScope.vo.storePic}"
										width="150" height="100"> <input type="hidden"
										name="picname" value="${requestScope.vo.storePic}"></th>
									<th>이름</th>
									<th>${requestScope.vo.storeName}</th>

								</tr>
								<tr>
									<th>건물명</th>
									<th><input type="text" name="storeName"
										value="${param.bname}"></th>
								</tr>
								<tr>
									<th>위치</th>
									<th><input type="text" name="loc" size="50"
										value="${requestScope.vo.storeLoc}"></th>
								</tr>
								<tr>
									<th>전화번호</th>
									<th><input type="text" name="tel" size="50"
										value="${requestScope.vo.storeTel}"></th>
								</tr>
								<tr>
									<th>영업시간</th>
									<th><input type="text" name="time" size="50"
										value="${requestScope.vo.openHour}"></th>
								</tr>

							</thead>
							<tbody>
								<tr>
									<td><input type="hidden" name="command" value="edit">
										<input type="hidden" name="name"
										value="${requestScope.vo.storeName}"> <input
										type="hidden" name="no" value="${requestScope.vo.rnum}">
									</td>
									<td><input type="submit" value="수정" class="modifyBtn"
										onclick="editItem()"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>