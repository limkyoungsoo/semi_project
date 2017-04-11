package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class AdminMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<MemberVO> allMemberList=MemberDAO.getInstance().getAllMembers();
		request.setAttribute("allMemberList", allMemberList);
		return "/board/adminMemberList.jsp";
	}

}
