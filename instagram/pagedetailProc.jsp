<%@page import="bean.TeacherBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="imgr" class="instagram.InstagramMgr"/>

<%
request.setCharacterEncoding("UTF-8");

String email = (String)session.getAttribute("emailKey");
String gemail = request.getParameter("gemail");
if(email==null) //로그인이 안된 상태
response.sendRedirect("login.jsp");

boolean flag=false;

boolean A =  imgr.isfollowed(email,gemail);
if(A){
	%>
	<script type="text/javascript">
		alert("이미 팔로우 한상태입니다.");
		location.href="guest.jsp?email=<%=email%>&gemail=<%=gemail %>";
	</script>


	<%
}

	


	
else{imgr.following(email, gemail);
	%>
	<script type="text/javascript">
		alert("팔로우 되었습니다.");
		location.href="guest.jsp?email=<%=email%>&gemail=<%=gemail %>";
	</script>
	<%
}
%>



