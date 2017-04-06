package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO dao=new MemberDAO();
	private DataSource dataSource;
	private MemberDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}
	
	public boolean searchId(String id) throws SQLException{
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con  = getConnection();
			
			String sql = "select count(*) from msgMember where mid=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			
			if(rs.next()){
				if(rs.getInt(1) == 0){
					flag = true;
				}
			}
			
		} finally {
			closeAll(rs,psmt,con);
		}
		
		
		return flag;
		
	}
	public MemberVO register(String id,String password,String nick) throws SQLException {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberVO vo = null ;
		
		try {
			con = getConnection();
			String sql = "insert into msgMember(mid,mpass,mnick) values(?,?,?)";
			con.prepareStatement(sql);
			rs = psmt.executeQuery();
			psmt.setString(1, id);
			psmt.setString(2, password);
			psmt.setString(3, nick);
			
			if(rs.next()){
				vo = new MemberVO(id, password, nick);
			}
			
		} finally {
			closeAll(rs,psmt,con);
		}
		
		return vo;
	}
	

}
