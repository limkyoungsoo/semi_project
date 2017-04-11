<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가게 관리</title>
<c:import
	url="${pageContex.request.contextPath}/template/straplink.html"></c:import>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#adminList td .deleteBtn").click(function(){
		var tr = $(this).parent().parent();
  		 $.ajax({
			type:"post",
			url:"DispatcherServlet",
			data:"command=adminStoredelete&storeName="+$(this).next().val(),
			success:function(){
				alert("찜 목록에서 삭제되었습니다");
				tr.remove();
			}
		});//ajax
	});//삭제button click
});//ready
</script>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>

	<div class="container">
		<div class="row">
			<div class="box">
				<h3>가게 전체 목록</h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>No.</th>
							<th>이름</th>
							<th>사진이름</th>
							<th>위치</th>
							<th>전화번호</th>
							<th>영업시간</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="adminList">
						<c:forEach var="allStoreList" items="${requestScope.listVo.list}" >
							<tr id="trtr">
								<td><input type="checkbox" class="checkbox"></td>
								<td>${allStoreList.rnum}</td>
								<td><a
									href="${pageContext.request.contextPath}/DispatcherServlet?command=modify&name=${allStoreList.storeName }">${allStoreList.storeName }</a></td>
								<td>${allStoreList.storePic }</td>
								<td>${allStoreList.storeLoc }</td>
								<td>${allStoreList.storeTel }</td>
								<td>${allStoreList.openHour }</td>
								<td><input type="button" value="삭제" class="deleteBtn">
								<input type="hidden" value="${allStoreList.storeName}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p class="paging">
					<c:set var="pb" value="${requestScope.listVo.pagingBean}"></c:set>
					
					<c:if test="${pb.previousPageGroup}">
						<a href="DispatcherServlet?command=adminStore&pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp;
						</a>
					</c:if>
					<c:forEach var="pageNo" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<a href="DispatcherServlet?command=adminStore&pageNo=${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>${pageNo}</c:otherwise>
						</c:choose>&nbsp;
						</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="DispatcherServlet?command=adminStore&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</p>
			</div>
		</div>
	</div>
</body>
</html>