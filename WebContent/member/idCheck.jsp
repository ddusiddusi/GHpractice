<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:useBean id="mMgr" class="pack_Member.MemberMgr"/>   
 <!-- 액션탴그는 java클래스를 객체로 생성하고 JSP에서 참조할 수 있도록 해준다.
 		mMgr: 객체의 인스턴스 변수
 		위의 액션태그는 아래의 코드와 동일하다
 		MemberMgr	mMgr = new memberMgr();
  -->
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
boolean result = mMgr.checkId(uId);
String btnCap = null;
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_idCheck.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>
<body>
    <div id="wrap_Popup">
    
    
    	<div>
    	
	    	<h1><%=uId %></h1>
	        
	        <span>
	        <%
	        if(result){
	        	out.print(" 는 이미 존재하는 ID입니다." );
	        	btnCap = "ID 재입력";
	        }else{
	        	out.print(" 는 사용가능합니다." );
	        	btnCap = "사용하기";
	        }
	        %>
	        </span>
	        
        </div>
        
        <hr>
        <div id="closeBtnArea">
    		<button type="button"><%=btnCap %></button>
    	</div>
    </div>
    <!-- div#wrap -->
</body>
</html>