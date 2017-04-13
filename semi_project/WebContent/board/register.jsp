<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>회원가입</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/style.css" media="screen"
	title="no title" charset="utf-8">

<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
var newWindow;
var idFlag=false;

function openNewWindow(){
    newWindow = window.open("agreement.jsp", "newWindow", "height=650, width=750, resizable=yes");        
}
	$(document).ready(function(){
		$('input:checkbox[id="agree"]').val();
		
		$("#userId").keyup(function(){
			var id = $("#userId").val();
			
			if(id.length == 0){
				$("#idCheckResult").html("");
			}
			else if(id.length < 4 || id.length > 10){
				$("#idCheckResult").html("아이디는 4자 이상 10자 이하입니다!").css('color', 'red');
			}
			else{
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/DispatcherServlet?command=idCheck",
					data:{"id":id},
					success:function(flag){
						if(flag == "ok"){
							$('#idCheckResult').html("사용가능한 아이디입니다!").css('color','blue');
							idFlag=true;
						}
						else{
							$('#idCheckResult').html(id+"는 사용불가능한 아이디입니다!").css('color', 'red');
							/* $("#userId").val("").focus(); */
						}
					}
				});
			}
		}); // userId KeyUp event
		
		
	  $('#InputPassword2').keyup(function(){
		   if($('#InputPassword1').val()!=$('#InputPassword2').val()){
		    $('font[name=check]').text('');
		    $('.message-block').html("암호가 일치하지 않습니다").css('color', 'red');
		   }else{
		    $('font[name=check]').text('');
		    $('.message-block').html("암호가 일치합니다").css('color', 'blue');
		   }
		  }); //#chpass.keyup
		  
		  $("#registerBtn").click(function () {
			var id = $("#userId").val();
			var pass1 = 	$("#InputPassword1").val();		  
			var pass2 = 	$("#InputPassword2").val();		  
			var nick = 	$("#username").val();		  
			var chkAgree = $('#agree').is(":checked");	
			
			  if(! chkAgree){
				  alert('회원약관에 동의해주세요. check 필수');
				  return false;
			  }
			  if(id == "" || idFlag == false){
				  alert('아이디를 입력하세요');
				  $("#userId").val("").focus();
				  return false;
			  }
			  if(id.length < 4 || id.length > 10){
				  alert("아이디 글자수가 맞지않습니다");
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
			  if(pass1 != pass2){
				  alert("암호가 일치하지 않습니다");
				  return false;
			  }
			  
			  $('#idForm').submit();
		})
		$("#cancelBtn").click(function () {
			location.href = '${pageContext.request.contextPath}/main.jsp';
		})
		
	}); //ready
</script>

<style type="text/css">
#divArea {
	background-color: white;
	border: 1px solid #000;
}
#idForm{
	margin:10px; 
  padding: 0 5px;
}
</style>
</head>
<body background="${pageContext.request.contextPath}/bootstrap/img/bg.jpg">
	<br><br><br><br><br><br><br>
	<div class="container">
	<article class="container"  id="divArea">
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
						<span id="idCheckResult"></span> 
					</div>
				</div>


				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input type="password"
						class="form-control" id="InputPassword1" placeholder="비밀번호" required="required" name="namePW">
				</div>
				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						class="form-control" id="InputPassword2" placeholder="비밀번호 확인" required="required">
					<p class="message-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
				</div>
				<div class="form-group">
					<label for="username">닉네임</label> <input type="text"
						class="form-control" id="username" placeholder="닉네임을 입력해 주세요" required="required" name="nameNick">
				</div>
				
				<div class="form-group">
					<label>약관 동의</label>
				<div class="checkbox"> <label> <input type="checkbox" id="agree" value=""> 
				<a href="#" onclick="openNewWindow()">이용약관</a><b>에 동의합니다.</b> </div>
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
</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>