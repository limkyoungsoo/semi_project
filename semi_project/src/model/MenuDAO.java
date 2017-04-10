package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MenuDAO {
	
	private static MenuDAO dao=new MenuDAO();
	private DataSource dataSource;
	private MenuDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MenuDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public void closeAll(ResultSet rs,PreparedStatement psmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(psmt!=null)
			psmt.close();
		if(con!=null)
			con.close(); 
	}
	


}
