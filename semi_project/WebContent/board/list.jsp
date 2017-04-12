<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
<html>
<head>
<c:import url="/template/straplink.html"></c:import>
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>
	<c:set var="loc" value="${requestScope.loc}"></c:set>
    <div class="container">
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                    <c:if test="${empty loc}">
                    	<strong>전체레스토랑</strong>
                    </c:if>
                    	   <strong>${loc}</strong>
                    </h2>
                    <hr>
                </div>
                
                <c:forEach var="svo" items="${requestScope.listVo.list}">
                <div class="col-sm-4 text-center">
                    <a href="${pageContext.request.contextPath}/DispatcherServlet?command=detailStore&storeName=${svo.storeName}">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/storeImg/${svo.storePic}" width="750"  height="450">
                    </a>
                    <h3>${svo.storeName}<br>
                       <!--  <small>Job Title</small> 추후 별점 추가-->
                    </h3>
                </div>
                </c:forEach>
                
                <div class="clearfix"></div>
                <c:if test="${empty loc}">
				<p class="paging">
					<c:set var="pb" value="${requestScope.listVo.pagingBean}"></c:set>
					
					<c:if test="${pb.previousPageGroup}">
						<a href="DispatcherServlet?command=storeAllList&pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp;
						</a>
					</c:if>
					<c:forEach var="pageNo" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<a href="DispatcherServlet?command=storeAllList&pageNo=${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>${pageNo}</c:otherwise>
						</c:choose>&nbsp;
						</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="DispatcherServlet?command=storeAllList&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</p>
				</c:if>
				<c:if test="${!empty loc}">
				<p class="paging">
					<c:set var="pb" value="${requestScope.listVo.pagingBean}"></c:set>
					
					<c:if test="${pb.previousPageGroup}">
						<a href="DispatcherServlet?command=storeList&pageNo=${pb.startPageOfPageGroup-1}&loc=${loc}">◀&nbsp;
						</a>
					</c:if>
					<c:forEach var="pageNo" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<a href="DispatcherServlet?command=storeList&pageNo=${pageNo}&loc=${loc}">${pageNo}</a>
							</c:when>
							<c:otherwise>${pageNo}</c:otherwise>
						</c:choose>&nbsp;
						</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="DispatcherServlet?command=storeList&pageNo=${pb.endPageOfPageGroup+1}&loc=${loc}">▶</a>
					</c:if>
				</p>
				</c:if>
			</div>
   	     </div>
    </div>
	    <!-- /.container -->
  <!-- jQuery -->
	<script src="bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 3000
		//changes the speed
		})
	</script>
	<c:import url="/template/footer.jsp"></c:import>

</body>
</html>
