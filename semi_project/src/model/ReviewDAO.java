package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ReviewDAO {
   private static ReviewDAO dao = new ReviewDAO();
   private DataSource dataSource;

   private ReviewDAO() {
      dataSource = DataSourceManager.getInstance().getDataSource();
   }

   public static ReviewDAO getInstance() {
      return dao;
   }

   public Connection getConnection() throws SQLException {
      return dataSource.getConnection();
   }

   public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
      if (pstmt != null)
         pstmt.close();
      if (con != null)
         con.close();
   }

   public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
      if (rs != null)
         rs.close();
      closeAll(pstmt, con);
   }

   // 메뉴 당 총 리뷰 수
   public int getTotalMenuReivewCount(String storeName, String menuName) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int totalCount = 0;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select count(*) ");
         sql.append("from(select menuNo from menu where storeName=? and menuName =?) m,");
         sql.append(" menureview r where m.menuNo=r.menuNo");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         pstmt.setString(2, menuName);
         rs = pstmt.executeQuery();
         if (rs.next())
            totalCount = rs.getInt(1);
      } finally {
         closeAll(rs, pstmt, con);
      }
      return totalCount;
   }

   // 가게 당 총 리뷰 개수
   public int getTotalReivewCount(String storeName) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int totalCount = 0;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select count(*) ");
         sql.append("from(select menuNo from menu where storeName=?) m,");
         sql.append(" menureview r where m.menuNo=r.menuNo");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         rs = pstmt.executeQuery();
         if (rs.next())
            totalCount = rs.getInt(1);
      } finally {
         closeAll(rs, pstmt, con);
      }
      return totalCount;
   }

   // 페이징이 나눠진 리뷰리스트
   public ArrayList<ReviewVO> getAllReviewList(PagingBean pagingBean, String storeName) throws SQLException {
      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select c.* from ");
         sql.append("(select row_number() over(order by b.reNo desc) rnum, b.reNo, b.menuNo, ");
         sql.append("b.mid, b.review, b.grade, b.time_posted, a.menuName from ");
         sql.append("(select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
         sql.append("from store s, menu m where s.storeName=m.storeName and m.storeName=?) ");
         sql.append("a, menureview b where a.menuNo=b.menuNo) c where rnum between ? and ?");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         pstmt.setInt(2, pagingBean.getStartRowNumber());
         pstmt.setInt(3, pagingBean.getEndRowNumber());
         System.out.println("startRowNum " + pagingBean.getStartRowNumber());
         System.out.println("endRowNum " + pagingBean.getEndRowNumber());
         rs = pstmt.executeQuery();
         while (rs.next()) {
            ReviewVO rvo = new ReviewVO(rs.getInt("reNo"), rs.getFloat("grade"), rs.getString("review"),
                  rs.getString("mid"), rs.getString("time_Posted"), rs.getInt("menuNo"),
                  rs.getString("menuName"));
            list.add(rvo);
         }
      } finally {
         closeAll(rs, pstmt, con);
      }
      return list;
   }

   // 전체 review 보는 메서드
   public ArrayList<ReviewVO> getReviewList(String storeName) throws SQLException {
      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append(
               "select b.reNo, b.menuNo, b.mid, b.review, b.grade, to_char(time_posted,'YYYY.MM.DD') as time_posted, a.menuName ");
         sql.append("from (select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
         sql.append("from store s, menu m where s.storeName=m.storeName and ");
         sql.append("m.storeName=?) a, menureview b ");
         sql.append("where a.menuNo=b.menuNo");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            ReviewVO vo = new ReviewVO();
            vo.setReviewNo(rs.getInt("reNo"));
            vo.setGrade(rs.getInt("grade"));
            vo.setReview(rs.getString("review"));
            vo.setMid(rs.getString("mid"));
            vo.setTimePosted(rs.getString("time_posted"));
            vo.setMenuNo(rs.getInt("menuNo"));
            vo.setMenuName(rs.getString("menuName"));
            list.add(vo);
         }
      } finally {
         closeAll(rs, pstmt, con);
      }
      return list;
   }

   // review 분류해서 보는 메서드
   public ArrayList<ReviewVO> selectReview(String storeName, String menuName) throws SQLException {
      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select b.reNo, b.menuNo, b.mid, b.review, b.grade, b.time_posted, a.menuName ");
         sql.append("from (select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
         sql.append("from store s and menu m where s.storeName=m.storeName and ");
         sql.append("s.storeName=?, m.menuName=?) a, menureview b ");
         sql.append("where a.menuNo=b.menuNo");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         pstmt.setString(2, menuName);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            ReviewVO vo = new ReviewVO();
            vo.setReviewNo(rs.getInt("reNo"));
            vo.setGrade(rs.getInt("grade"));
            vo.setReview(rs.getString("review"));
            vo.setMid(rs.getString("mid"));
            vo.setTimePosted(rs.getString("time_posted"));
            vo.setMenuNo(rs.getInt("menuNo"));
            vo.setMenuName(rs.getString("menuName"));
            list.add(vo);
         }
      } finally {
         closeAll(rs, pstmt, con);
      }
      return list;
   }

   ///// 메뉴명에 따른 평균 점수 출력
   public ArrayList<ReviewVO> avgGrade(String storeName, String menuName) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ReviewVO vo = new ReviewVO();
      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select round(avg(b.grade),1) as avg_grade ");
         sql.append("from (select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
         sql.append("from store s, menu m where s.storeName=m.storeName and ");
         sql.append("s.storeName=? and m.menuName=?) a, menureview b ");
         sql.append("where a.menuNo=b.menuNo");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         pstmt.setString(2, menuName);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            vo.setAvgGrade((rs.getInt("avg_grade")));
            list.add(vo);
         }
      } finally {
         closeAll(rs, pstmt, con);
      }
      return list;
   }

   ///// 메뉴명에 따른 메뉴 출력
   public ArrayList<ReviewVO> selectR(PagingBean pagingBean, String storeName, String menuName) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select c.* from ");
         sql.append("(select row_number() over(order by b.reNo desc) rnum, b.reNo, b.menuNo, ");
         sql.append("b.mid, b.review, b.grade, b.time_posted, a.menuName from ");
         sql.append("(select m.menuNo, m.menuName, m.menuPrice, s.storeName ");
         sql.append("from store s, menu m where s.storeName=? and m.menuName=?) ");
         sql.append("a, menureview b where a.menuNo=b.menuNo) c where rnum between ? and ?");

         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, storeName);
         pstmt.setString(2, menuName);
         pstmt.setInt(3, pagingBean.getStartRowNumber());
         pstmt.setInt(4, pagingBean.getEndRowNumber());
         rs = pstmt.executeQuery();
         while (rs.next()) {
            ReviewVO vo = new ReviewVO();
            vo.setReviewNo(rs.getInt("reNo"));
            vo.setGrade(rs.getInt("grade"));
            vo.setReview(rs.getString("review"));
            vo.setMid(rs.getString("mid"));
            vo.setTimePosted(rs.getString("time_posted"));
            vo.setMenuNo(rs.getInt("menuNo"));
            vo.setMenuName(rs.getString("menuName"));
            list.add(vo);
         }
      } finally {
         closeAll(rs, pstmt, con);
      }
      return list;
   }

   // 리뷰 작성 메소드
   public void writeReview(ReviewVO rvo) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = getConnection();

         String sql = "insert into menuReview(reNo,menuNo,mId,review,grade,time_posted) values(reNo_seq.nextval,?,?,?,?,sysdate)";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, rvo.getMenuNo()); // menu id review grade
         pstmt.setString(2, rvo.getMid());
         pstmt.setString(3, rvo.getReview());
         pstmt.setFloat(4, rvo.getGrade());
         pstmt.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         closeAll(rs, pstmt, con);
      }

   }

}