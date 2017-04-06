package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String command = request.getParameter("command");
		System.out.println(command+" in controller");
		
		String result = "";
		
		
		return result;
	}

}
