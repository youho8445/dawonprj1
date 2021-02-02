package com.tech.main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;




public class MemberDAO {

	DataSource dataSource;

	public MemberDAO() {
		
		try {
			Context context = new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String login(String memberid, String memberpw) {
		String sql="select memberpw,membernick from member where memberid=?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String str=null;
		try {
			con=dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1,memberid);
			rs=ps.executeQuery();
			if (rs.next()){
				if(rs.getString(1).equals(memberpw)){
					return rs.getString(2);//로그인 성공
				}else {
					return "비밀번호 불일치";
				}
			}return "아이디 없음";
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return "아이디 및 비밀번호 오류";
	}



	}
	
	

