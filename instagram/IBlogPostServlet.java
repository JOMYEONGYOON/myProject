package instagram;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IBlogPostServlet
 */
@WebServlet("/instagram/iBlogPost")
public class IBlogPostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		InstagramMgr imgr = new InstagramMgr();
		imgr.insertIBlog(request);
		response.sendRedirect("main.jsp");
		
	}

}
