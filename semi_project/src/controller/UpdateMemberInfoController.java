package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class UpdateMemberInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url=null;
		HttpSession session=request.getSession(false);
		if(session!=null){
			String mId=request.getParameter("nameId");
			System.out.println(mId);
			String mPass=request.getParameter("namePW");
			String mNick=request.getParameter("nameNick");
			MemberDAO.getInstance().updateMemberInfo(mId, mPass, mNick);
			MemberVO updatedMemberInfo=MemberDAO.getInstance().checkIdAndPass(mId, mPass);
			session.setAttribute("member", updatedMemberInfo);
			url="/main.jsp";
		}else{
			url="/board/update_fail.jsp";
		}
		return url;
	}

}
