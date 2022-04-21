<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>

<body>
	<div id="wrap">
 
        <!-- 헤더템플릿 시작 -->
        <%@ include file="/ind/headerTmp.jsp" %>
        <!-- 헤더템플릿 끝 -->
        
        
       
         <main id="main" class="dFlex">
        	<div id="lnb">
        		<!-- 메인 LNB 템플릿 시작 -->
				<%@ include file="/ind/mainLnbTmp.jsp" %>
				<!-- 메인 LNB 템플릿 끝 -->
        	</div>
        	
        	 <!-- 실제 작업 영역 시작 -->
        	<div id="contents">
        		<img id="footerLogo" src="/images/footerLogo.png" alt="이미지" >
        		<p id="footerInfoText">
        			홈페이지에 대한 내용을 적어요 블라블라<br>
        			SocietY는 자바프로그래밍 홈페이지를 만드는 팀 프로젝트로<br>
        			만들어지게 되었으며 어쩌고저쩌고
        		</p>
        		
        	</div>
        </main>
        <!-- 메인템플릿 끝 -->
        
        <!-- 푸터템플릿 시작 -->
        <%@ include file="/ind/footerTmp.jsp" %>
        <!-- 푸터템플릿 끝 -->
        
    </div>
    <!-- div#wrap -->
</body>
</html>