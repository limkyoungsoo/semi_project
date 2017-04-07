package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.StoreDAO;
import model.StoreVO;

public class MarkListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession(false);
		
		if(session != null){
			MemberVO vo=(MemberVO) session.getAttribute("member");
			String memId=vo.getmId();
			ArrayList<StoreVO> storevo=StoreDAO.getInstance().markList(memId);
			request.setAttribute("markList", storevo);
		}
		return "/board/MenuMark.jsp";
	}

}
