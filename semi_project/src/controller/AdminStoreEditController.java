package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;

public class AdminStoreEditController implements Controller  {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		 
		String name  = request.getParameter("name");
		String loc  = request.getParameter("loc");
		String tel  = request.getParameter("tel");
		String time  = request.getParameter("time");
		String pic  = request.getParameter("picname");
		String storename  = request.getParameter("storeName");
		
		System.out.println(">>name>>"+name);
		System.out.println(">>loc>>"+loc);
		System.out.println(">>tel>>"+tel);
		System.out.println(">>time>>"+time);
		System.out.println(">>pic>>"+pic);
		System.out.println(">>storename>>"+storename);
		
		StoreDAO.getInstance().editStoreInfo(name,loc,tel,time,pic,storename);
		System.out.println(">>edit result>>");
		
		System.out.println("수정이 완료되었습니다.");
		
		request.setCharacterEncoding("utf-8");
		System.out.println("name"+name);
		return "DispatcherServlet?command=adminStore";
		
	}

}
