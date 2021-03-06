<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pack_Notice.*"%>

<%
request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("num"));
String nowPage = request.getParameter("nowPage");

//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝

BoardBean bean = (BoardBean)session.getAttribute("bean");
String subject = bean.getSubject();
String uNickName = bean.getuNickName();
String content = bean.getContent();
%>   

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 수정</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<link rel="stylesheet" href="/style/style_Notice.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script_Notice.js"></script>
</head>

<body>
    <div id="wrap">
    	
    	<!--  헤더템플릿 시작 -->
		<%@ include file="/ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="/ind/mainLnbTmp.jsp" %>
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="mod">

				
				<!--  뷰페이지 내용 출력 시작 -->			
				
				<form name="modifyFrm" action="modifyProc.jsp"
						method="get" id="modifyFrm">
			
					<h2><%=subject %></h2>
						
					<table id="modTbl">
						<tbody id="modTblBody">
							<tr>
								<td class="req">작성자</td>
								<td><%=uNickName %></td>
							</tr>
							<tr>
								<td class="req">제목</td>
								<td>
									<input type="text" name="subject" value="<%=subject %>"
										size="50" id="subject">
								</td>
							</tr>
							<tr>
								<td style="vertical-align: top;">내용</td>
								<td>
									<textarea name="content" id="txtArea"  cols="89" wrap="hard"><%=content %></textarea>
								</td>
							</tr>			
						</tbody>
						 
						<tfoot>	
							<tr>
								<td colspan="2" id="footTopSpace"></td>							
							</tr>	
							<tr>
								<td colspan="2" id="hrTd"><hr></td>							
							</tr>
							<tr>
								<td colspan="2" id="btnAreaTd" class="update">
									<button type="button" id="modProcBtn">수정하기</button>
									<button type="reset">다시쓰기</button>
									<button type="button" id="backBtn" onclick="history.back()">뒤 로</button>							
								</td>
							</tr>
						</tfoot>
						 
					</table>
					<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
					<input type="hidden" name="num" value="<%=num%>" id="num">
					
					<!-- 검색어전송 시작 -->
					<input type="hidden" name="keyField" id="keyField" value="<%=keyField%>">
					<input type="hidden" name="keyWord" id="keyWord" value="<%=keyWord%>">
					<!-- 검색어전송 끝 -->
			
				</form>
				<!--  뷰페이지 내용 출력 끝 -->

    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<%@ include file="/ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->

</body>

</html>