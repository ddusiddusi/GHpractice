<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String uId_Session_HeadTmp = (String)session.getAttribute("uId_Session"); 
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더템플릿</title>
</head>
<body>

    	<header id="header" class="dFlex"> 	<!-- 로고, GNB -->
    		<div id="headerLogo">
    			<a href="/index.jsp">
    				<img src="/images/Logo.png" alt="헤더로고이미지">
    			</a>
    		</div>
    		<nav id="gnb">
    		
    			<ul id="mainMenu" class="dFlex">
    		   		
    			<% if (uId_Session_HeadTmp == null) { 	%>
    			
    				<li class="mainLi"><a href="/index.jsp">HOME</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/login.jsp">로그인</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/member.jsp">회원가입</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/support/support.jsp">고객센터</a></li>
    				
    			<% } else { %> 
    			
    				<li class="mainLi"><a href="/index.jsp">HOME</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/logout.jsp">로그아웃</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="#">마이페이지</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/support/support.jsp">고객센터</a></li>
    				
    			<% } %>
    		
    		
    			</ul>
    			
    		</nav>
    	</header>
    	<!--  header#header  -->
    	<hr class="sepLine">
    	
</body>
</html>