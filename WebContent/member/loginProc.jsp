<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
    
<% 
request.setCharacterEncoding("UTF-8"); 
String uId = request.getParameter("uId");
String uPw = request.getParameter("uPw");
boolean loginRes =mMgr.loginMember(uId, uPw);
%>

<script>
<%
if (loginRes) {

	session.setAttribute("uId_Session", uId);

%>
	alert("로그인 되었습니다.");
	location.href="/index.jsp";
	
<%
} else {
%>	
	alert("아이디 또는 비밀번호를 확인해주세요.");
	location.href="/member/login.jsp";
<%
}
%>
</script>