package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class MemberMgr {
	
	Connection				objConn 		=		null;
	Statement					objStmt			=		null;	
	ResultSet					objRS			=		null;  	
	PreparedStatement 	objPstmt 		=		null; 
	DBConnectionMgr 		objPool 		= 		null;

	public static void main(String[] args) {
		new MemberMgr( );
	}
			
	/* 로그인 처리 시작 (/member/loginProc.jsp) */
	public boolean loginMember(String id, String pw) {
		
		boolean loginChkTF = false;
		try {
			
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();		
			
			String sql = "select count(*) from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, id);
			objPstmt.setString(2, pw);
			objRS = objPstmt.executeQuery();
			
			if (objRS.next()) {
				
				int recordCnt = objRS.getInt(1);
				if (recordCnt == 1) loginChkTF = true;   
				
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return loginChkTF;
		
	}
	/* 로그인 처리 끝 (/member/loginProc.jsp) */
	

///////////////////////////////////////ID중복체크 시작//////////////////////////////////////////////////////

public boolean checkId(String uId) {

boolean res = false; // 임시 초기화

try {
objPool = DBConnectionMgr.getInstance();
objConn = objPool.getConnection();
// PreparedStatement방식

String sql = "select count(*) from member where uId = ?";
objPstmt = objConn.prepareStatement(sql);

objPstmt.setString(1, uId);
objRS = objPstmt.executeQuery();

if (objRS.next()) {
//System.out.println("입력한 ID의 갯수 : " + objRS.getInt(1));
int recordCnt = objRS.getInt(1);
if (recordCnt == 1)
res = true;
}

} catch (Exception e) {
System.out.println("Exception" + e.getMessage());
} finally {
objPool.freeConnection(objConn, objPstmt, objRS);
}

return res;
}

///////////////////////////////////////ID중복체크 시작//////////////////////////////////////////////////////

////////////////////////////////////////회원가입 시작//////////////////////////////////////////////////////

public boolean insertMember(MemberBean bean) {

boolean result = false;

try {
objPool = DBConnectionMgr.getInstance();
objConn = objPool.getConnection();
String sql = "insert into member(uId,uPw,uName,uNickName,uEmail,gender,uBirthday,uZipcode,uAddr,uInterest) values(?,?,?,?,?,?,?,?,?,?);";
objPstmt = objConn.prepareStatement(sql);

objPstmt.setString(1, bean.getuId());
objPstmt.setString(2, bean.getuPw());
objPstmt.setString(3, bean.getuName());
objPstmt.setString(4, bean.getuNickName());
objPstmt.setString(5, bean.getuEmail());
objPstmt.setString(6, bean.getGender());
objPstmt.setString(7, bean.getuBirthday());
objPstmt.setString(8, bean.getuZipcode());
objPstmt.setString(9, bean.getuAddr());
String[] interest = bean.getuInterest();
String[] interestName = { "미정1", "미정2", "미정3", "미정4", "미정5" };
char[] interestCode = { '0', '0', '0', '0', '0' };
if(interest !=null) {
for (int i = 0; i < interest.length; i++) {
for (int j = 0; j < interestName.length; j++) {
if (interest[i].equals(interestName[j])) {
interestCode[j] = '1';
}
}
}
}
objPstmt.setString(10, new String(interestCode));
if (objPstmt.executeUpdate() == 1) {
result = true;
System.out.println(result);
} else {
System.out.println("연결실패");
}

} catch (Exception e) {
System.out.println(e.getMessage());
} finally {
objPool.freeConnection(objConn, objPstmt, objRS);
}
return result;
}

////////////////////////////////////////회원가입 끝//////////////////////////////////////////////////////

///////////////////////////////////////우편번호검색 시작//////////////////////////////////////////////////////
/*
public List<ZipcodeBean> zipcodeRead(String area3) {

List<ZipcodeBean> objList = new Vector<ZipcodeBean>();

try {
objConn = objPool.getConnection();
// PreparedStatement방식

String sql = "select zipcode, area1, area2, area3, area4 from tblZipcode where area3 like ?";
objPstmt = objConn.prepareStatement(sql);

objPstmt.setString(1, "%" + area3 + "%");
objRS = objPstmt.executeQuery();

while (objRS.next()) {
ZipcodeBean zipBean = new ZipcodeBean();
zipBean.setZipcode(objRS.getString(1));
zipBean.setArea1(objRS.getString(2));
zipBean.setArea2(objRS.getString(3));
zipBean.setArea3(objRS.getString(4));
zipBean.setArea4(objRS.getString(5));

objList.add(zipBean);
}

} catch (Exception e) {
System.out.println("Exception" + e.getMessage());
} finally {
objPool.freeConnection(objConn, objPstmt, objRS);
}

return objList;
}
*/
///////////////////////////////////////우편번호검색 끝//////////////////////////////////////////////////////

//////////////////////////////////로그인 사용자 이름 반환시작//////////////////////////////////////////////

public String getMemberuNickName(String uId) {

String uNickName = "";		
String sql = null;

try {			

objPool = DBConnectionMgr.getInstance();			
objConn = objPool.getConnection();
sql = "select uNickName from member where uId=?";
objPstmt = objConn.prepareStatement(sql);
objPstmt.setString(1, uId);

objRS = objPstmt.executeQuery();
if (objRS.next()) {
uNickName = objRS.getNString(1);				
}

} catch (Exception e) {	
System.out.println("Exception 이슈 : " + e.getMessage());	
} finally {
objPool.freeConnection(objConn, objPstmt, objRS);
}


return uNickName;
}

//////////////////////////////////로그인 사용자 이름 반환끝//////////////////////////////////////////////


}
