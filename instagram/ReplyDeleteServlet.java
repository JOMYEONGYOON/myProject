package instagram;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReplyDeleteServlet
 */
@WebServlet("/instagram/ReplyDelete")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		IreplyMgr imgr = new IreplyMgr();
		
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		imgr.deleteReply(rnum);
		
		String gemail = request.getParameter("gemail");
		if(gemail==null)
			response.sendRedirect("main.jsp");
		else 
			response.sendRedirect("guestlist.jsp?gemail="+gemail);
		
		
		
	}

}
