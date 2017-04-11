package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ListVO;
import model.PagingBean;
import model.StoreDAO;
import model.StoreVO;

public class AllStoreListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String loc = request.getParameter("loc");
		//System.out.println("loc : " + loc);
		int totalCount = StoreDAO.getInstance().getTotalStoreCount();
		System.out.println("totalCount " + totalCount);
		String pno = request.getParameter("pageNo");
		System.out.println("pageNo " + pno);
		PagingBean pagingBean = null;
		if (pno == null) {
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pno));
		}
		ArrayList<StoreVO> list = StoreDAO.getInstance().getAllStoreList(pagingBean);
		System.out.println(list);
		ListVO listVO = new ListVO(list, pagingBean);
		request.setAttribute("listVo", listVO);
		
		return "/board/list.jsp";
	}

}
