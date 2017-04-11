package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.StoreDAO;

public class MarkInsertController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String menuNo = request.getParameter("menuno");
		HttpSession session = request.getSession(false);
		
		if(session != null){
			// member의 id만 갖고 올라고
			MemberVO vo = (MemberVO) session.getAttribute("member");
			String memId = vo.getmId();
			
			// member, store 각자 두번 넣어주기...
			boolean flag =  StoreDAO.getInstance().findMenuNo(menuNo);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if(flag != true){
				// findMenuNo가 false 일때 들어감
				StoreDAO.getInstance().insertMenumark(memId, menuNo);
				System.out.println("findMenuNo::::"+flag);
				out.println("찜 등록 완료되었습니다.");
			}else{
				out.println("이미 등록된 메뉴입니다.");
			}
			out.close();
			
		}
		return "AjaxView";
	}

}

