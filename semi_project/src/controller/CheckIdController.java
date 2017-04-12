package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class CheckIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("id");

		// ID 중복 체크해서 불린형으로
		boolean flag = MemberDAO.getInstance().searchId(userId);
		// flag -> true, false
		PrintWriter out = response.getWriter();

		if (flag == true) {
			out.print("ok"); // 사용가능
		} else {
			out.print("fail");// 사용불가
		}
		out.close();

		return "AjaxView";
	}

}
