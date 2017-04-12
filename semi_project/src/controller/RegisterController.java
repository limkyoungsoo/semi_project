package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("nameId");
		String pass = request.getParameter("namePW");
		String nick = request.getParameter("nameNick");
		
		System.out.println("아이디ㅟ"+id);
		System.out.println("패스워드"+pass);
		System.out.println("닉네임"+nick);
		
		MemberVO vo = new MemberVO(MemberDAO.getInstance().register(id,pass,nick));
		
		String url = "board/register_ok.jsp?id="+vo.getmId();
		
		return url;
	}

}
