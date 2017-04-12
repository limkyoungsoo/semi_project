package controller;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		System.out.println("아이디 : " + id + "패스워드 : " + pass);
		MemberVO member = MemberDAO.getInstance().checkIdAndPass(id, pass);

		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			session.setMaxInactiveInterval(30000);
			out.print("true");
		} else {
			out.print("false");
		}
		out.close();
		return "AjaxView";
	}

}
