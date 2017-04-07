<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원가입</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/style.css" media="screen"
	title="no title" charset="utf-8">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#userId").keyup(function(){
			var id = $("#userId").val();
			if(id.length == 0){
				$("#idCheckResult").html("");
			}
			else if(id.length < 4 || id.length > 10){
				$("#idCheckResult").html("아이디는 4자 이상 10자 이하입니다!");
			}
			else{
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/DispatcherServlet?command=idCheck",
					data:{"id":id},
					success:function(flag){
						if(flag == "ok"){
							$("#idCheckResult").html("사용가능한 아이디입니다!");
						}
						else{
							$("#idCheckResult").html(id+"는 사용불가능한 아이디입니다!");
						}
					}
				});
			}
		}); // userId KeyUp event
		
		
	  $('#InputPassword2').keyup(function(){
		   if($('#InputPassword1').val()!=$('#InputPassword2').val()){
		    $('font[name=check]').text('');
		    $('.help-block').html("암호틀림");
		   }else{
		    $('font[name=check]').text('');
		    $('.help-block').html("암호맞음");
		   }
		  }); //#chpass.keyup
		  
		  $("#registerBtn").click(function () {
			var id = 	$("#userId").val();		  
			var pass1 = 	$("#InputPassword1").val();		  
			var pass2 = 	$("#InputPassword2").val();		  
			var nick = 	$("#username").val();		  
			var chkAgree = 	$("#agree").val();		  
			  
			  if(id == ""){
				  alert('아이디를 입력해주세요');
				  return false;
			  }
			  if(pass1 == ""){
				  alert('비밀번호를 입력해주세요');
				  return false;
			  }
			  if(pass2 == ""){
				  alert('확인할 비밀번호를 입력해주세요');
				  return false;
			  }
			  if(nick == ""){
				  alert('닉네임을 입력해주세요');
				  return false;
			  }
			  if(chkAgree != "on"){
				  alert('회원약관에 동의해주세요. check 필수');
				  return false;
			  }
			  
			  $('#idForm').submit();
		})
		
		$("#cancelBtn").click(function () {
			location.href = '${pageContext.request.contextPath}/index.jsp';
		})
		
		

		
	}); //ready
</script>
</head>
<body>
	<article class="container">
		<div class="page-header">
			<h1>
				회원가입 <small>MSG form</small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" id="idForm" action="${pageContext.request.contextPath}/DispatcherServlet">

				<div class="form-group">
					<label for="userid" name="id" id="id">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" id="userId" required="required" name="nameId">
					</div>
					<span id="idCheckResult"></span> 
				</div>


				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input type="password"
						class="form-control" id="InputPassword1" placeholder="비밀번호" required="required" name="namePW">
				</div>
				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						class="form-control" id="InputPassword2" placeholder="비밀번호 확인" required="required">
					<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
				</div>
				<div class="form-group">
					<label for="username">닉네임</label> <input type="text"
						class="form-control" id="username" placeholder="닉네임을 입력해 주세요" required="required" name="nameNick">
				</div>
				<div class="form-group">
					<label>약관 동의</label>
					<div data-toggle="buttons">
						<label class="btn btn-primary active"> <span
							class="fa fa-check"></span> <input id="agree" type="checkbox"
							autocomplete="off" checked>
						</label> <a href="#">이용약관</a>에 동의합니다.
					</div>
				</div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info" id="registerBtn">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<input type="hidden" name="command" value="register">
					 	<button type="submit" class="btn btn-warning" id="cancelBtn">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

	</article>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>