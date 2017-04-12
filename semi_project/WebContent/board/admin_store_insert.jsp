<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가게 정보 입력</title>
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

</head>
<body>

<!-- enctype="multipart/form-data" 파일이나 대용량 데이터 보낼때 데이터 전송 방식 -->
<form name="fileForm" method="post" enctype="multipart/form-data" action="fileUpload.jsp"> 
<div class="container" style="background-color: white;">    
                 <table class="table table-hover" border="1" bgcolor="white">
                   <thead>
                     <tr>
                        </th>
                        <th>가게이름</th>
                         <th><input type="text" name="name" ></th>
                     </tr>
                     <tr>
                        </th>
                        <th>건물명</th>
                         <th><input type="text" name="storeName" ></th>
                     </tr>
                     <tr>
                       <th>위치</th>
                       <th><input type="text" name="loc"  ></th>
                     </tr>
                     <tr>
                       <th>전화번호</th>
                       <th><input type="text" name="tel" ></th>
                     </tr>
                     <tr>
                       <th>영업시간</th>
                       <th><input type="text" name="time"  size="50" ></th>
                     </tr>
                     <tr>
                       <th>파일 업로드</th>
                       <th>
 파일명 : <input type="file" name="filename"><br>
</form>
                       </th>
                     </tr>
                     
                   </thead>
                   <tbody>
                     <tr>

                     </tr>
                   </tbody>
                 </table>
                 
                  <input type="submit" value="파일올리기"><br>
               </div>
                 </form>
</body>
</html>