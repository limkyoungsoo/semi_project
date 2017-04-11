package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminStoreDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url ="/board/admin_store_delete.jsp";
		
		//실은 삭제되었습니다 라는 메세지만 나오면 된다.
		return url;
	}

}
