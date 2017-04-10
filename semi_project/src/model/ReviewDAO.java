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
	//전체 review 보는 메서드
	public ArrayList<ReviewVO> getReviewList(String storeName) throws SQLException{
		ArrayList<ReviewVO> list=new ArrayList<ReviewVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			StringBuilder sql=new StringBuilder();
			sql.append("select b.reNo, b.menuNo, b.mid, b.review, b.grade, b.time_posted ");
			sql.append("from (select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
			sql.append("from store s, menu m where s.storeName=m.storeName and ");
			sql.append("m.storeName=?) a, menureview b ");
			sql.append("where a.menuNo=b.menuNo");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, storeName);			
			rs=pstmt.executeQuery();
			while(rs.next()){
				ReviewVO vo=new ReviewVO();
				vo.setReviewNo(rs.getInt("reNo"));
				vo.setGrade(rs.getInt("grade"));
				vo.setReview(rs.getString("review"));
				vo.setMid(rs.getString("mid"));
				vo.setTimePosted(rs.getString("time_posted"));
				vo.setMenuNo(rs.getInt("menuNo"));
				list.add(vo);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	//review 분류해서 보는 메서드
	public ArrayList<ReviewVO> selectReview(String menuName) throws SQLException{
		ArrayList<ReviewVO> list=new ArrayList<ReviewVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			StringBuilder sql=new StringBuilder();
			sql.append("select b.reNo, b.menuNo, b.mid, b.review, b.grade, b.time_posted ");
			sql.append("from (select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
			sql.append("from store s, menu m where s.storeName=m.storeName and ");
			sql.append("m.menuName=?) a, menureview b ");
			sql.append("where a.menuNo=b.menuNo");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, menuName);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ReviewVO vo=new ReviewVO();
				vo.setReviewNo(rs.getInt("reviewNo"));
				vo.setGrade(rs.getInt("grade"));
				vo.setReview(rs.getString("review"));
				vo.setMid(rs.getString("mid"));
				vo.setTimePosted(rs.getString("time_posted"));
				vo.setMenuNo(rs.getInt("menuNo"));
				list.add(vo);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	//grade 평균점수 
	public ReviewVO ageGrade(String menuName) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ReviewVO vo=new ReviewVO();
		try{
			con=getConnection(); 
			StringBuilder sql=new StringBuilder();
			sql.append("select round(avg(b.grade),1) as avg_grade ");
			sql.append("from (select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
			sql.append("from store s, menu m where s.storeName=m.storeName and ");
			sql.append("m.menuName=?) a, menureview b ");
			sql.append("where a.menuNo=b.menuNo");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, menuName);
			rs=pstmt.executeQuery();
			while(rs.next()){
				vo.setGrade(rs.getInt("avg_grade"));
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return vo;
	}
	
	// 리뷰 작성 메소드
	public void writeReview(ReviewVO rvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			String sql = "insert into menureview values(reNo_seq.nextval,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rvo.getMenuNo()); //menu id review grade
			pstmt.setString(2, rvo.getMid());
			pstmt.setString(3, rvo.getReview());
			pstmt.setFloat(4, rvo.getGrade());
			rs = pstmt.executeQuery();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(rs, pstmt, con);
		}
				
	}


}

















