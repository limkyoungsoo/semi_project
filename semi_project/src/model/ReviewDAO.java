package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ReviewDAO {
	private static ReviewDAO dao=new ReviewDAO();
	private DataSource dataSource;
	private ReviewDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ReviewDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt,con);
	}	
	public ArrayList<ReviewVO> getReviewList() throws SQLException{
		ArrayList<ReviewVO> list=new ArrayList<ReviewVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			pstmt=con.prepareStatement("SELECT reno,menuno,mid,review,grade,to_char(time_posted,'YYYY.MM.DD') as time_posted from menureview order by no desc");			
			rs=pstmt.executeQuery();
			while(rs.next()){
				ReviewVO vo=new ReviewVO();
				vo.setReviewNo(rs.getInt("reviewNo"));
				vo.setGrade(rs.getInt("grade"));
				vo.setReview(rs.getString("review"));
				vo.setMid(rs.getString("mid"));
				vo.setTimePosted(rs.getString("time_posted"));
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
}

















