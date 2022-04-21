<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="bMgr" class="pack_Customer.CustomerMgr"  scope="page" />
<%@ page import="pack_Customer.CustomBoardBean, java.util.Vector" %>



<%
request.setCharacterEncoding("UTF-8");
String supSearch = request.getParameter("supSearch");

int numParam = Integer.parseInt(request.getParameter("num"));

%>
<%
Vector<CustomBoardBean> vList = null;

vList = bMgr.getCustomBoardList(supSearch); 


Vector<CustomBoardBean> cList = new Vector<CustomBoardBean>();

cList = bMgr.getFAQBoardList(); 
%>
<%
CustomBoardBean bean = bMgr.getBoard(numParam);


int num =  bean.getNum();
String subject	=	bean.getSubject();
String content	= bean.getContent();
String answer   = bean.getAnswer();
session.setAttribute("bean", bean);
%>
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
		
		<%@ include file="/ind/headerTmp.jsp" %>
    	<!--  Header Template -->    	
    
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		
				<%@ include file="/ind/mainLnbTmp.jsp" %>
	    		<!--  mainLNB Template-->    	
    		</div>
    		
    		
	    	<!--Start of Contents -->
    		<div id="contents" >
    		<%@ include file="/ind/supHeadTmp.jsp" %>
    	
    		<table class="FAQDetailTbl">
    			<tbody>
    				<tr>
    					<td class="subjectEft"> <h1 class="subjectEft"><%=subject %></h1></td>
    				</tr>
    				<tr>
    					<td class="supportAns"><%=answer %></td>
    				</tr>
    			</tbody>
    		</table>
    		
    		 
    		 
  		
				
				<%@ include file="/ind/supFootTmp.jsp" %>
    		</div>
    		<!-- End of Contents -->
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	

		<%@ include file="/ind/footerTmp.jsp" %>
    	<!--  Footer Template -->  
        
    </div>
	<!--div#wrap-->
</body>
</html>