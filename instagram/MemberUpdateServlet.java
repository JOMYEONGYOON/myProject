package instagram;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/instagram/MemberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		IMemberbean ibean = (IMemberbean) session.getAttribute("ibean");
		MultipartRequest multi = new MultipartRequest(request,InstagramMgr.SAVEFOLDER,InstagramMgr.MAXSIZE,InstagramMgr.ENCTYPE, new DefaultFileRenamePolicy());
		InstagramMgr imgr = new InstagramMgr();
		String email = multi.getParameter("email");
		imgr.memberUpdate(multi);
		System.out.println("servlet은 옴");

//		
		PrintWriter out=response.getWriter();
		out.println("<script>");
	
		out.println("location.href='updatepage.jsp'");
		out.println("</script>");
	
//		
		
//		
//		if(result) {
//			
			
//			
//		} else {
//			PrintWriter out=response.getWriter();
//			out.println("<script>");
//			out.println("alert('회원 수정 실패');");
//			out.println("location.href='mypage.jsp'");
//			out.println("</script>");
//			
//		}

		
		
	}

}
