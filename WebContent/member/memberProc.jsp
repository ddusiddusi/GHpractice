<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%request.setCharacterEncoding("UTF-8"); %>   
<jsp:useBean id = "mMgr" class = "pack_Member.MemberMgr"/>
<jsp:useBean id = "bean" class = "pack_Member.MemberBean"/>
<jsp:setProperty name = "bean"  property="*"/>

<%boolean result = mMgr.insertMember(bean);%>


    
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
    <script>
<% if (result) { %>
	alert("회원가입하셨습니다.");
	location.href="/index.jsp";
<% } else { %>
	alert("회원가입 중 문제가 발생했습니다. 다시 시도해주세요.\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.");
	history.back();
<% } %>
</script>
</head>
<body>
    <div id="wrap">
  
        
        <main id="main" class="dFlex">
        
        
        	<!-- div#lnb -->
        	
        	<!-- 실작업영역 -->
        	<div id="contents" >
        	
        
        	</div>
        	<!--div#contents -->
        	<!-- 실작업영역 -->
        	
        </main>
        <!-- main#main -->
        
        
        
        
      
        
    </div>
    <!-- div#wrap -->
 
</body>
</html>