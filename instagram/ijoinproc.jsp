<%@ page contentType="text/html; charset=UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="imgr" class="instagram.InstagramMgr"/>
<jsp:useBean id="bean" class="instagram.IMemberbean"/>
<jsp:setProperty property="*" name="bean"/>
<%boolean flag = imgr.insertIMember(bean);%>


<br/><br/>
<div align="center">
<%
if(flag){
	
	 
	  out.println("<b><h1>회원가입을 축하 드립니다.</h1></b><p>");
	  out.println("<a href=login.jsp><h1>로그인</h1></a>");

	}else{
		

	  out.println("<b><h1>다시 입력하여 주십시오.</h1></b><p>");
	  out.println("<a href=ijoin.jsp><h1>다시 가입</h1></a>");
	
	}
%>
</div>
</body>