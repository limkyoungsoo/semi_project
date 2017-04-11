<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/template/straplink.html"></c:import>

<script type="text/javascript">
	$(document).ready(function() {
		$(".item").on("click","img",function() {
			if(${sessionScope.member == null}){
				alert("로그인 후 사용 가능한 페이지 입니다.");
				return;
			}
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=detailStore&storeName="
													 + $(this).attr('alt') ;
			});
		});
</script>
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>
	<c:set value="${requestScope.storeList }" var="list" />
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
						<div class="carousel-inner">
							<div class="item active">
								<img class="img-responsive img-border"
									src="${pageContext.request.contextPath}/storeImg/${list[0].storePic}"
									alt="${list[0].storeName }">
							</div>
							<c:forEach items="${list }" var="b" varStatus="order">
								<c:if test="${order.count != 1 }">
									<div class="item">
										<img class="img-responsive img-border"
											src="${pageContext.request.contextPath}/storeImg/${b.storePic }"
											alt="${b.storeName }">
									</div>
								</c:if>
							</c:forEach>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="icon-next"></span>
						</a>
					</div>
					<h2 class="brand-before">
						<small>Welcome to</small>
					</h2>
					<h1 class="brand-name">Menu Selector Guide</h1>
					<hr class="tagline-divider">
					<h2>
						<small>By <strong>Java로 Job아라</strong>
						</small>
					</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container  .. -->


	<!-- jQuery -->
	<script src="bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>
	<c:import url="template/footer.jsp"></c:import>
</body>

</html>
