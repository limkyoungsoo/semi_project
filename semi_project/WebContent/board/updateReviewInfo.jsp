<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
<html>
<head>
<c:import url="/template/straplink.html"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	$(".delete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type : "get",
			url : "DispatcherServlet",
			data : "command=myReviewDelete&reviewNo="+$(this).next().val(),
			success : function(data) {
				location.reload();
			} //success
		});//ajax
		}
	}); //click
}); //ready
</script>
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>
	 <div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>My Review</strong>
					</h2>
					<hr>
				</div>
					<div class="container">           
					  <table class="table table-hover">
					    <thead>
					      <tr>
					      	<th>식당명</th>
					        <th>메뉴명</th>
					        <th>별점</th>
					        <th>리뷰</th>
					        <th>작성시간</th>
					      </tr>
					    </thead>
					    <tbody id="deleteMember">
					    <c:forEach items="${requestScope.myReview.list }" var="mr">
					      <tr>
					      	<td>${mr.storeName }</td>
					        <td>${mr.reviewVO.menuName }</td>
					        <td>${mr.reviewVO.grade }</td>
					        <td>${mr.reviewVO.review }</td>
					        <td>${mr.reviewVO.timePosted }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        <input type="button" value="삭제" class="delete"><input type="hidden" value="${mr.reviewVO.reviewNo}"></td>				 
					      </tr>
					     </c:forEach>
					    </tbody>
					  </table>
					</div>
					
					<!-- paging 시작 -->
					
				<p class="paging" align="center">
					<c:set var="pb" value="${requestScope.myReview.pagingBean}"></c:set>
					
					<c:if test="${pb.previousPageGroup}">
						<a href="DispatcherServlet?command=showMyReview&pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp;
						</a>
					</c:if>
					<c:forEach var="pageNo" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<a href="DispatcherServlet?command=showMyReview&pageNo=${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>${pageNo}</c:otherwise>
						</c:choose>&nbsp;
						</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="DispatcherServlet?command=showMyReview&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</p>

					<!-- paging 끝-->

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<c:import url="/template/footer.jsp"></c:import>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>