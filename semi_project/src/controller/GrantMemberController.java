package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class GrantMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String mId = request.getParameter("mId");
		String result = MemberDAO.getInstance().updateMember(mId);
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			if(member.getmId().equals(mId)){
				member.setmGrant(result);
				session.setAttribute("member", member);
			}
		}

		if (result != null) {
			out.print("grant member success");
		} else {
			out.print("grant member fail");
		}
		out.close();
		return "AjaxView";
	}

}
