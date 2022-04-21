/**
 * 
 */

$(function(){


////////////////////////////////////////////////////////////////////////
/*//////////회원가입 입력(member/member.jsp) 시작//////////////*/
///////////////////////////////////////////////////////////////////////

	/*Eamil Domain 자동입력 시작*/
	
	$("#regFrm select#emailDomain").change(function(){
		
		let emailDomain = $(this).val().trim();
		
		$("input#uEmail_2").val(emailDomain);
		
		if(emailDomain == ""){
			$("input#uEmail_2").focus();
		}else{
			$("input#uEmail_1").focus();
		}
	});
	
	/*Eamil Domain 자동입력 끝*/
	
	
	//아이디 중복체크 팝업
	$("#regFrm button#idChkBtn").click(function(){
		
		let uId=$("#uId").val().trim(); //<input id = "uId">
		


		//정규표현식 시작
		
		let regExp = /[^a-z|0-9]/g;   
		let data = uId;							
		let res=regExp.test(data);			
														
		
		//정규표현식 끝
		

		if(uId==""){
			
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			
		}else if (res){
			alert("아이디는 영어소문자, 숫자 조합으로 작성해주세요.");   
			$("#uId").focus();
			
		}else if (uId.length <3){
			alert("아이디는 최소 3글자 이상입니다.");           
			$("#uId").focus();
			
		}else{
			let url="/member/idCheck.jsp?uId="+uId;
			
			let w = screen.width;  //1920
			let popWidth = 480;
			let leftPos=(w - popWidth)/2;
			
			
			let h = screen.height;  //1080
			let popHeigth = 320;
			let topPos=(h - popHeigth)/2;
			
			
			
			let prop="width="+popWidth+", height="+popHeigth;
			prop += ",left=" + leftPos +",top=" + topPos; 
			
			let nickName="idDhkPop";
			
			
			window.open(url, nickName, prop)
			
		}
		
	});
	
	//아이디 중복체크 팝업창 닫기
	$("div#closeBtnArea>button").click(function(){
		window.close();
		opener.regFrm.uId.focus();  
		//DOM으로 접근
		//opener객체는 팝업창을 실행한 부모페이지를 지칭함.
	});
	//아이디 중복체크 팝업창 닫기
	
	
	//비밀번호 표시하기
	$("#regFrm input#pwView").click(function(){
		
		let chkTF = $(this).prop("checked");
		
		if(chkTF){
			$("input#uPw").attr("type","text");
			$("input#uPwRe").attr("type","text");
		}else{
			$("input#uPw").attr("type","password");
			$("input#uPwRe").attr("type","password");
		}
	});
	//비밀번호 표시하기
	
	//비밀번호 유효성 검사
	$("#regFrm button#joinBtn").click(function(){
		let uPw = $("#uPw").val().trim();
		let regExp = /[^a-z|0-9|_|@|$]/g;
		let data = uPw;
		
		let res = regExp.test(data);
		
		if(uPw == ""){
			alert("비밀번호를 입력해주세요.");
			$("#uPw").val("");
			$("#uPwRe").val("");
			$("#uPw").focus();
		}else if(res){
			alert("영어소문자, 숫자,_,@,$,(5~20) 조합으로 작성해주세요.");
			$("#uPw").val("");
			$("#uPwRe").val("");
			$("#uPw").focus();
		}else if(uPw.length <5){
			alert("비밀번호는 최소 5자리 이상입니다.");
			$("#uPw").val("");
			$("#uPwRe").val("");
			$("#uPw").focus();
		}
		
	});
	//비밀번호 유효성 검사
	
	//비밀번호 동일성 검사
	
	$("#uPwRe").keyup(function(){
		
		let uPw=$("#uPw").val();
		let uPwRe = $("#uPwRe").val();
		
		if(uPw != uPwRe){
			$("span#pwChk").text("비밀번호가 다릅니다.");
		}else{
			$("span#pwChk").text("비밀번호가 일치합니다.");
		}
		
	});
	
	//비밀번호 동일성 검사
	
	//이름 유효성 검사
	$("#regFrm button#joinBtn").click(function(){
		let uName = $("#uName").val();
		let regExp = /[^a-z|0-9|" "|ㄱ-ㅎ|ㅏ-ㅑ|가-힣|.|_|-]/g;
		let data = uName;
		
		let res = regExp.test(data);
		
		if(uName == ""){
			alert("이름을 입력해주세요.");	
			$("#uName").val("");
			$("#uName").focus();
		}else if(res){
			alert("이름은 한글, 영어대소문자,숫자,마침표,밑줄,대시기호(-),공백만 입력가능합니다.");
			$("#uName").val("");
			$("#uName").focus();
		}
		
		
	});
	//이름 유효성 검사
	
	//닉네임 유효성 검사
	$("#regFrm button#joinBtn").click(function(){
		let uNickName = $("#uNickName").val();
		let regExp = /[^a-z|0-9|" "|ㄱ-ㅎ|ㅏ-ㅑ|가-힣|.|_|-]/g;
		let data = uNickName;
		
		let res = regExp.test(data);
		
		if(uNickName == ""){
			alert("닉네임을 입력해주세요.");
			$("#uNickName").val("");
			$("#uNickName").focus();
		}else if(res){
			alert("닉네임은 한글, 영어대소문자,숫자,마침표,밑줄,대시기호(-),공백만 입력가능합니다.");
			$("#uNickName").val("");
			$("#uNickName").focus();
		}
		
		
	});
	//닉네임 유효성 검사
	
	//Email 유효성 검사 => 공백검사만!
/*	$("#emailAuthBtn").click(function(){
		
		let uEmail_1 = $("#uEmail_1").val().trim();
		let uEmail_2 = $("#uEmail_2").val().trim();
		
		if(uEmail_1=""){
			alert("이메일 주소를 입력해주세요")
			$("#uEmail_1").focus();
		} else if(uEmail_2=""){
			alert("이메일 주소를 입력해주세요")
			$("#uEmail_2").focus();
		} else {
			$("#emailAuthArea").css({"display":"block"})
		}
	});*/
	
	
	// 우편번호 찾기 팝업 
	 $("#regFrm button#findZipBtn").click(function(){
		//alert("OK!");
      fnMapAPI();
   });



var width=500;
var height=772;

function fnMapAPI(){
    new daum.Postcode({
        oncomplete: function(data) {
            var Addr = data.roadAddress;

            if(data.buildingName != null){
                Addr+= " " + data.buildingName + " ";
            }

            document.getElementById('uZipcode').value = data.zonecode;
            document.getElementById('uAddr').value = Addr;
        }
    }).open({
      left: (window.screen.width/2)-(width/2), //popup position Left
      top: (window.screen.height/2)-(height/2), //popup position Top
      popupTitle: '우편번호 검색'                     //popup title
   })
   };
	
	/*
	// 우편번호 팝업창에서 주소 검색
	$("#addrSearchBtn").click(function(){
		let area3 = $("#area3").val().trim();
		if (area3 == "") {
			alert("검색어를 입력해주세요.");
			$("#area3").focus();
		} else {
			$("#zipFrm").submit();
		}
	});
	*/
	/*
	// 우편번호 팝업창에서 주소 선택
	$("table#zipResTbl td").click(function(){
		let txtAddr = $(this).children("span").text();
		let zipcode = txtAddr.substring(0, 7);
		let addr = txtAddr.substring(8);
		window.opener.uZipcode.value = zipcode;
		window.opener.uAddr.value = addr;
		window.close();
	});
	*/
	
	/* 회원가입 버튼 전송 실행 */	
	$("#joinBtn").click(function(){	
	//	alert("OK!");	
		fnJoinSbm();		
	});
	
	/* 폼실행 엔터키 이벤트 처리 */
	$(window).keydown(function(){
		let code = event.keyCode;
		if (code == 13) return false;
	});
	
	/* 폼실행 엔터키 이벤트 처리 */
	$(window).keyup(function(){		
		let code = event.keyCode;
		//alert("code : " + code);
		if (code == 13) fnJoinSbm();
    });

	function fnJoinSbm() {
	
		let uId = $("#uId").val().trim();
		$("#uId").val(uId);
		let uPw = $("#uPw").val().trim();		
		$("#uPw").val(uPw);		
		let uPwRe = $("#uPwRe").val().trim();	
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);
		let uNickName = $("#uNickName").val().trim();
		$("#uNickName").val(uNickName);
		let uEmail_1 = $("#uEmail_1").val().trim();
		let uEmail_2 = $("#uEmail_2").val().trim();
		$("#uEmail").val(uEmail_1+"@"+uEmail_2);
		let uBirthday = $("#uBirthday").val().trim();
		
		if (uId == "") {
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			return;
		} else if (uPw == "") {
			alert("비밀번호를 입력해주세요.");
			$("#uPw").focus();
			return;
		} else if (uPwRe == "" || uPw != uPwRe) {
			alert("비밀번호 일치여부를 확인해주세요.");
			$("#uPw_Re").focus();
			return;
		} else if (uName == "") {
			alert("이름을 입력해주세요.");
			$("#uName").focus();
			return;
		} else if (uNickName == "") {
			alert("닉네임을 입력해주세요.");
			$("#uNickName").focus();
			return;
		}else if (uEmail_1 == "") {
			alert("이메일 아이디를 입력해주세요.");
			$("#uEmail_1").focus();
			return;
		} else if (uEmail_2 == "") {
			alert("이메일 주소를 입력해주세요.");
			$("#uEmail_2").focus();
			return;
		} else if (uBirthday != "" && isNaN(uBirthday)) {
			// 생년월일 숫자유효성 검사
			alert("생년월일은 숫자만 입력할 수 있습니다.");
			$("#uBirthday").val("").focus();
			return;
		} else {
			let chkSbmTF = confirm("회원가입하시겠습니까?");
			if (chkSbmTF) {
				$("#regFrm").attr("action", "memberProc.jsp");
				$("#regFrm").submit();
			}
		}
		}
		
		
		
		/* 고객센터 검색버튼  시작  */
	$("button#searchBtn").click(function(){
	//alert("OK!");
		let supSearch = $("#supSearch").val().trim();
		if (supSearch=="") {
			alert("검색어를 입력해주세요.");
			$("#supSearch").focus();			
		} else {
			$("#searchFrm").attr("action", "supportProc.jsp");
			$("#searchFrm").submit();
			
		}
		
	});	
	/* 고객센터 검색버튼  끝 */
	
	/*고객센터 키워드 */
	
	/* 고객센터 키워드 끝 */
	
////////////////////////////////////////////////////////////////////////
/*//////////회원가입 입력(member/member.jsp) 끝////////////////*/
///////////////////////////////////////////////////////////////////////

});

/* 상세내용 보기 페이지 이동 시작 /supportQ/FAQ.jsp => FAQDetail.jsp */
function read(p1) {
 	//alert("ok");
	let param = "FAQDetail.jsp?num="+p1;
	
	location.href=param;
}		
/* 상세내용 보기 페이지 이동 끝 /supportQ/FAQ.jsp => FAQDetail.jsp  */

function FAQcheck(p1) {
 	//alert("ok");
	let supSearch = "FAQTag.jsp?supSearch="+p1;
	
	location.href=supSearch;
}		