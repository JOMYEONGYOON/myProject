package instagram;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement.ParseInfo;

/**
 * Servlet implementation class InstagramLikeServlet
 */
@WebServlet("/instagram/UpHCnt")
public class InstagramLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		InstagramMgr imgr = new InstagramMgr();
		int num = Integer.parseInt(request.getParameter("num"));
		imgr.upLike(num);
		String gemail = request.getParameter("gemail");
		if(gemail==null)
			response.sendRedirect("main.jsp");
		else
			response.sendRedirect("guestlist.jsp?gemail="+gemail);
		
		
	}

}
