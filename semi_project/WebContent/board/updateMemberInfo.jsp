<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/style.css"
	media="screen" title="no title" charset="utf-8">
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#idForm").submit(function() {
			alert("수정 완료 \n 메인 페이지로 이동합니다");
		});//submit
		$("#cancelBtn").click(function() {
			alert("메인페이지로 돌아갑니다");
			location.href = "${pageContext.request.contextPath}/main.jsp";
		});//click
	});// ready
</script>

<style type="text/css">
#divArea {
	background-color: white;
	border: 1px solid #000;
}
#idForm{
	margin:10px; 
  padding: 0 5px;
}
</style>
</head>
<body
	background="${pageContext.request.contextPath}/bootstrap/img/bg.jpg">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<article class="container" id="divArea">
			<div class="page-header">
				<h1>
					회원정보 수정 <small>MSG form</small>
				</h1>
			</div>
			<!-- 세션이 있을 떄, 없을 때로 나눠서 하기 -->
			<c:choose>
				<c:when test="${sessionScope.member.mId!=null }">
					<div class="col-md-6 col-md-offset-3">
						<form role="form" id="idForm"
							action="${pageContext.request.contextPath}/DispatcherServlet">
							<div class="form-group">
								<label for="userid" name="id" id="id">아이디</label>
								<div class="input-group">
									<input type="text" class="form-control" id="mId"
										required="required" name="nameId"
										value="${sessionScope.member.mId}" readonly>
								</div>
								<span id="idCheckResult"></span>
							</div>
							<div class="form-group">
								<label for="InputPassword1">새로운 비밀번호</label> <input
									type="password" class="form-control" id="mPass"
									placeholder="비밀번호" required="required" name="namePW"
									value="${sessionScope.member.mPass}">
							</div>
							<div class="form-group">
								<label for="username">닉네임</label> <input type="text"
									class="form-control" id="mNick" required="required"
									name="nameNick" value="${sessionScope.member.mNick }">
							</div>
							<div class="form-group text-center">
								<button type="submit" class="btn btn-info" id="updateBtn">
									회원정보 수정<i class="fa fa-check spaceLeft"></i>
								</button>
								<input type="hidden" name="command" value="updateMemberInfo">
								<button type="submit" class="btn btn-warning" id="cancelBtn">
									취소<i class="fa fa-times spaceLeft"></i>
								</button>
							</div>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<c:redirect url="/DispatcherServlet">
						<c:param value="storeShow" name="command" />
					</c:redirect>
				</c:otherwise>
			</c:choose>
		</article>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>