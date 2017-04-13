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
img.img-responsive.img-border-left{
	margin: auto;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
			$(".deleteBtn").click(function(){
				//alert($(this).next().val());
				if(confirm($(this).next().val()+" 님을 삭제하시겠습니까?"))
					$.ajax({
					type:"post",
					url:"DispatcherServlet",
					data:"command=deleteMember&mId="+$(this).next().val(),
					success:function(data){
						location.href="${pageContext.request.contextPath}/DispatcherServlet?command=adminMember";
					}// success
				
				});// ajax 
		}); // click
		
		$(".grantBtn").click(function(){
			// 승인, 강등 메시지 뜰 수 있도록 만들어 놓기
			var grant="";
			var tmp=$(this).next().next().val();
			if(tmp =="정회원"){
				grant ="강등";
			}
			else if(tmp =="준회원"){
				grant ="승인";
			}  
			if(confirm($(this).next().val()+" 님을 "+grant+ " 하시겠습니까?"))
				$.ajax({
				type:"post",
				url:"DispatcherServlet",
				data:"command=grantMember&mId="+$(this).next().val(),
				success:function(data){
					location.href="${pageContext.request.contextPath}/DispatcherServlet?command=adminMember";
				}// success
			});// ajax 
		}); // click
	});//ready
</script>
</head>

<body>
	<c:import url="/template/header.jsp"></c:import>
	<c:import url="/template/navigator.jsp"></c:import>

	
		
		<!-- 가게의 다른 메뉴를 보여주는 곳 -->
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						<strong>회원 관리 정보</strong>
					</h2>
					<hr>
				</div>
					<div class="container">           
					  <table class="table table-hover">
					    <thead>
					      <tr>
					      	<th>선택</th>
					        <th>아이디</th>
					        <th>패스워드</th>
					        <th>닉네임</th>
					        <th>등급</th>
					        <th>삭제</th>
					         <th>승인</th>
					      </tr>
					    </thead>
					    <tbody id="deleteMember">
					    <c:forEach items="${requestScope.allMemberList }" var="allMemberList">
					      <tr>
					      	<td><input type="checkbox" class="checkbox" value="${allMemberList.mId }"></td>
					        <td>${allMemberList.mId }</td>
					        <td>${allMemberList.mPass }</td>
					        <td>${allMemberList.mNick }</td>
					        <td>${allMemberList.mGrant }</td>
					        <td>
					        <input type="button" value="삭제" class="deleteBtn">
					        <input type="hidden" value="${allMemberList.mId }">
					        </td>
					        <td>
					        <input type="button" value="승인" class="grantBtn">
					        <input type="hidden" value="${allMemberList.mId }">
					        <input type="hidden" value="${allMemberList.mGrant }">
					        </td>
					      </tr>
					     </c:forEach>
					    </tbody>
					  </table>
					</div>
				

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 강정호 메뉴 상세보기 파트 끝 -->







	<c:import url="/template/footer.jsp"></c:import>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>
