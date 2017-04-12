package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.ReviewDAO;

public class ReviewListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String storeName=request.getParameter("storeName");
		PrintWriter out = response.getWriter();
		JSONArray reviewJson = new JSONArray(ReviewDAO.getInstance().getReviewList(storeName));
		out.println(reviewJson.toString());
		System.out.println(reviewJson.toString());
		out.close();
		
		/*// paging bean
		int totalCount = ReviewDAO.getInstance().getTotalReivewCount(storeName);
		String pno=request.getParameter("pageNo");	
		System.out.println(pno);
		
		PagingBean pagingBean=null;
		if(pno==null){
			pagingBean=new PagingBean(totalCount);
		}else{
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pno));
		}
		ArrayList<ReviewVO> list=ReviewDAO.getInstance().getAllReviewList(pagingBean);		
		ReviewListVO listVO=new ReviewListVO(list,pagingBean);
		request.setAttribute("rlistVo", listVO);*/
		
		return "AjaxView";
	}
}
