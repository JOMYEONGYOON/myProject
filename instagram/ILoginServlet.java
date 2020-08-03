package instagram;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ILoginServlet
 */
@WebServlet("/instagram/ilogin")
public class ILoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		InstagramMgr Imgr = new InstagramMgr();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String url = "login.jsp";
		if(Imgr.loginIMember(email, password)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("emailKey", email);
			session.setAttribute("nickKey", nickname);
			url = "main.jsp";
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("msg", "이메일 또는 비밀번호가 일치하지 않습니다.");
		}
		
		response.sendRedirect(url);
		
	}

}
