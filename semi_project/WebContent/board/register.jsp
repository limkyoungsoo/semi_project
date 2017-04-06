<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원가입</title>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="bootstrap/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="bootstrap/css/style.css" media="screen"
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
		
		$("#idForm").keyup(function () {
			var id = $("#id").val();
			var len = $("#id").val().length;
			
			if(len<4 || len>10){
				$("#checkResult").text('아이디는 4자이상 10자이하만 가능!').css('background','pink');
			}else{
				$("#checkResult").text("");
/* 				$.ajax({
					type:"post",
					url: "IdCheckServlet",  
					data:$("#id").text(),
					success: function (data) {
						alert("sss")
						if(data == "ok"){
							//$("#id").val('');
							//$("#id").focus();
							$("#checkResult").text(data);
						}else{
							$("#checkResult").text(data);
						}
					}//success
				}); //ajax */
				
				
			}
		})
	
	});
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
			<form role="form" id="idForm">
				<div class="form-group">
					<label for="username" name="id">아이디</label> <span id="checkResult"></span>

					<input type="text" class="form-control" id="id" placeholder="비밀번호">
					<span id="checkResult"></span> <input type="hidden" name="command"
						value="idcheck">
				</div>

				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input type="password"
						class="form-control" id="InputPassword1" placeholder="비밀번호">
				</div>
				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
					<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
				</div>
				<div class="form-group">
					<label for="username">닉네임</label> <input type="text"
						class="form-control" id="username" placeholder="닉네임을 입력해 주세요">
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