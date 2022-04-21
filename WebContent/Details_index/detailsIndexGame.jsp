<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인</title>
	<link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>
<body>
<div id="wrap">
    	
    	<!--  헤더템플릿 시작 -->
		<%@ include file="/ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="/ind/mainLnbTmp.jsp"%>
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		<div id="contents"> <!-- 컨텐츠목록 박스 시작-->
    		<div id="newGallay"> <!--최근 게시판 게시물 목록 시작-->
    		
    		</div> <!--최근 게시판 게시물 목록 끝-->
    		
    		<div id="schedule"><!-- 모임 일정 시작-->
    		
    		</div><!-- 모임 일정 끝-->
    		
    		</div> <!-- 컨텐츠목록 박스 끝-->

    		

    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	
		<!-- footer start -->
			<%@ include file="/ind/footerTmp.jsp" %>
		<!-- footer end -->
        
    </div>
    <!-- div#wrap -->
</body>
</html>