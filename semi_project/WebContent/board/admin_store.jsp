<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가게 관리- 어드민</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$(".insertBtn").click(function () {
		//alert('가게등록');
		location.href='${pageContext.request.contextPath}/board/admin_store_insert.jsp';
	})
})
</script>
</head>
<body>


<div class="container">     
				<input type="button" value="가게등록" class="insertBtn">
      
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
                   <tbody>
                   <c:forEach items="${requestScope.list }" var="allStoreList">
                     <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td>${allStoreList.rnum }</td>
                       <td><a href="${pageContext.request.contextPath}/DispatcherServlet?command=modify&name=${allStoreList.storeName }&no=${allStoreList.rnum }">${allStoreList.storeName }</a></td>
                       <td>${allStoreList.storePic }</td>
                       <td>${allStoreList.storeLoc }</td>
                       <td>${allStoreList.storeTel }</td>
                       <td>${allStoreList.openHour }</td>
                       <td><input type="button" value="삭제" class="deleteBtn"></td>
                     </tr>
                    </c:forEach>
                   </tbody>
                 </table>
               </div>
</body>
</html>