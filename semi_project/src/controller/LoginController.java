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
		//autologin 생성
		String autologin = request.getParameter("autologin");
		// cookie 저장시간 setting
		int cookie_time = 24*7;
		if(autologin == null){
			autologin ="";
		}
		Cookie cookie [] = new Cookie[5];
		//cookie[2]  = new Cookie("c", c);
		cookie[3]  = new Cookie("autologin", autologin);
		
		// 자돟ㅇ로그인으로 setting 된 경우 7일, 아니라면 3시간
		if(autologin.equals("checked")){
			cookie_time = 24*7;
		}else{
			cookie_time = 3;
		}
		
		// cookie setting
		for(int i=0;i<4;i++){
			cookie[i].setMaxAge(60*60*cookie_time);  //6시간으로 설정
			cookie[i].setPath("/");   //모든 경로에서 접근 가능
			response.addCookie(cookie[i]); // 쿠기 저장
		}
		
		
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
