<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/main.jsp">
<title>회원가입 완료</title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/style.css" media="screen"
	title="no title" charset="utf-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$("u").css('color', 'pink');
	})
</script>
</head>
<body background="${pageContext.request.contextPath}/bootstrap/img/bg.jpg">



<div class="container">
	<article class="container">
		<div class="page-header">
			<h1>
				MSG 회원가입 완료
			</h1>
		</div>

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12 text-center">
					<div id="carousel-example-generic" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<c:forEach items="${list }" var="p" varStatus="order">
								<c:choose>
									<c:when test="${order.count ==1  }">
										<li data-target="#carousel-example-generic"
											data-slide-to="${order.count}" class="active"></li>
									</c:when>
									<c:otherwise>
										<li data-target="#carousel-example-generic"
											data-slide-to="${order.count}"></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</ol>

						<!-- Wrapper for slides -->

						<!-- Controls -->
					</div>
					    <img alt="logo" src="${pageContext.request.contextPath}/bootstrap/img/msg.jpg" >
					<h2 class="brand-before">
						<small>정상적으로 MSG 회원으로 가입되었습니다. <br></small>
						<small>고객님의 아이디는 <b>"<u>${param.id}</u>"</b> 입니다. <br></small>
					</h2>
					<h4 class="brand-name" align="left">
					<br>
					MSG 멤버십은 별도의 회원카드를 발급받지 않으며, MSG 멤버십 부가서비스(포인트 적립)은
					홈페이지를 통해서만 가능합니다.<br>
					* MSG 홈페이지(www.msg.com)에서 맛있는 맛집 정보를 보실수 있습니다.<br>
					* 네이버 또는 페이스북 아이디로 계정 추가할 수 있습니다.<br>
					</h4>
					<hr class="tagline-divider">
					<h2>
						<small>By <strong>Java로 Job아라</strong>
						</small>
					</h2>
				</div>
			</div>
		</div>
	</div>





	</article>
</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	

	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>