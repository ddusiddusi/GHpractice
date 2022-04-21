<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="bMgr" class="pack_Customer.CustomerMgr"  scope="page" />
<%@ page import="pack_Customer.CustomBoardBean, java.util.Vector" %>
 

<%
request.setCharacterEncoding("UTF-8");

Vector<CustomBoardBean> cList = new Vector<CustomBoardBean>();

cList = bMgr.getFAQBoardList(); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>list</title>
    <link rel="stylesheet" href="/style/style_Common.css">
        <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>
<body>
<form name="searchFrm" id="searchFrm">
<div id="wrap">
		
		<%@ include file="/ind/headerTmp.jsp" %>
    	<!--  Header Template -->    	
    
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		
				<%@ include file="/ind/mainLnbTmp.jsp" %>
	    		<!--  mainLNB Template-->    	
    		</div>
    		
    		
	    	<div id="contents">
    			<!--Start of Contents -->
    		<div id="supContHead" class="supContHead">

    				<table id="supTbl">
    					<tbody>
    						<tr>
    							<td id="supHeadNotice">
    							<span id="supHeadLogo">고객센터</span>
    							무엇을 도와드릴까요?
    							</td>
    						</tr>
    						<tr>
    							<td id="supSearchTd">
    							<input type="text"  id="supSearch" name="supSearch" 
    							placeholder="질문 키워드를 입력해 주세요." maxlength="30">
    							<span class="spnSearchBtn">
									<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
								</span>
    							</td>
    						</tr>
    						<tr>
    							<td id="supKeyWordTd">
    							
    							<button type=button id="pay" onclick="FAQcheck('결제')">&#35;결제관련</button>
    							<button type=button id="account" onclick="FAQcheck('계정')">&#35;계정관리</button>
    							<button type=button id="use" onclick="FAQcheck('이용')">&#35;이용문의</button>
    							<button type=button id="inc" onclick="FAQcheck('불편')">&#35;불편사항</button>
    							<button type=button id="etc" onclick="FAQcheck('기타')">&#35;기타사항</button>
    							
    						</td>
    					</tr>
    				</tbody>
    			</table>
    		</div>
    	<!-- div#supContents -->
    			<div id="threeCol" class="dFlex">			
					<div class="threeColItem  threeColCheck"><a href="/support/FAQ.jsp">FAQ</a></div>
    				<div class="threeColItem"><a href="/support/oneAndOne.jsp">1:1문의</a></div>
    				<div class="threeColItem"><a href="/notice/list.jsp">공지사항</a></div>
    						
    			</div>
		<!-- div#threeCol -->
 	
    			
    			
    			
    			
    			<div id="faqTopFive">
					<table>
						<tbody>
				<%
    		for (int i=0; i<cList.size(); i++) {		
    		CustomBoardBean cBean = cList.get(i);
    		int num = cBean.getNum();
    		String subject = cBean.getSubject();
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
    					
    				</tbody>
    			</table>
    			
    			</div>
    		<!-- div#faqTopFive -->
    		
    			<%@ include file="/ind/supFootTmp.jsp" %>
    			
    			
    		</div>
    		<!-- div#contents -->
    	</main>
    	<!--  main#main  -->
    
        	   	

		<%@ include file="/ind/footerTmp.jsp" %>
    	<!--  Footer Template -->  
        
    </div>
	<!--div#wrap-->
	</form>
</body>
</html>