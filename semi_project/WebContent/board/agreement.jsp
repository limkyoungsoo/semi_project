<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MSG 회원약관</title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.register.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function closeWindow() {
    window.close();
}

$(document).ready(function () {
	$("#btnClose").click(function () {
		opener.document.location.href='${pageContext.request.contextPath}/board/register.jsp';
		window.close();
	})
	
	$("#final_confirm").click(function () {
		opener.document.getElementById("agree").checked= true;
		window.close();
	})
	
})
</script>
</head>
<body>

	<div class="container">

		<section id="document1">
		<div class="page-header text-center">
			<h1>MSG 회원 이용약관</h1>
		</div>
		<div class="well text-center">
			MSG 회원 이용약관 확인 페이지에 방문해주신것을 환영합니다. 하단 이용약관 검토 및 확인 후 최종 확인 버튼을
			누르시면 MSG 일반 회원으로 등록됩니다.<br> 하단 이용약관 검토 및 확인 후 최종 확인 버튼을 누르시면 회원가입
			에 동의한 것으로 알고있겠습니다.
		</div>

		<div class="form-actions">
			<form id="form1" class="text-center">

				<!-- 이용약관 내용(TEXT AREA) -->

				<textarea rows="10" class="input-block-level" cols="160">          ■ 개인정보의 수집 및 이용 목적
          
          1) 회사는 수집방법의 구별 없이 수집된 개인정보를 제공하여 주신 회원님을 위한 보다 더 유용한 서비스의 개발, 제공에 이용합니다.
          
          2) 회사는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.
          
          ① MSG 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
          
          ② MSG 서비스에 대한 안내/홍보/리서치 정보 안내(전자우편(E-mail)/우편물(DM)/SMS 등 활용)
          
          ③ 회원 관리
          
          회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 고지사항 전달, 본인의사 확인, 불만처리 등 원활한 의사소통 경로의 확보
          
          ④ MSG 회원 활동 및 MSG 가게 활동
          
          회원의 효과적인 맛집 이용에 적합한 서비스 제공, 추천 가게 지도 지원, 맛집 추천
          
          ⑤ 맛집 이용 동향을 파악하기 위한 통계분석
          
          
          ■ 개인정보의 수집 항목
          
          
          회사는 회원제 서비스 이용, 상담, 서비스 신청 및 제공 등을 위해 다음과 같은 개인정보를 수집하고 있습니다.
          
          1) 회원가입 시 수집하는 항목
          
          ① 필수 항목 : 이름(실명), 생년월일, 회원 ID, 비밀번호, 전화번호, 휴대전화번호, 이메일 주소, 우편번호, 주소
          
          ② 선택 항목 : 영문명, 필명, 경력 업직종, 메일링 서비스 수신 설정
          
          2) 맛집 등록 시 수집하는 항목
          
          ① 필수 항목 : 맛집 이름, 맛집 전화번호, 맛집 주소, 맛집 영업시간
          
          ② 선택 항목 : 맛집 지도
          
          3) 맛집 등록 서비스 의뢰 시 수집하는 항목
          기업 서비스를 신청할 경우 신청하신 서비스의 원활한 이용과 정보도용 및 허위정보 게재로 인한 피해를 방지하기 위해 맛집 담당자의 개인정보를 확인하고 있습니다.
          
          ① 필수 항목 : 맛집명, 담당자 성명, 직책, 직급, 전화번호, 이메일, 뉴스레터 수신여부
          
          ② 선택 항목 : 담당자 휴대전화
          
          4) 유료 정보 이용 시 수집하는 항목
          
          ① 신용카드 결제 : 거래자 성명, 카드사명, 카드번호, 카드유효기간, 이메일
          
          ② 은행계좌 이체 : 거래은행명, 계좌번호, 거래자 성명
          
          5) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
          
          접속 IP 정보, 접속 기록, 쿠키, 서비스 이용기록         
        </textarea>


				<!-- 동의합니다, 동의하지 않습니다 버튼(라디오 버튼) -->
				<!-- 실명인증 버튼1(이미지) -->
				<!-- 실명인증 버튼2(이미지) -->

				<!-- 이용약관 최종 확인 버튼(이미지) -->
				<br><br><br><br><br>
				<button type="submit" class="btn btn-success" id="final_confirm">이용약관 최종 확인</button>
    			<br><br>


			</form>
		</div>
		
		<div class="modal-footer">
			<button class="btn" id="btnClose"  onclick="closeWindow()">Close</button>
		</div>

		</section>
	</div>
</body>
</html>