package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.ReviewDAO;

public class StarScoreController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String menuName=request.getParameter("menuName");
		//JSONObject 를 활용하기 위해서 ReviewVO 에 grade를 넣어주었다.
		JSONObject obj=new JSONObject(ReviewDAO.getInstance().ageGrade(menuName));
		out.print(obj.toString());
		out.close();
		return null;
	}

}
