package instagram;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IJoinServlet
 */
@WebServlet("/instagram/ijoin")
public class IJoinServlet extends HttpServlet {
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		InstagramMgr imgr = new InstagramMgr();
		IMemberbean bean = new IMemberbean();
		boolean flag = imgr.insertIMember(bean);
		PrintWriter out=response.getWriter();
		if(flag){
			  out.println("<b>ȸ�������� ���� �帳�ϴ�.</b><p>");
			  out.println("<a href=login.jsp>�α���</a>");
			}else{
			  out.println("<b>�ٽ� �Է��Ͽ� �ֽʽÿ�.</b><p>");
			  out.println("<a href=ijoin.jsp>�ٽ� ����</a>");
			}
		
		
		
	}

}
