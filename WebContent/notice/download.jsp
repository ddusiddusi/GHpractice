<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="bMgr" class="pack_Notice.BoardMgr"/>
<%
request.setCharacterEncoding("UTF-8");

bMgr.downLoad(request, response, out, pageContext);
%>