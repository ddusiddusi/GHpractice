<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>
   
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="/style/style_Common.css">
        <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
    <script src="/script/script_Login.js"></script>
</head>
<body>
<div id="wrap">
		
		<%@ include file="/ind/headerTmp.jsp" %>
    	<!--  Header Template -->    	
    
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		
				<%@ include file="/ind/mainLnbTmp.jsp" %>
	    		<!--  mainLNB Template-->    
	    		</div>
	    		
	    		<!-- 실제 작업 영역 시작 -->	
	    		<div id="contents" class="loginDiv">

				<form id="loginFrm" name="loginFrm">
	        
		        	<div id="loginArea">	        	
		        		<div id="loginInput">
		        			<input type="text" name="uId" placeholder="아이디 입력" id="uId">
		        			<input type="password" name="uPw" placeholder="비밀번호 입력" id="uPw">
		        		</div>
		        		
		        		<button type="button" id="loginBtn">로그인</button>
		        		
		        	</div>
		        	<!-- div#loginArea -->
	        	
	        	</form>

    		</div>
    		<!-- 실제 작업 영역 끝 div.loginDiv -->
    		
		
    	</main>
    	<!--  main#main  -->
    
        	   	

		<%@ include file="/ind/footerTmp.jsp" %>
    	<!--  Footer Template -->  
        
    </div>
	<!--div#wrap-->
</body>
</html>