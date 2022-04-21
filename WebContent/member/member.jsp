<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <link rel="stylesheet" href="/style/style_index.css">
    <link rel="stylesheet" href="/style/style_Member.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
    <script src="/script/script_Login.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <div id="wrap">
    
    	<!--  헤더템플릿 시작 -->
		<%@ include file="/ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
    
        <main id="main" class="dFlex">
        
        		<div id="lnb">
				<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="/ind/mainLnbTmp.jsp"%>
				<!--  메인 LNB 템플릿 끝 -->
			</div>
        	
        	<!-- 실작업영역 -->
        	<form name="regFrm" id="regFrm" >
        	<div id="contents" >
            <table id="joinTbl">
                <caption>회원가입</caption>
                <tbody>
                    <tr>
                        <td class="req">아아디</td>
                        <td><input type="text" size="23" name="uId" id="uId" maxlength="20" autofocus>
                            	<button type="button" id="idChkBtn">ID중복확인</button></td>
                        <td>영어소문자, 숫자 조합(3~20)</td>
                    </tr>
                    <tr>
                        <td class="req">패스워드</td>
                        <td>
                        	<input type="password" size="23" name="uPw" id="uPw" maxlength="20">
                        	<input type="checkbox" id="pwView"> 비밀번호 확인
                        </td>
                        <td>영어소문자, 숫자,_,@,$,(5~20)</td>
                    </tr>
                     <tr>
                        <td class="req">패스워드 확인</td>
                        <td>
                        	<input type="password" size="23" id=uPwRe maxlength="20">
                        	<span id ="pwChk">&nbsp;</span>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="req">이름</td>
                        <td><input type="text" size="10" name="uName"  id="uName" maxlength="20"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="req">닉네임</td>
                        <td><input type="text" size="10" name="uNickName"  id="uNickName" maxlength="20"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="req">Email</td>
                        <td>
                        	<input type="text" size="10" id = "uEmail_1" maxlength="20">
                        	<span>@</span>
                         	<input type="text" size="14" id = "uEmail_2" maxlength="20">                       	
                        	
                        	<select id="emailDomain">
                        		<option value="">직접입력</option>
                        		<option >naver.com</option>
                        		<option >daum.net</option>
                        	</select>
                        	
                        	 	<input type="hidden" name="uEmail" id="uEmail">
                        	 	
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr><td colspan="3" id="sepLine"><hr></td></tr>
                    
                     <tr>
                        <td>성별</td>
                        <td>
                            <label >남
                                <input type="radio" name = "gender" value="남" class="genR">
                            </label>
                            <label >여
                                <input type="radio" name = "gender" value="여" class="genR">
                            </label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td>
                        <input type="text" size="10" name = "uBirthday" id = "uBirthday"  maxlength="6">
                         	&nbsp; &nbsp; &nbsp; &nbsp; ex)960215
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" size="10" name = "uZipcode" id = "uZipcode" maxlength="7" readonly>
                            <button type="button" id="findZipBtn">우편번호찾기</button>
                        </td>
                        <td>우편번호찾기 버튼을 눌러주세요.</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><input type="text" size="40"  name = "uAddr"  id = "uAddr"  maxlength="40"> </td>
                        <td>&nbsp;</td>
                    </tr>
                  
                    <tr>
                        <td>관심 동호회</td>
                        <td>
                            <label>
                            	미정 <input type="checkbox" class="chb" name = "uHobby" value="">
                            </label>
                            <label>
                            	미정 <input type="checkbox" class="chb" name = "uHobby" value="">
                            </label>
                            <label>
                            	미정 <input type="checkbox" class="chb" name = "uHobby" value="">
                            </label>
                            <label>
                            	미정 <input type="checkbox" class="chb" name = "uHobby" value="">
                            </label>
                            <label>
                            	미정 <input type="checkbox"  class="chb" name = "uHobby" value="">
                            </label>
                        </td>
                        <td>중복 선택 가능합니다.</td>
                    </tr>
                    <tr>
                        <td colspan="3" id="btnArea">
                            <button type="button" id="joinBtn">회원가입</button>
                            <button type="reset">다시쓰기</button>
                        </td>
                        
                    </tr>
                </tbody>
            </table>
            <!--table-->
        	</div>
        	<!--div#contents -->
			</form>
        	<!-- 실작업영역 -->
        	
        </main>
        <!-- main#main -->
        
        
    		<!-- footer start -->
		<%@ include file="/ind/footerTmp.jsp" %>
			<!-- footer end -->
        
        
        
    </div>
    <!-- div#wrap -->
 
</body>
</html>