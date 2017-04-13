<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var selectMenuName="";
						$("#review").hide();
						$("#writeBtn").click(function() { // 리뷰 작성창 여닫기			
							$("#review").toggle(1000, function() {
								if ($("#review").css("display") == "none") {
									$("#writeBtn").text("리뷰 작성창 열기");
								} else {
									$("#writeBtn").text("리뷰 작성창 닫기");
								}
							}); // toggle
						}); // click

						////////////////////////////////////////////////////////////////

						$("#write")
								.click(
										function() { // 리뷰 등록											
											if($("#starScore").text()==0){
												alert("별점을 입력해 주세요");
												return;
											}
											if($("#comment").val()==""){
												alert("리뷰 내용을 입력해 주세요");
												return;
											}
											$
													.ajax({
														type : "get",
														url : "DispatcherServlet",
														dataType : "json",
														data : $("#reviewForm").serialize(), // form은 serializable 로 처리하자
														success : function(data) {
															var renew = "";
															 
															for (var i = 0; i < data.list.length; i++) {
																renew += "<tr height='100'>";
																renew += "<td>"
																		+ data.list[i].reviewNo
																		+ "</td>";
																renew += "<td>"
																		+ data.list[i].menuName
																		+ "</td>";
																renew += "<td>"
																		+ data.list[i].grade
																		+ "</td>";
																		renew += "<td style='word-break:break-all'>"
																			+ data.list[i].review
																			+ "</td>";
																renew += "<td>"
																		+ data.list[i].mid
																		+ "/"
																		+ data.list[i].timePosted
																		+ "</td>";
																renew += "</tr>";
															}
															//href = detailController / storeName 
															$("#sel1 option:selected").text("");
															 $(".reviewInfo").empty();								
															$(".reviewInfo")
																	.html(renew);
															alert("리뷰가 등록되었습니다");
															$("#comment").val("");
															
														
																
															var pbtn ="";
															
															// 이전 페이지 존재 하면 ◀
															if(data.pagingBean.previousPageGroup){
																var prePage = data.pagingBean.startPageOfPageGroup-1;
																$("#preGroup").html("<a class='pageNum'>◀　</a><input type='hidden' value="+prePage+">");
																//$("#nextGroup").html("<a class='pageNum'>▶</a><input type='hidden' value="+prePage+">");
															}
															else{
																$("#preGroup").html(" ");
															}
															for(var i=data.pagingBean.startPageOfPageGroup; i<data.pagingBean.endPageOfPageGroup+1; i++){					
																if(data.pagingBean.nowPage!=i){
																	pbtn+="<input type='button'class='pageNum' value="+i+">"+"　"+"</input></span>";
																}else{
																	pbtn+=i+"　";
																}
															}		
															if(data.pagingBean.nextPageGroup){
																var nextPage = data.pagingBean.endPageOfPageGroup+1;
																$("#nextGroup").html("<a class='pageNum'>▶</a><input type='hidden' value="+nextPage+">");
															}
															else{
																$("#nextGroup").html(" ");
															}
															$(".pageNom").html(pbtn);		
															$("#review").hide();
															$("#writeBtn").text("리뷰 작성창 열기");
														} // success
													}); // ajax	
											
											document.location.reload();
													
										}); // click

						////////////////////////////////////////////////////////////////

						/* $("#menuOption").change(function() {
							var menuOption = $(this).val();
							alert(menuOption);
						}); */

						////////////////////////////////////////////////////////////////

						var starRating = function() {
							var $star = $(".star-input"), $result = $star
									.find("output>b");
							$(document).on("focusin", ".star-input>.input",
									function() {
										$(this).addClass("focus");
									}).on("focusout", ".star-input>.input",
									function() {
									}).on("change", ".star-input :radio",
									function() {
										$result.text($(this).next().text());
									}).on("mouseover", ".star-input label",
									function() {
										$result.text($(this).text());
									}).on(
									"mouseleave",
									".star-input>.input",
									function() {
										var $checked = $star.find(":checked");
										if ($checked.length == 0) {
											$result.text("0");
										} else {
											$result
													.text($checked.next()
															.text());
										}
									});
						}; // starRating

						starRating();

						////////////////////////////////////////////////////////////////

						$("#sel1")
								.change(
										function() {
											selectMenuName=$(this).val();
											
											if ($("#sel1").val() == ""
													|| $("#sel1").val() == null) {
												$("#avgStar").hide();
												$("#totalAvg").show();
											} else {
												$("#avgStar").show();
												$("#totalAvg").hide();
											}

											$.ajax({
														type : "get",
														url : "${pageContext.request.contextPath}/DispatcherServlet",
														dataType : "json",
														data:"command=starScore&menuName="+selectMenuName+"&storeName=${requestScope.menuList.storeName}&pageNo=1",
														success : function(data) {
															var info = "";
															var info2 = "";
															for (var i = 0; i < data["avgList"].list.length; i++) {
																
																var grade = data["avgList"].list[i].avgGrade;
																if (grade == "1") {
																	info += '<i class="fa fa-star" style="font-size: 24px; color: red">'
																} else if (grade == "2") {
																	info += '<i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red">'
																} else if (grade == "3") {
																	info += '<i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red">'
																} else if (grade == "4") {
																	info += '<i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red">'
																} else if (grade == "5") {
																	info += '<i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red"><i class="fa fa-star" style="font-size: 24px; color: red">'
																} else {
																	info += '평가정보가 없습니다.'
																}
															}
															$("#avgStar")
																	.html(
																			"평점▶"
																					+ info);
															//JSONObject 안에 담겨 있는 map의 key 값을 ["key"]  입력한다.
															for (var i = 0; i < data["menuList"].list.length; i++) {
																info2 += "<tr height='100'>";
																info2 += "<td>"
																		+ data["menuList"].list[i].reviewNo
																		+ "</td>";
																info2 += "<td>"
																		+ data["menuList"].list[i].menuName
																		+ "</td>";
																info2 += "<td>"
																		+ data["menuList"].list[i].grade
																		+ "</td>";
																info2 += "<td style='word-break:break-all'>"
																		+ data["menuList"].list[i].review
																		+ "</td>";
																info2 += "<td>"
																		+ data["menuList"].list[i].mid
																		+ " "
																		+ "/"
																		+ " "
																		+ data["menuList"].list[i].timePosted
																		+ "</td>";
																info2 += "</tr>";
															}
															$(".reviewInfo").html(info2);
															$(".pageNom").empty();				
															var pbtn ="";
															if(data["menuList"].pagingBean.nextPageGroup){
																var nextPage = data["menuList"].pagingBean.endPageOfPageGroup+1;
																$("#nextGroup").html("<a class='pageNum'>▶</a><input type='hidden' value="+nextPage+">");
															}
															else{
																$("#nextGroup").html(" ");
															}
															// 이전 페이지 존재 하면 ◀
															if(data["menuList"].pagingBean.previousPageGroup){
																var prePage = data["menuList"].pagingBean.startPageOfPageGroup-1;
																$("#preGroup").html("<a class='pageNum'>◀</a><input type='hidden' value="+prePage+">");
															}
															else{
																$("#preGroup").html(" ");
															}
															for(var i=data["menuList"].pagingBean.startPageOfPageGroup; i<data["menuList"].pagingBean.endPageOfPageGroup+1; i++){					
																if(data["menuList"].pagingBean.nowPage!=i){
																	pbtn+="<input type='button'class='pageNum' value="+i+">"+"　"+"</input></span>";
																}else{
																	pbtn+=i+"　";
																}
															}				
															$(".pageNom").html(pbtn);		
														}//success
													});//ajax
										});//change
										
										
										//////////////////////////
						 $(".paging").on("click",".pageNum",function(){
							 
							 var nextPage="";
							 if($(this).val()==""){
								 nextPage=$(this).next().val();
							 }
							 else{
								 nextPage=$(this).val();
							 }
								
							 $.ajax({
								type:"get",
								url:"DispatcherServlet",
								dataType:"json",
								data:"command=starScore&hidden=view&menuName="+selectMenuName+"&storeName=${requestScope.menuList.storeName}&pageNo="+nextPage,
								success:function(data){					
									var plist ="";
									for(var i=0; i<data["menuList"].list.length;i++){
							 	 	plist+="<tr height='100'>";
							 		plist+="<td>"+ data["menuList"].list[i].reviewNo +"</td>";
							 		plist+="<td>"+ data["menuList"].list[i].menuName +"</td>"
							 		plist+="<td>"+ data["menuList"].list[i].grade +"</td>";		
							 		plist+="<td style='word-break:break-all'>"+ data["menuList"].list[i].review +"</td>";
							 		plist+="<td>"+ data["menuList"].list[i].mid +"/"+ data["menuList"].list[i].timePosted +"</td>";
							 		plist+="</tr>";			
									}
									$(".reviewInfo").empty();
							  	$(".reviewInfo").html(plist);
								$(".pageNom").empty();				
								var pbtn ="";
								
								// 이전 페이지 존재 하면 ◀
								if(data["menuList"].pagingBean.previousPageGroup){
									var prePage = data["menuList"].pagingBean.startPageOfPageGroup-1;
									$("#preGroup").html("<a class='pageNum'>◀　</a><input type='hidden' value="+prePage+">");
									//$("#nextGroup").html("<a class='pageNum'>▶</a><input type='hidden' value="+prePage+">");
								}
								else{
									$("#preGroup").html(" ");
								}
								for(var i=data["menuList"].pagingBean.startPageOfPageGroup; i<data["menuList"].pagingBean.endPageOfPageGroup+1; i++){					
									if(data["menuList"].pagingBean.nowPage!=i){
										pbtn+="<input type='button'class='pageNum' value="+i+">"+"　"+"</input></span>";
									}else{
										pbtn+=i+"　";
									}
								}		
								if(data["menuList"].pagingBean.nextPageGroup){
									var nextPage = data["menuList"].pagingBean.endPageOfPageGroup+1;
									$("#nextGroup").html("<a class='pageNum'>▶</a><input type='hidden' value="+nextPage+">");
								}
								else{
									$("#nextGroup").html(" ");
								}
								$(".pageNom").html(pbtn);		
								}
							});
						});
						
						/////// 리뷰 내용 글자수 체크 최대 300자
						$("#comment").keyup(function(){
							var comment=$("#comment").val();							
							if(comment.length>300){
								alert("리뷰내용은 300자를 초과할 수 없습니다");
								$("#comment").val("");
							}
						});						
						
					});//ready
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="row">
	<div class="box">
		<div class="col-lg-12">
			<hr>
			<h2 class="intro-text text-center">
				Review <strong> List</strong>
			</h2>
			<hr>
		</div>
		<!-- 별점 start -->
		<div class="container">
			<label for="mname">메뉴명</label> <select id="sel1">
				<option id="optionTest" value="">메뉴선택</option>
				<c:forEach items="${requestScope.menuImgList }" var="ml">
					<option id="menuN" value="${ml.menuName}">${ml.menuName}</option>
				</c:forEach>
			</select> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <span
				id="totalAvg">총평점 <c:if test="${requestScope.totalAvg==0}">▶평가정보가 없습니다.</c:if>
				<c:forEach begin="1" end="${requestScope.totalAvg}">
					<i class="fa fa-star" style="font-size: 24px; color: red"></i>
				</c:forEach>
			</span>
			<%--  ${requestScope.totalAvg }<i class="fa fa-star" style="font-size: 24px; color: red"></i></span>
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; --%>

			<span id="avgStar"></span>

			<table class="table table-hover" style="table-layout:fixed">
				<thead>
					<tr>
						<th width="30">번호</th>
						<th width="75">메뉴명</th>
						<th width="25" >평점</th>
						<th width="300" style="text-align:center">리뷰</th>
						<th width="60">글쓴이/날짜</th>
					</tr>
				</thead>
				<tbody class="reviewInfo">
					<!-- reviewList 시작 -->
					<c:forEach items="${requestScope.rlistVO.list }" var="rl"
						varStatus="order">
						<tr height="100">
							<td>${rl.reviewNo}</td>
							<td>${rl.menuName}</td>
							<td>${rl.grade}</td>
							<td style="word-break:break-all">${rl.review}</td>
							<td>${rl.mid}/ ${rl.timePosted }</td>
						</tr>
					</c:forEach>
					<!-- reviewList 끝 -->
				</tbody>
			</table>
			
			<!-- list paging 시작-->
			<div class="paging">
				<c:set var="pb" value="${requestScope.rlistVO.pagingBean}"></c:set>
				 <c:choose>
				 	<c:when test="${pb.previousPageGroup}">
					 	<span id="preGroup"><a class="pageNum">◀</a><input type="hidden" value="${pb.startPageOfPageGroup-1}"></span>
				 	</c:when>
				 	<c:otherwise>
				 		<span id="preGroup"></span>
				 	</c:otherwise>
				 </c:choose>
				<%--  <c:if test="${pb.previousPageGroup}">
					<span id="preGroup"><a class="pageNum">◀</a><input type="hidden" value="${pb.startPageOfPageGroup-1}"></span>
					</c:if> --%>
				 <span class="pageNom"> <c:forEach var="pageNo"
						begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<input type="button" class="pageNum" value="${pageNo}">　
							</c:when>
							<c:otherwise>${pageNo}　</c:otherwise>
						</c:choose>
					</c:forEach>
				</span>  
				
				 <c:choose>
				 	<c:when test="${pb.nextPageGroup}">
					 	<span id="nextGroup"><a class="pageNum">▶</a><input type="hidden" value="${pb.endPageOfPageGroup+1}"></span>
				 	</c:when>
				 	<c:otherwise>
				 		<span id="nextGroup"></span>
				 	</c:otherwise>
				 </c:choose>
			</div>
			<br><br><br>
			<!-- list paging 끝 -->
			<button type="button" class="btn btn-info" id="writeBtn">리뷰
				작성창 열기</button>
		</div>
		<br>

		<!-- 리뷰  & 별점 작성 시작 -->
		<div id="review">
			<div class="container">
				<div class="well well-lg">
					<h3>메뉴 리뷰 남기기</h3>
					<form class="form-horizontal" id="reviewForm">
						<input type="hidden" name="command" value="writeReview">
						<input type="hidden" name="storeName" value="${requestScope.menuList.storeName}">
						<input type="hidden" name="pageNo" value="1">
						<div class="form-group">
							<label for="mname">메뉴명</label> <select id="menuOption"
								name="menuOption">
								<c:forEach items="${requestScope.menuImgList }" var="ml">
									<option value="${ml.menuNo}">${ml.menuName}</option>
								</c:forEach>

							</select> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <label
								for="putstar">별점 주기</label> <span class="star-input"> <span
								class="input"> <input type="radio" name="star-input"
									id="p2" value="1"><label for="p2">1</label> <input
									type="radio" name="star-input" id="p4" value="2"><label
									for="p4">2</label> <input type="radio" name="star-input"
									id="p6" value="3"><label for="p6">3</label> <input
									type="radio" name="star-input" id="p8" value="4"><label
									for="p8">4</label> <input type="radio" name="star-input"
									id="p10" value="5"><label for="p10">5</label>
							</span> <output for="star-input"> <b id="starScore">0</b>점 </output>
							</span>
							<div class="col-sm-12">

								<textarea class="form-control" rows="5" id="comment"
									name="comment" placeholder="리뷰 내용을 입력해 주세요 (최대 300자)"></textarea>

							</div>
						</div>
						<br> <input type="hidden" name="storeName"
							value="${requestScope.menuList.storeName}"> <input
							type="button" class="btn btn-success" id="write" value="리뷰 등록 하기"></input>

					</form>
				</div>
			</div>
		</div>
		<!-- 리뷰 & 별점 작성 끝 -->

		<div class="clearfix"></div>
	</div>
</div>
