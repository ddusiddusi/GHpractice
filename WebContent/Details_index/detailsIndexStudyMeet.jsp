<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인 정보 받아오기
String uId_Session = (String) session.getAttribute("uId_Session");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<link rel="stylesheet" href="/style/style_Meet.css">

<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/script_meetWrite.js"></script>
</head>
<body>
	<div id="wrap">

		<!--  헤더템플릿 시작 -->
		<%@ include file="/ind/headerTmp.jsp"%>
		<!--  헤더템플릿 끝 -->


		<main id="main" class="dFlex">

			<div id="lnb">
				<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="/ind/mainLnbTmp.jsp"%>
				<!--  메인 LNB 템플릿 끝 -->
			</div>

			<div id="contents">
				<!-- 컨텐츠목록 박스 시작-->
				<h2>모임 일정</h2>
				<hr>
				<div id="write">
				<%if(!(uId_Session==null)){ %>
					<button id=login onclick="location.href='/Details_index/meetWrite.jsp'">모임생성</button>
					<%} else {%>
					<button id=nologin>모임생성</button>
					<%} %>
				</div>
				<div id="meet">
					<!-- 일정스케쥴 시작 -->
					<div id="date">
						<span id="dateValue">2022년 04월 15일</span>
					</div>
					<div id="place">
						장소 : <span id="placeValue">신촌</span>
					</div>
					<div id="member">
						<span id="memberName">팀장</span>
					</div>
					<div id="scheduleButton">
						<input type="button" value="참석" name=scheduleValue />
					</div>
				</div>



			</div>
			<!-- 컨텐츠목록 박스 끝-->



			<!-- 실제 작업 영역 끝 -->

		</main>
		<!--  main#main  -->


		<!-- footer start -->
		<%@ include file="/ind/footerTmp.jsp"%>
		<!-- footer end -->

	</div>
	<!-- div#wrap -->
</body>
</html>