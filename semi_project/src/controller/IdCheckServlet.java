package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SerializeServlet
 */
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private HashMap<String,String> idMap=new HashMap<String,String>();
    public void init(){
    	idMap.put("java", "정우성");
    	idMap.put("jquery", "이솜");
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String command=request.getParameter("command");
		if(command.equals("idcheck")){
			String id=request.getParameter("id");
			if(idMap.get(id)==null){
				out.print("ok"); //사용가능
			}else{
				out.print("fail");// 사용불가
			}		
		}	
		out.close();
	}
}
















