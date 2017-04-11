<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/template/straplink.html"></c:import>
<style type="text/css">
img.img-responsive.img-border-left{
	margin: auto;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".otherMenuInfo img").click(function(){
			//alert($(this).next().next().val());
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				dataType:"json",
				data:"command=detailOtherMenu&menuNo="+$(this).next().next().val(),
				success:function(data){
					var menuNo=data.menuVO.menuNo;
					$("#menuNo").text(menuNo);
					var menuName=data.menuVO.menuName;
					$("#menuName").text(menuName);
					var menuPrice=data.menuVO.menuPrice;
					$("#menuPrice").text(menuPrice);
					var openHour=data.openHour;
					$("#openHour").text(openHour);
					$("#changeImg").attr("src","${pageContext.request.contextPath }/menuImg/"+data.menuVO.menuPic);
				}//sucess
			});//ajax
		});//click
		$("#markNo").click(function(){
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=markInsert&menuno="+$("#menuNo").text(),
				success:function(){
					alert("찜 목록에 추가되었습니다");
				}//success
			});//ajax 
		});//markBtn Click
	});//ready
</script>
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
					<h2 class="text-center">${requestScope.menuList.storeName}</h2>
					<hr>
					<img class="img-responsive img-border-left"
						src="${pageContext.request.contextPath }/storeImg/${requestScope.menuList.storePic}"
						alt="${requestScope.menuList.storeName}">
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
						src="${pageContext.request.contextPath }/menuImg/${requestScope.menuList.menuVO.menuPic}"
						alt="" width="304" height="236" id="changeImg">
				</div>
				<div class="col-md-6 menuInfo">
					<p>
					<h3>메뉴번호</h3>
					<h3><span id="menuNo">${requestScope.menuList.menuVO.menuNo}</span></h3>
					
					</p>
					<p>
					<h3>메뉴이름</h3>
					<h4><span id="menuName">${requestScope.menuList.menuVO.menuName}</span></h4>
					
					</p>
					<p>
					<h3>메뉴가격</h3>
					<h4><span id="menuPrice">${requestScope.menuList.menuVO.menuPrice}</span></h4>
					
					</p>
					<h3>영업시간</h3>
					<h4><span id="openHour">${requestScope.menuList.openHour}</span></h4>
					</p>
					<input class="btn-primary" id="markNo" type="button" value="메뉴찜하기">
				</div>
				<span id="result"></span>
				<div class="clearfix"></div>
			</div>
		</div>

		
		<!-- 가게의 다른 메뉴를 보여주는 곳 -->
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>${requestScope.menuList.storeName}</strong>의 다른 메뉴
					</h2>
					<hr>
				</div>
				<c:forEach items="${requestScope.menuImgList }" var="menuImgList">
					<div class="col-sm-4 text-center otherMenuInfo">
						<img class="img-responsive"
							src="${pageContext.request.contextPath}/menuImg/${menuImgList.menuPic}"
							alt="">
							<h3>
								${menuImgList.menuName} <small>메뉴번호:${menuImgList.menuNo}</small>
							</h3>
							<input type="hidden" value="${menuImgList.menuNo}">
					</div>
				</c:forEach>

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