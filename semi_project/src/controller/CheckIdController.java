package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class CheckIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("id");
		System.out.println(userId);
		
		// ID 중복 체크해서 불린형으로
		String flag = MemberDAO.getInstance().searchId(userId);
		// flag -> true, false
		
		
		return flag;
	}

}
