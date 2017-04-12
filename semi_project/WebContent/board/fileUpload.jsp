<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 
<!-- 파일 업로드 처리를 위한 MultipartRequest 객체를 임포트 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*, java.text.*"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가게 정보 입력</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css" rel="stylesheet">
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

<%
request.setCharacterEncoding("utf-8");
String dir = application.getRealPath("/storeImg");

 int size = 10*750*450;        // 업로드 파일 최대 크기 지정
 
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 String today = formatter.format(new java.util.Date());
 
 String name="";
 String loc="";
 String tel="";
 String time="";
 String pic="";
 String filename="";
 String saveName="";
 String storeName="";
 
 
 try{
 
  // 파일 업로드. 폼에서 가져온 인자값을 얻기 위해request 객체 전달,
  //업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
  MultipartRequest multi = new MultipartRequest(request, dir, size, "utf-8", new DefaultFileRenamePolicy());
 
  
  // 폼에서 입력한 값을 가져옴
  name = multi.getParameter("name");
  loc = multi.getParameter("loc");
  tel = multi.getParameter("tel");
  time = multi.getParameter("time");
  filename = multi.getParameter("filename");
  storeName = multi.getParameter("storeName");
  
// 업로드한 파일들을 Enumeration 타입으로 반환
// Enumeration형은 데이터를 뽑아올때 유용한 인터페이스 Enumeration객체는 java.util 팩키지에 정의 되어있으므로
// java.util.Enumeration을 import 시켜야 한다.
  Enumeration files = multi.getFileNames();
 
  
  // 업로드한 파일들의 이름을 얻어옴
  String file = (String)files.nextElement();
  filename = multi.getFilesystemName(file);
 
 }catch(Exception e){
  // 예외처리
  e.printStackTrace();
 }
 
 saveName = today+filename;
 
%>
  
<html>
<body onload="javascript:window_onload()">
<div class="row">
<div class="box">
<div class="col-lg-12">
</div>
</div>
</div>
<table>
	<tr>
		<thead>
			<tr>
				입력내용입니다.
			</tr>
			<tr>
				<th>가게이름 </th>
				<td><%=name %> </td>
			</tr>
			<tr>
				<th>건물명 </th>
				<td><%=storeName %> </td>
			</tr>
			<tr>
				<th>주소  </th>
				<td><%=loc %> </td>
			</tr>
			<tr>
				<th>전화번호  </th>
				<td><%=tel %> </td>
			</tr>
			<tr>
				<th>영업시간  </th>
				<td><%=time %> </td>
			</tr>
			<tr>
				<th>저장 directory  </th>
				<td><%=dir %> </td>
			</tr>
			<tr>
				<th>저장될 사진 이름  </th>
				<td><%=saveName %> </td>
			</tr>
		</thead>
	</tr>
</table>

<form action="${pageContext.request.contextPath}/DispatcherServlet">
	<input type="hidden" name="name" value="<%=name %> ">
	<input type="hidden" name="loc" value="<%=loc %> ">
	<input type="hidden" name="tel" value="<%=tel %> ">
	<input type="hidden" name="time" value="<%=time %> ">
	<input type="hidden" name="dir" value="<%=dir %> ">
	<input type="hidden" name="saveName" value="<%=saveName %> ">
	<input type="hidden" name="storeName" value="<%=storeName %> ">
	<input type="hidden" name="command" value="insertStore">
	<input type="submit" name="saveBtn" value="저장">
</form>

 위 입력내용대로 DB 저장됩니다.
</body>
</html>
