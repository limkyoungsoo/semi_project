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
	
	public String searchId(String id) throws SQLException{
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String flag = "false";
		
		try {
			con  = getConnection();
			System.out.println("연결상태"+con);
			
			String sql = "select mid from msgMember where mid=?";
			
			System.out.println("sql_______"+sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			
			if(rs.next()){
				flag = "true";
			}
			
		} finally {
			closeAll(rs,psmt,con);
		}
		
		return flag;
		
	}
	

}
