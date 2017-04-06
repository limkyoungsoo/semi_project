<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>About - Business Casual - Start Bootstrap Theme</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>

<style type="text/css">
	img.img-responsive.img-border-left.img-rounded {
    margin: auto;
}
</style>

</head>

<body>

	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>

	<!-- 강정호 메뉴 상세보기 파트 시작 -->
	<div class="container">
	<!-- 가게 메인사진 보여주는 곳 -->
	<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
						<h2 class="text-center">${requestScope.menuList.storeName}(가게이름 들어올곳) </h2>
					<hr>
						<img class="img-responsive img-border-left" src="${pageContext.request.contextPath }${requestScope.menuList.storePic}" 
                    alt="${requestScope.menuList.storeName}" >
				</div>	
			</div>
		</div>
	<!-- 메인 메뉴 사진 보여주는 곳 -->
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>${requestScope.menuList.storeName}의 메뉴</strong>
					</h2>
					<hr>
				</div>
				<div class="col-md-6">
					<img class="img-responsive img-border-left"
						src="${pageContext.request.contextPath }/menuImg/jo3.jpg" alt="" width="304" height="236">
				</div>
				<div class="col-md-6">
					<p>
						<strong>메뉴번호</strong>:${requestScope.menuList.menuVO.menuNo}
					</p>
					<p>
						<strong>메뉴이름</strong>:${requestScope.menuList.menuVO.menuName}
					</p>
					<p>
						<strong>메뉴가격</strong>:${requestScope.menuList.menuVO.menuPrice}
					</p>
					<p>
						<strong>메뉴사진</strong>:${requestScope.menuList.menuVO.menuPic}
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- 가게의 다른 메뉴를 보여주는 곳 -->
			<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>${requestScope.menuList.storeName}(가게이름들어올곳)</strong>의 다른 메뉴
					</h2>
					<hr>
				</div>
			
				<div class="col-sm-4 text-center">
					<img class="img-responsive"
						src="${pageContext.request.contextPath}${menuList.menuVO.menuPic}"
						alt="" >
					<h3>
						John Smith <small>Job Title</small>
					</h3>
				</div>
	
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 강정호 메뉴 상세보기 파트 끝 -->



<!-- review include -->
	<div class="container">
		<jsp:include page="review.jsp" />
	</div>
<!-- review include -->



<c:import url="/template/footer.jsp"></c:import>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>