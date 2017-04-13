package controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.MenuVO;
import model.StoreDAO;
import model.StoreVO;

public class AdminStoreInsertController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception, SQLIntegrityConstraintViolationException {
		MultipartRequest multi = null;
		int sizeLimit = 10 * 450 * 750; // 10메가입니다.
		// String savePath =
		// request.getSession().getServletContext().getRealPath("/upload"); //
		// 파일이 업로드될 실제 tomcat 폴더의 WebContent 기준
		String savePath ="D:\\WAS\\project-tomcat\\webapps\\semi_project\\storeImg";
		//String savePath = "D:\\WAS\\project-tomcat\\webapps\\semi_project\\storeImg";
		//C:\Users\KOSTA\git\semi_project\semi_project\WebContent\storeImg
		// C:\java-kosta\semi-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String attachedFile = multi.getFilesystemName("attachedFile");
		String storeName = multi.getParameter("storeName");
		String storePla = multi.getParameter("storePla");
		String storeLoc = multi.getParameter("storeLoc");
		String storeTel = multi.getParameter("storeTel");
		String storeHour = multi.getParameter("storeHour");
		String menuName1 = multi.getParameter("menuName1");
		String menuPrice1 = multi.getParameter("menuPrice1");
		String menuPic1 = multi.getFilesystemName("menuPic1");
		String menuName2 = multi.getParameter("menuName2");
		String menuPrice2 = multi.getParameter("menuPrice2");
		String menuPic2 = multi.getFilesystemName("menuPic2");
		String menuName3 = multi.getParameter("menuName3");
		String menuPrice3 = multi.getParameter("menuPrice3");
		String menuPic3 = multi.getFilesystemName("menuPic3");

		StoreVO store = new StoreVO(storeName, storeLoc,storeTel, attachedFile, storeHour, storePla);
//		private String menuName;
//		private int menuPrice;
//		private String menuPic;
		ArrayList<MenuVO> menu = new ArrayList<MenuVO>();
		menu.add(new MenuVO(menuName1,Integer.parseInt(menuPrice1),menuPic1));
		menu.add(new MenuVO(menuName2,Integer.parseInt(menuPrice2),menuPic2));
		menu.add(new MenuVO(menuName3,Integer.parseInt(menuPrice3),menuPic3));
		
		
		
		
		int result = StoreDAO.getInstance().insertStore(store,menu);
		String path =null;
		if(result >0){
			path = "redirect:DispatcherServlet?command=storeShow";
		}
		path = "redirect:DispatcherServlet?command=storeShow";
		return path;

	}

}