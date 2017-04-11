package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();
	private DataSource dataSource;

	private MemberDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static MemberDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}
	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException{
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public MemberVO checkIdAndPass(String id, String pass) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		try {
			con = getConnection();
			String sql = "select mId,mNick from msgMember where mId=? and mPass=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO(rs.getString(1), rs.getString(2));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return member;
	}

	public boolean searchId(String id) throws SQLException {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = getConnection();
			String sql = "select count(*) from msgMember where mid=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					flag = true;
				}
			}
		} finally {
			closeAll(rs, psmt, con);
		}
		return flag;
	}

	public MemberVO register(String id, String password, String nick) throws SQLException {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberVO vo = null;

		try {
			con = getConnection();
			String sql = "insert into msgMember(mid,mpass,mnick) values(?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			psmt.setString(3, nick);

			System.out.println("아이디ㅟ" + id);
			System.out.println("패스워드" + password);
			System.out.println("닉네임" + nick);

			rs = psmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO(id, password, nick);
			}

		} finally {
			closeAll(rs, psmt, con);
		}

		System.out.println("브잉ㅎ" + vo);
		return vo;
	}

	public void updateMemberInfo(String mId, String mPass, String mNick) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=-1;
		try{
			con=getConnection();
			String sql="update msgMember set mPass=?, mNick=? where mId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mPass);
			pstmt.setString(2, mNick);
			pstmt.setString(3, mId);
			result=pstmt.executeUpdate();
			if(result==1){
				System.out.println("회원정보 변경여부:true");
			}else if(result==0){
				System.out.println("회원정보 변경여부:false");
			}
		}finally{
			closeAll(pstmt, con);
		}
		
	}

	public ArrayList<MemberVO> getAllMembers() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<MemberVO> memberList=new ArrayList<MemberVO>();
		try{
			con=getConnection();
			String sql="select mId,mPass,mNick from msgMember";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				MemberVO vo=new MemberVO();
				vo.setmId(rs.getString(1));
				vo.setmPass(rs.getString(2));
				vo.setmNick(rs.getString(3));
				memberList.add(vo);
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		
		return memberList;
	}

	public int deleteMemberInfo(String mId) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=-2;
		try{
			con=getConnection();
			String sql="delete from msgMember where mId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mId);
			result=pstmt.executeUpdate();
		}finally{
			closeAll(pstmt, con);
		}
		
		return result;
		
	}

}
