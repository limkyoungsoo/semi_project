package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("userId");
		String pass = request.getParameter("InputPassword1");
		String nick = request.getParameter("username");
		
		MemberVO vo =  MemberDAO.getInstance().register(id,pass,nick);
		
		
		String url = "board/register_ok.jsp";
		
		return url;
	}

}
