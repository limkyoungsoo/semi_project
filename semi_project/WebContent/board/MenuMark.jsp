<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/template/straplink.html"></c:import>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#mm td .deleteBtn").click(function(){
	      var mmno=$(this).next().val();
	      var tr = $(this).parent().parent();
	        $.ajax({
	         type:"post",
	         url:"DispatcherServlet",
	         data:"command=MarkDelete&menuNo="+mmno,
	         success:function(){
	            alert("찜 목록에서 삭제되었습니다");
	            tr.remove();
	         }
	      });//ajax 
	   });//삭제button click
   $("#mm td .moveBtn").click(function(){
	   var storeName=$(this).next().val();
	   location.href="${pageContext.request.contextPath}/DispatcherServlet?command=detailStore&storeName="+storeName;
   });// 이동button click
});//ready
</script>
<body>
   <c:import url="/template/header.jsp"></c:import>
   <c:import url="/template/navigator.jsp"></c:import>

   <div class="container">
      <div class="box">
         <h2>메뉴 찜 목록</h2>
         <table class="table">
            <thead>
               <tr>
                  <th>미리보기</th>
                  <th>상세정보</th>
                  <th>삭제</th>
                  <th>해당 가게로 이동</th>
               </tr>
            </thead>
            <tbody id="mm">
               <c:forEach items="${requestScope.markList}" var="mark">
                  <tr>
                     <td><img
                        src="${pageContext.request.contextPath}/menuImg/${mark.menuVO.menuPic}"
                        class="img-rounded" alt="Cinque Terre" width="210" height="150"></td>
                     <td>
                        <h3>${mark.storeName}</h3>${mark.menuVO.menuName}
                        <br>${mark.openHour}<br>${mark.menuVO.menuPrice}<br>
                        ${mark.storeLoc}
                     </td>
                     <td><input type="button" value="삭제" class="deleteBtn"><input type="hidden" value="${mark.menuVO.menuNo}"></td>
                     <td><input type="button" value="이동" class="moveBtn"><input type="hidden" value="${mark.storeName}"></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
   <c:import url="/template/footer.jsp"></c:import>

</body>
</html>