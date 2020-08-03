package instagram;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IReplyPostServlet
 */
@WebServlet("/instagram/iReplyPost")
public class IReplyPostServlet extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		IreplyMgr rmgr = new IreplyMgr();
		ReplyBean rbean = new ReplyBean();
		rbean.setNum(Integer.parseInt(request.getParameter("num")));
		rbean.setEmail(request.getParameter("email"));
		rbean.setComment(request.getParameter("comment"));
		rbean.setNickname(request.getParameter("nickname"));
		
		rmgr.insertReply(rbean);
		
		String gemail = request.getParameter("gemail");
		if(gemail==null)
			response.sendRedirect("main.jsp");
		else
			response.sendRedirect("guestlist.jsp?gemail="+gemail);
		
	}

}
