<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가게 정보 수정</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Bootstrap Core CSS -->
<link 	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link 	href="${pageContext.request.contextPath}/bootstrap/css/business-casual.css" 	rel="stylesheet">

<!-- Fonts -->
<link 	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link 	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
function editItem() {
	var frm  = document.getElementsByName("frmItem");
	frm.submit();
}
</script>
</head>
<body>

<form name="frmItem" action="${pageContext.request.contextPath}/DispatcherServlet">       
<div class="container">    
                 <table class="table table-hover" border="1">
                   <thead>
                     <tr>
                        <th rowspan="4">
                        <img src="${pageContext.request.contextPath}/storeImg/${requestScope.vo.storePic}" width="150" height="100">
                        <input type="hidden" name="pic" value="${requestScope.vo.storePic}">
                        
                        </th>
                        <th>이름</th>
                        <th><input type="text"  name="name"  value="${requestScope.vo.storeName}">  </th>
                     </tr>
                     <tr>
                       <th>위치</th>
                       <th><input type="text" name="loc"  value="${requestScope.vo.storeLoc}"></th>
                     </tr>
                     <tr>
                       <th>전화번호</th>
                       <th>${requestScope.vo.storeTel}</th>
                       <input type="hidden" name="tel" value="${requestScope.vo.storeTel}">
                     </tr>
                     <tr>
                       <th>영업시간</th>
                       <th><input type="text" name="time"  value="${requestScope.vo.openHour}"></th>
                     </tr>
                     
                   </thead>
                   <tbody>
                     <tr>
                       <td></td>
                       <td><input type="submit" value="수정" class="modifyBtn" onclick="editItem()"></td>
                       <td><input type="button" value="삭제" class="deleteBtn"></td>
                       <input type="hidden" name="command" value="edit">
                     </tr>
                   </tbody>
                 </table>
               </div>
                 </form>
</body>
</html>