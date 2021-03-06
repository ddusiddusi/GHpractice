<%@page import="pack_Schedule.ScheduleMtd"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//로그인 정보 받아오기
String uId_Session = (String)session.getAttribute("uId_Session"); 

// 컴퓨터 시스템의 년, 월 받아오기
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
month += 1;
//	오류사항 걸러주기	
try {
	year = Integer.parseInt(request.getParameter("year"));
	month = Integer.parseInt(request.getParameter("month"));

	if (month >= 13) {
		year++;
		month = 1;
	} else if (month <= 0) {
		year--;
		month = 12;
	}
} catch (Exception e) {

}
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
<link rel="stylesheet" href="/style/style_Detail_Index.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
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

			<!-- 컨텐츠목록 박스 시작-->
			<div id="contents">

				<h2>전체 일정표</h2>

				<!-- 달력 만들기 -->
				<table>
					<tr>
						<!-- 이전달 버튼 만들기 -->
						<th><input type="button" value="이전 달"
							onclick="location.href='detailsIndexSchedule.jsp?year=<%=year%>&month=<%=month - 1%>'">
						</th>

						<!-- 제목 만들기 -->
						<th id="title" colspan="5"><%=year%>년 <%=month%>월</th>

						<!-- 다음달 버튼 만들기 -->
						<th><input type="button" value="다음 달"
							onclick="location.href='detailsIndexSchedule.jsp?year=<%=year%>&month=<%=month + 1%>'">
						</th>
					</tr>
					<!-- 요일 표시칸 만들어주기(단, 토,일요일은 색을 다르게 하기위해 구분해주기) -->
					<tr>
						<td class="sunday">일</td>
						<td class="etcday">월</td>
						<td class="etcday">화</td>
						<td class="etcday">수</td>
						<td class="etcday">목</td>
						<td class="etcday">금</td>
						<td class="saturday">토</td>
					</tr>

					<!-- 날짜 집어 넣기 -->
					<tr>
						<%
						//	1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
						int first = ScheduleMtd.weekDay(year, month, 1);
						//	1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
						int start = 0;
						start = month == 1 ? ScheduleMtd.lastDay(year - 1, 12) - first : ScheduleMtd.lastDay(year, month - 1) - first;
						//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
						for (int i = 1; i <= first; i++) {
							if (i == 1) {
								/* 일요일(빨간색)과 다른날들의 색을 구별주기  */
								out.println("<td class = 'redbefore'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
							} else {
								out.println("<td class = 'before'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");

							}
						}

						/* 1일부터 달력을 출력한 달의 마지막 날짜까지 반복하며 날짜를 출력 */
						for (int i = 1; i <= ScheduleMtd.lastDay(year, month); i++) {
							/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
							switch (ScheduleMtd.weekDay(year, month, i)) {
							case 0:
								out.println("<td class ='sun'>" + i + "</td>");//일요일 날짜 출력
								break;
							case 6:
								out.println("<td class ='sat'>" + i + "</td>");//토요일 날짜 출력
								break;
							default:
								out.println("<td class ='etc'>" + i + "</td>");//평일의 날짜 출력
								break;
							}

							/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
							if (ScheduleMtd.weekDay(year, month, i) == 6 && i != ScheduleMtd.lastDay(year, month)) {
								out.println("</tr><tr>");
							}
						}
						if (ScheduleMtd.weekDay(year, month, ScheduleMtd.lastDay(year, month)) != 6) {
							for (int i = ScheduleMtd.weekDay(year, month, ScheduleMtd.lastDay(year, month)) + 1; i < 7; i++) {
								out.println("<td></td>");
							}
						}
						%>
					</tr>

				</table>

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