package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ListVO;
import model.PagingBean;
import model.StoreDAO;
import model.StoreVO;

public class ListController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String loc=request.getParameter("loc");
		int totalCount=StoreDAO.getInstance().getTotalContentCount(loc);
		String pno=request.getParameter("pageNo");
		PagingBean pagingBean=null;
		if(pno==null){
			pagingBean=new PagingBean(totalCount);
		}else{
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pno));
		}
		ArrayList<StoreVO> list=StoreDAO.getInstance().getStoreList(pagingBean, loc);
		System.out.println(list);
		ListVO listVO=new ListVO(list,pagingBean);
		request.setAttribute("listVo", listVO);
		request.setAttribute("loc", loc);
		return "/board/list.jsp";
	}

}
