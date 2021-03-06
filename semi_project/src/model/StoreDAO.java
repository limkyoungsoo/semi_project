package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class StoreDAO {
	private static StoreDAO storeDAO = new StoreDAO();
	private DataSource dataSource;

	private StoreDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static StoreDAO getInstance() {
		return storeDAO;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	public ArrayList<StoreVO> getStoreNameList() throws SQLException {
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select distinct storePla from store order by storePla";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				storeList.add(new StoreVO(rs.getString(1)));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return storeList;
	}

	public ArrayList<StoreVO> getStoreShowList() throws SQLException {
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select storeName, storeLoc, storePic from (select * from store order by DBMS_RANDOM.RANDOM()) where rownum<=6";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				storeList.add(new StoreVO(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return storeList;
	}


	public String getRandStore() throws SQLException {
		String storeName = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// select * from store;
			String sql = "select storeName from (select * from store order by DBMS_RANDOM.RANDOM()) where rownum<=1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				storeName = rs.getString(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return storeName;
	}

	// 강정호 제작. 가게 이름으로 가게 정보와 메뉴 정보를 불러오기 위해서 만듬
	public StoreVO getStoreMenuList(String storeName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO = new StoreVO();
		MenuVO menuVO = new MenuVO();
		try {
			con = getConnection();
			String sql = "select s.storeName, s.storeLoc, s.storeTel, s.storePic, s.openHour, "
					+ "m.menuNo, m.menuName, m.menuPrice, m.menuPic  " + "from store s, menu m "
					+ "where s.storeName=m.storeName and m.storeName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storeName);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				storeVO.setStoreName(rs.getString(1));
				storeVO.setStoreLoc(rs.getString(2));
				storeVO.setStoreTel(rs.getString(3));
				storeVO.setStorePic(rs.getString(4));
				storeVO.setOpenHour(rs.getString(5));
				// menuVO에 메뉴번호, 메뉴이름, 메뉴가격, 메뉴사진 저장 -강정호-
				menuVO.setMenuNo(rs.getInt(6));
				menuVO.setMenuName(rs.getString(7));
				menuVO.setMenuPrice(rs.getInt(8));
				menuVO.setMenuPic(rs.getString(9));
				// menuVO를 다시 storeVO에 저장한다. -강정호-
				storeVO.setMenuVO(menuVO);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return storeVO;
	}

	// 강정호 제작- storeName을 이용해서 메뉴사진 3장을 가져오기 위한 메서드입니다.
	public ArrayList<MenuVO> getMenuImgByStoreName(String storeName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		try {
			con = getConnection();
			String sql = "select menuNo,menuName,menuPic from menu where storeName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storeName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MenuVO menuVO = new MenuVO();
				menuVO.setMenuNo(rs.getInt(1));
				menuVO.setMenuName(rs.getString(2));
				menuVO.setMenuPic(rs.getString(3));
				list.add(menuVO);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	// 강정호 제작- 메뉴 번호를 이용해서 메뉴사진 3장을 가져오기 위한 메서드입니다.
	public ArrayList<MenuVO> getMenuImgByMenuNo(String storeName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		try {
			con = getConnection();
			String sql = "select menuPic from menu where storeName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storeName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MenuVO menuVO = new MenuVO();
				menuVO.setMenuPic(rs.getString(1));
				list.add(menuVO);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
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

	// 페이징 을 위한 위치별 가게의 총 게시물을 구하는 sql -- 지원
	public int getTotalContentCount(String storeLoc) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from store where storePla=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storeLoc);
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalCount;
	}

	public int getTotalStoreCount() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from store";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalCount;
	}

	public ArrayList<StoreVO> getStoreList(PagingBean pagingBean, String loc) throws SQLException {
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT S.* FROM(");
			sql.append("SELECT row_number() over(order by storename asc) rnum,");
			sql.append("storename,storepic ");
			sql.append("from store where  storePla=?) S ");
			sql.append("where rnum between ? and ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, loc);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			System.out.println("startRowNum " + pagingBean.getStartRowNumber());
			System.out.println("endRowNum " + pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StoreVO vo = new StoreVO();
				vo.setStoreName(rs.getString("storename"));
				vo.setStorePic(rs.getString("storepic"));
				list.add(vo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public ArrayList<StoreVO> getAllStoreList(PagingBean pagingBean) throws SQLException {
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT S.* FROM(");
			sql.append("SELECT row_number() over(order by storeName asc) rnum,");
			sql.append("storeName,storePic ");
			sql.append("from store) S ");
			sql.append("where rnum between ? and ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());
			System.out.println("startRowNum " + pagingBean.getStartRowNumber());
			System.out.println("endRowNum " + pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StoreVO vo = new StoreVO();
				vo.setStoreName(rs.getString("storeName"));
				vo.setStorePic(rs.getString("storePic"));
				list.add(vo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public StoreVO getOtherMenuInfoByMenuNo(int menuNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO storeVO=new StoreVO();
		MenuVO menuVO=new MenuVO();
		try{
			con=getConnection();
			String sql="select m.menuNo,m.menuName,m.menuPrice,m.menuPic,s.openHour "
					+ "from menu m, store s "
					+ "where m.storeName=s.storeName and m.menuNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, menuNo);
			rs=pstmt.executeQuery();
			if(rs.next()){
				menuVO.setMenuNo(rs.getInt(1));
				menuVO.setMenuName(rs.getString(2));
				menuVO.setMenuPrice(rs.getInt(3));
				menuVO.setMenuPic(rs.getString(4));
				storeVO.setMenuVO(menuVO);
				storeVO.setOpenHour(rs.getString(5));
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return storeVO;
	}
	
	public boolean findStoreByStoreName(String storeName) throws SQLException {
		Connection con = null;
		PreparedStatement psmt =null;
		ResultSet rs = null;
		String sql ="";
		boolean flag = false;
		try {
			con = getConnection();
			sql = "select * from store where storeName=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, storeName);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				flag = true;
			}
		} finally {
			closeAll(rs, psmt, con);
		}
		return flag;
	}
	
	
	
	
	public boolean findMenuNo(String menuNo) throws SQLException {
		Connection con = null;
		PreparedStatement psmt =null;
		ResultSet rs = null;
		String sql ="";
		boolean flag = false;
		
		try {
			con = getConnection();
			sql = "select * from msgMemberMenu where menuno=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, menuNo);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				flag = true;
			}
		} finally {
			closeAll(rs, psmt, con);
		}
		
		return flag;
	}

	public ArrayList<StoreVO> markList(String memId) throws SQLException {
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select m.menuNo,s.storeName,m.menuName,m.menuPrice,");
			sql.append("m.menuPic,s.storeLoc,s.storeTel,s.openHour ");
			sql.append("from MSGMEMBERMENU msg, MENU m,");
			sql.append("STORE s where s.storeName=m.storeName ");
			sql.append("and m.menuNo=msg.menuNo and mId=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MenuVO vo = new MenuVO();
				vo.setMenuName(rs.getString("menuName"));
				vo.setMenuNo(rs.getInt("menuNo"));
				vo.setMenuPic(rs.getString("menuPic"));
				vo.setMenuPrice(rs.getInt("menuPrice"));
				StoreVO svo= new StoreVO();
				svo.setOpenHour(rs.getString("openHour"));
				svo.setStoreLoc(rs.getString("storeLoc"));
				svo.setStoreName(rs.getString("storeName"));
				svo.setStoreTel(rs.getString("storeTel"));
				svo.setMenuVO(vo);
				
				list.add(svo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	 public void insertMenumark(String memId, String menuNo) throws SQLException {
      Connection con = null;
      PreparedStatement psmt =null;
      ResultSet rs = null;
      int no = Integer.parseInt(menuNo);
      
      try {
         con = getConnection();
         String sql ="insert into msgMemberMenu(menuno,mid) values(?,?)";
         psmt = con.prepareStatement(sql);
         psmt.setInt(1, no);
         psmt.setString(2, memId);
         psmt.executeUpdate();
         
      } finally {
         closeAll(rs, psmt, con);
      }
      
   }
	 
	public void deleteMenumark(int menuNo) throws SQLException {
		Connection con = null;
	      PreparedStatement psmt =null;
	      ResultSet rs = null;
	      
	      try {
	         con = getConnection();
	         String sql ="delete msgMemberMenu where menuNo=?";
	         psmt = con.prepareStatement(sql);
	         psmt.setInt(1, menuNo);
	         psmt.executeUpdate();
	         
	      } finally {
	         closeAll(rs, psmt, con);
	      }
	}
	public ArrayList<StoreVO>  getAdminStoreList(PagingBean pagingBean) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT S.* FROM(");
			sql.append("SELECT row_number() over(order by storeName asc) rnum,");
			sql.append("storeName,storePic,storeLoc,storeTel,openHour,storePla ");
			sql.append("from store) S ");
			sql.append("where rnum between ? and ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());
			System.out.println("startRowNum " + pagingBean.getStartRowNumber());
			System.out.println("endRowNum " + pagingBean.getEndRowNumber());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StoreVO vo = new StoreVO();
				vo.setRnum(rs.getInt("rnum"));
				vo.setStoreName(rs.getString("storeName"));
				vo.setStorePic(rs.getString("storePic"));
				vo.setStoreLoc(rs.getString("storeLoc"));
				vo.setStoreTel(rs.getString("storeTel"));
				vo.setOpenHour(rs.getString("openHour"));
				vo.setStorePla(rs.getString("storePla"));
				list.add(vo);
				System.out.println("리스트>>>>>>"+list);
			}
			
			for(int i=0; i<list.size();i++){
				System.out.println("test"+list.get(i).toString());
			}
			
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public StoreVO getAdminStoreModify(String name) throws SQLException {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		StoreVO vo = new StoreVO();
		
		try {
			con = getConnection();
			String sql = "SELECT S.* FROM("
					+ "SELECT row_number() over(order by storeName asc) rnum,"
					+ "storeName,storePic,storeLoc,storeTel,openHour "
					+ "from store) S where storeName=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				vo.setRnum(rs.getInt("rnum"));
				vo.setStoreName(rs.getString("storeName"));
				vo.setStorePic(rs.getString("storePic"));
				vo.setStoreLoc(rs.getString("storeLoc"));
				vo.setStoreTel(rs.getString("storeTel"));
				vo.setOpenHour(rs.getString("openHour"));
			}
		} finally {
			closeAll(rs, psmt, con);
		}
		
		return vo;
	}

	public void editStoreInfo(String name, String loc, String time, String tel, String pic,String storename) throws SQLException {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		System.out.println(name+">>"+loc+">>"+tel+">>"+time+">>"+pic+">>"+storename);
		
		try {
			con = getConnection();
			String sql = "update store set storeLoc=?,storeTel=?, storePic=?,openHour=?,storePla=?  where storeName=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, loc);
			psmt.setString(2, tel);
			psmt.setString(3, pic);
			psmt.setString(4, time);
			psmt.setString(5, storename);
			psmt.setString(6, name);
			psmt.executeUpdate();
			
			
		} finally {
			closeAll(rs, psmt, con);
		}
		
	}

	public void adminStoreDelete(String storeName) throws SQLException {
		Connection con = null;
	      PreparedStatement psmt =null;
	      ResultSet rs = null;
	      
	      try {
	         con = getConnection();
	         String sql ="delete store where storename=?";
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, storeName);
	         psmt.executeUpdate();
	         
	      } finally {
	         closeAll(rs, psmt, con);
	      }
	}

	public int insertStore(StoreVO store,ArrayList<MenuVO> menu) throws SQLException {
		Connection con = null;
		PreparedStatement psmt = null;
		int result = -1;
		try {
			con = getConnection();
			String sql = "insert into store(storeName,storeLoc,storeTel,openHour,storePic,storePla) values(?,?,?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, store.getStoreName());
			psmt.setString(2, store.getStoreLoc());
			psmt.setString(3, store.getStoreTel());
			psmt.setString(4, store.getOpenHour());
			psmt.setString(5, store.getStorePic());
			psmt.setString(6, store.getStorePla());
			result= psmt.executeUpdate();
			psmt.close();
			
//			 menuNo number primary key,
//			 storeName varchar2(100) not null,
//			 menuName varchar2(100) not null,
//			 menuPrice number not null,
//			 menuPic varchar2(200) not null,
			sql = "insert into menu(menuNo,storeName,menuName,menuPrice,menuPic) values(menuNo_seq.nextval,?,?,?,?)";
			for(int i=0;i<menu.size();i++){
				psmt = con.prepareStatement(sql);
				psmt.setString(1, store.getStoreName());
				psmt.setString(2, menu.get(i).getMenuName());
				psmt.setInt(3, menu.get(i).getMenuPrice());
				psmt.setString(4, menu.get(i).getMenuPic());
				psmt.executeUpdate();
				psmt.close();
			}
			if(result > 0){
				System.out.println(store.toString());
			}
			else if(result <0){
				System.out.println("가게 등록 실패");
			}
		} finally {
			closeAll(psmt, con);
		}
		return result;
		
	}


}
