package pack_Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import pack_Customer.CustomBoardBean;
import pack_DBCP.DBConnectionMgr;
import pack_Member.MemberMgr;

public class CustomerMgr {

	Connection				objConn 		=		null;
	Statement					objStmt			=		null;	
	ResultSet					objRS			=		null;  	
	PreparedStatement 	objPstmt 		=		null; 
	DBConnectionMgr 		objPool 		= 		null;

	public static void main(String[] args) {
		new MemberMgr( );
	}


	/*  게시판 리스트 출력 (/support/supportProc.jsp) 시작    */
	public Vector<CustomBoardBean> getCustomBoardList(String supSearch) {

		Vector<CustomBoardBean> vList = new Vector<>();
		String sql = null;

		try {
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();
			
				sql = "select * from tblQuestion "
				//		+ "where is_FAQ=1 and subject like ? "   //|| and subject % ? % "
						+ "where subject like ? "
						+ "order by num desc";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%" + supSearch + "%");
				objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				CustomBoardBean vBean = new CustomBoardBean();
				vBean.setNum(objRS.getInt("num"));
				vBean.setSubject(objRS.getString("subject"));
				vBean.setContent(objRS.getString("content"));
				vBean.setClassification(objRS.getString("classification"));
				vBean.setSubclass(objRS.getString("subclass"));
				vBean.setqAuthor(objRS.getString("qAuthor"));
				vBean.setqWriteDate(objRS.getString("qWriteDate"));
				vBean.setIs_Answer(objRS.getInt("is_Answer"));
				vBean.setAnswer(objRS.getString("answer"));
				vBean.setaAuthor(objRS.getString("aAuthor"));
				vBean.setaWriteDate(objRS.getString("aWriteDate"));
				vBean.setIs_FAQ(objRS.getInt("is_FAQ"));
				vBean.setqCategory(objRS.getString("qCategory"));
				vList.add(vBean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} 
		
		finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return vList;
	}


	/*  게시판 리스트 출력(/bbs/list.jsp) 끝  */
	
	
	
	/*  FAQ List 출력 (/supportQ/FAQ.jsp) 시작    */
	public Vector<CustomBoardBean> getFAQBoardList() {

		Vector<CustomBoardBean> cList = new Vector<>();
		String sql = null;

		try {
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection();
			
				sql = "select * from tblQuestion "
						+ "where is_FAQ=1 "   //|| and subject % ? % "
						+ " order by num desc";
				objPstmt = objConn.prepareStatement(sql);
				
				objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				CustomBoardBean cBean = new CustomBoardBean();
				cBean.setNum(objRS.getInt("num"));
				cBean.setSubject(objRS.getString("subject"));
				cBean.setContent(objRS.getString("content"));
				cBean.setClassification(objRS.getString("classification"));
				cBean.setSubclass(objRS.getString("subclass"));
				cBean.setqAuthor(objRS.getString("qAuthor"));
				cBean.setqWriteDate(objRS.getString("qWriteDate"));
				cBean.setIs_Answer(objRS.getInt("is_Answer"));
				cBean.setAnswer(objRS.getString("answer"));
				cBean.setaAuthor(objRS.getString("aAuthor"));
				cBean.setaWriteDate(objRS.getString("aWriteDate"));
				cBean.setIs_FAQ(objRS.getInt("is_FAQ"));
				cBean.setqCategory(objRS.getString("qCategory"));
				cList.add(cBean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return cList;
	}


	/*  FAQ List 출력(/supportQ/FAQ.jsp) 끝  */


	/*	상세보기 페이지 게시글 출력 시작 (/supportQ/FAQDetail.jsp, 내용보기 페이지) */
	public CustomBoardBean getBoard(int num) {
		String sql = null;

		CustomBoardBean bean = new CustomBoardBean();
		try {
			objConn = objPool.getConnection(); 
			sql = "select * from tblQuestion where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				bean.setNum(objRS.getInt("num"));
				bean.setSubject(objRS.getString("subject"));
				bean.setContent(objRS.getString("content"));
				bean.setClassification(objRS.getString("classification"));
				bean.setSubclass(objRS.getString("subclass"));
				bean.setqAuthor(objRS.getString("qAuthor"));
				bean.setqWriteDate(objRS.getString("qWriteDate"));
				bean.setIs_Answer(objRS.getInt("is_Answer"));
				bean.setAnswer(objRS.getString("answer"));
				bean.setaAuthor(objRS.getString("aAuthor"));
				bean.setaWriteDate(objRS.getString("aWriteDate"));
				bean.setIs_FAQ(objRS.getInt("is_FAQ"));
				bean.setqCategory(objRS.getString("qCategory"));
			
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return bean;
	} 
	/*	상세보기 게시글 출력 끝 (/supportQ/FAQDetail.jsp, 내용보기 페이지) */
	
	/* 결제관련 페이지 출력 시작 (/support/FAQTag.jsp, 게시판보기) */
	public Vector<CustomBoardBean> getPayList(String pay) {
		String sql = null;

		Vector<CustomBoardBean> checkList = new Vector<>();
		try {
			objPool = DBConnectionMgr.getInstance();
			objConn = objPool.getConnection(); 
			sql = "select num, subject from tblQuestion where qCategory=? order by num desc";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, pay);
			objRS = objPstmt.executeQuery();


			while (objRS.next()) {
				CustomBoardBean chkBean = new CustomBoardBean();
				chkBean.setNum(objRS.getInt("num"));
				chkBean.setSubject(objRS.getString("subject"));
				
				checkList.add(chkBean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return checkList;
	} 
	/* 결제관련 페이지 출력 끝 (/support/FAQTag.jsp, 게시판보기) */
}
