<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bMgr" class="pack_Customer.CustomerMgr"  scope="page" />
    <%@ page import="pack_Customer.CustomBoardBean, java.util.Vector" %>
<%
String uId_Session_SupportTmp = (String)session.getAttribute("uId_Session"); 
String supSearch = request.getParameter("supSearch");

%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객지원</title>
    <link rel="stylesheet" href="/style/style_Common.css">
        <link rel="stylesheet" href="/style/style_Template.css">
        <link rel="stylesheet" href="/style/style_Support.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
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
    		
    		
    			<div id="contents">
    			<%@ include file="/ind/supHeadTmp.jsp" %>
    			
    			<div id="company">
    		
    			<img src="/images/logo_Side.png" alt="로고이미지">
    			
    			</div>
    			
    			<%@ include file="/ind/supFootTmp.jsp" %>
    			
    			
    		</div>
    		
    		
    		
    		</main>
    	<!--  main#main  -->
    
        	   	

		<%@ include file="/ind/footerTmp.jsp" %>
    	<!--  Footer Template -->  
        
    </div>
	<!--div#wrap-->
	
</body>
</html>