<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="bMgr" class="pack_Customer.CustomerMgr"  scope="page" />
<%@ page import="pack_Customer.CustomBoardBean, java.util.Vector" %>



<%
request.setCharacterEncoding("UTF-8");
String supSearch = request.getParameter("supSearch");
Vector<CustomBoardBean> vList = null;


vList = bMgr.getCustomBoardList(supSearch); 

		
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
    	
    		
    			<div id="faqTopFive">
					<table>
						<tbody>
    	
    		<%
    		for (int i=0; i<vList.size(); i++) {		
    		CustomBoardBean vBean = vList.get(i);
    		int num = vBean.getNum();
    		String subject = vBean.getSubject();
    		String answer = vBean.getAnswer();
    		 %>
    		 <%
    		 if (vList.isEmpty()) {
				%> 
					<tr>
						<td>
						<%="게시물이 없습니다." %>      	<!-- 이것저것 다해봤는데 안됨 -->
						</td>
					</tr>				
				<%
				} else {
				%>
					
    		 	<tr class="prnTr" onclick="read('<%=num%>')">
    						<td>
    						<span class="tdNum">
    						<%= i+1 %>
    						</span>
    						
    						<span class="topTen">
    						Top<span class="topTenEft">10</span>
    						</span>
    						
    						<span class="FAQSubject">
    						<%=subject %>
    						</span>
    						</td>
    					</tr>
    					<%} %>
    					<%} %>
    		 		</tbody>
    			</table>
    			
    			</div>
    		<!-- div#faqTopFive -->
  		
				
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