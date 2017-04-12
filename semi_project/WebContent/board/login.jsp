<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Menu Select Guide</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/style.css" media="screen"
	title="no title" charset="utf-8">

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#loginId").click(				
						function() {
							$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/DispatcherServlet",
								//dataType : "json",
								data : "command=login&id="+$("#userId").val()+"&pass="+$("#pwd").val(),
								success : function(data) {
									if(data == "true"){
										opener.location.href
										= "${pageContext.request.contextPath}/main.jsp";
										self.close();
									}
									else if(data =="false"){
										alert("아이디와 비밀번호 다시 확인 바랍니다.");
										$("#userId").val("");
										$("#pwd").val("");
										$("#userId").focus();
									}
								}
							});//ajax
						});// loginId
						$("#loginCancel").click(function(){
							if(confirm("취소 하시겠습니까?")){
								self.close();
							}
						});//loginCancel
			});// document
</script>

</head>

<body>
	<div class="container">
		<div align="center">	<h2>로그인</h2></div>
		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2" >Id:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userId"
						placeholder="Enter Id" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd"
						placeholder="Enter password" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" align="center">
					<input type="button" class="btn btn-default" value="로그인"
						id="loginId"> <input type="button" class="btn btn-default" id="loginCancel"
						value="취소">
				</div>
			</div>
		</form>
	</div>
</body>
</html>