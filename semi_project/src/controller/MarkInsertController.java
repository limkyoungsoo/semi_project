package controller;

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
         StoreDAO.getInstance().insertMenumark(memId, menuNo);
         
      }
      return "/DispatcherServlet?command=markList";
   }

}