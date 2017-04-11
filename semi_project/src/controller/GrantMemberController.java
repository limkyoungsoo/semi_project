package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class GrantMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String mId = request.getParameter("mId");
		int result = MemberDAO.getInstance().updateMember(mId);
		if (result == 1) {
			out.print("delete member success");
		} else {
			out.print("delete member fail");
		}
		out.close();
		return "AjaxView";
	}

}
