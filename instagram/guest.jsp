<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="instagram.ReplyBean"%>
<%@page import="instagram.IMemberbean"%>
<%@page import="instagram.IBlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="imgr" class="instagram.InstagramMgr"/>
<jsp:useBean id="rmgr" class="instagram.IreplyMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
String email = (String)session.getAttribute("emailKey");
String gemail = request.getParameter("gemail");


// if(email==null) {//로그인이 안된 상태
// 	response.sendRedirect("login.jsp");
// 	return;
// }
// if(gemail==null) {
	
// 	response.sendRedirect("main.jsp");
// 	return;
	
// }
	Vector<IMemberbean> mvlist = imgr.listIMember(email);
		IMemberbean mbean = imgr.getImember(email);
		IMemberbean mgbean = imgr.getUser(gemail);
		Vector<IBlogBean> pvlist = imgr.listI(gemail);
		
		IMemberbean bean1 = new IMemberbean();

		bean1 = imgr.getNickname(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Instagram짜가리</title>
	<%@include file="top.jsp"%>

	</head>
	
	
	<script>	
	
	function goURL(url, gemail) {
		document.frm1.action=url;
		document.frm1.gemail.value=gemail;
		document.frm1.submit();
	}
	
	function heart(num) {
		document.frm.action = "UpHCnt";
		document.frm.num.value=num;
		document.frm.gemail.value="<%=gemail%>";
		document.frm.submit();
	}
	
	function cmtPost(num) {
		document.frm.action = "iReplyPost";
		cmt = document.getElementById("comment"+num);
		document.frm.comment.value=cmt.value;
		document.frm.num.value=num;
		document.frm.email.value="<%=email%>";
		document.frm.gemail.value="<%=gemail%>";
		document.frm.nickname.value="<%=bean1.getNickname()%>";
		document.frm.submit();
	}
	function rDel(rnum) {
		document.frm.action = "ReplyDelete";
		document.frm.rnum.value=rnum;
		document.frm.gemail.value="<%=gemail%>";
		document.frm.submit();
	}
	
	
	
	</script>
	
	
	<style>





body {
  background-color: #e9ebee;
  font-family: 'Roboto', sans-serif;
}
.img-responsive {
  width: 100%;
  height: 50%;
  margin: auto;
}
.user-information{

margin: 10px;



}
.fb-cards-designs {
  margin-top: 16px;
}
.user-thumb {
  width: 100%;
  height: 50%;
  border-radius: 50%;
  overflow: hidden;
  float: left;
  margin-right: 8px;
}
.fb-clone-card {
  max-width: 500px;
  margin: auto;
  background-color: #fff;
  
  border-radius: 3px;
  margin-bottom: 10px;
}
.fb-clone-card .fb-card-main-content {
  padding: 12px;
  padding-bottom: 0;
}
.fb-clone-card .fb-card-main-content .fb-card-header {
  position: relative;
}
.fb-clone-card .fb-card-main-content .fb-card-header .user-post-info {
  overflow: hidden;
}
.fb-clone-card .fb-card-main-content .fb-card-header .user-post-info .user-information {
  float: left;
  line-height: 1.34;
}
.fb-clone-card .fb-card-main-content .fb-card-header .user-post-info .user-information p {
  color: #385898;
  cursor: pointer;
  text-decoration: none;
  font-size: 14px;
  line-height: 1.38;
  font-weight: 600;
  margin: 0;
}
.fb-clone-card .fb-card-main-content .fb-card-header .user-post-info .user-information small {
  color: #616770;
  font-size: 12px;
}
.fb-clone-card .fb-card-main-content .fb-card-header .post-action {
  position: absolute;
  top: 0;
  right: 0;
  cursor: pointer;
}
.fb-clone-card .fb-card-main-content .fb-card-header .post-action i {
  color: #606771;
}
.fb-clone-card .fb-card-main-content .fb-card-header .post-action:hover i {
  color: #1d2129;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-text-card {
  margin-top: 6px;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.38;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-text-card p {
  margin: 0;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-card {
  padding-bottom: 0;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-card .images-container {
  margin-top: 12px;
  margin-left: -12px;
  margin-right: -12px;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-post {
  padding-bottom: 0;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-post a {
  display: block;
  text-decoration: none;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-post a:hover {
  opacity: 0.8;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-post .sponsord-post-title-links {
  background-color: #e9ebee;
  padding: 12px 10px;
  border-bottom: 1px solid #dddfe3;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-post .sponsord-post-title-links small {
  color: #5f676f;
  text-transform: uppercase;
  font-size: 12px;
}
.fb-clone-card .fb-card-main-content .fb-card-body.simple-image-post .sponsord-post-title-links h5 {
  color: #1e2229;
  margin: 0;
}
.fb-clone-card .fb-card-actions-holder {
  display: flex;
  margin: 0 12px;
  min-height: 32px;
  padding: 4px 0;
}
.fb-clone-card .fb-card-actions-holder .fb-card-actions {
  display: flex;
  flex-direction: row;
  flex-grow: 1;
  order: 1;
}
.fb-clone-card .fb-card-actions-holder .fb-card-actions .fb-btn-holder {
  align-items: center;
  display: flex;
  flex: 1 0 0px;
  justify-content: center;
}
.fb-clone-card .fb-card-actions-holder .fb-card-actions .fb-btn-holder a {
  width: 100%;
  align-items: center;
  color: #606770;
  display: flex;
  flex: 1 0;
  font-weight: 600;
  height: 32px;
  justify-content: center;
  line-height: 14px;
  padding: 0 2px;
  position: relative;
  text-decoration: none;
  transition: 400ms cubic-bezier(0.08, 0.52, 0.52, 1) transform;
  font-size: 13px;
  border-radius: 3px;
}
.fb-clone-card .fb-card-actions-holder .fb-card-actions .fb-btn-holder a i {
  font-size: 18px;
  margin-right: 6px;
}
.fb-clone-card .fb-card-actions-holder .fb-card-actions .fb-btn-holder a:hover {
  background-color: #f2f2f2;
}
.fb-clone-card .fb-card-comments {
  border-top: 1px solid #dadde1;
}
.fb-clone-card .fb-card-comments .comment-input-holder {
  padding: 8px;
}
.fb-clone-card .fb-card-comments .comment-input-holder .user-thumb {
  width: 32px;
  height: 32px;
}
.fb-clone-card .fb-card-comments .comment-input-holder .comment-input {
  background-color: #f2f3f5;
  border: 1px solid #ccd0d5;
  border-radius: 16px;
  display: flex;
  justify-content: flex-end;
}
.fb-clone-card .fb-card-comments .comment-input-holder .comment-input .comment-box {
  font-size: 13px;
  cursor: text;
  flex: 1 1 auto;
  line-height: 16px;
  overflow: hidden;
  padding: 8px 12px;
  outline: none;
  user-select: text;
  white-space: pre-wrap;
  overflow-wrap: break-word;
}
.fb-clone-card .fb-card-comments .comment-input-holder .comment-input .comment-box[placeholder]:empty:before {
  content: attr(placeholder);
  color: #555;
}
.fb-clone-card .fb-card-like-comment-holder {
  align-items: center;
  border-bottom: 1px solid #dadde1;
  color: #606770;
  display: flex;
  line-height: 20px;
  margin: 10px 12px 0 12px;
  padding: 0 0 10px 0;
}
.fb-clone-card .fb-card-like-comment-holder .fb-card-like-comment {
  display: flex;
  flex: auto;
  justify-content: space-between;
}
.fb-clone-card .fb-card-like-comment-holder .fb-card-like-comment .like-comment-holder span {
  cursor: pointer;
  display: inline-block;
  text-decoration: none;
  white-space: nowrap;
  font-size: 13px;
}
.fb-clone-card .fb-card-like-comment-holder .fb-card-like-comment .like-comment-holder span:last-child {
  margin-left: 7px;
}
.fb-clone-card .fb-card-like-comment-holder .fb-card-like-comment .likes-emoji-holder span {
  cursor: pointer;
  display: inline-block;
  text-decoration: none;
  white-space: nowrap;
  font-size: 13px;
}
.flexdiv{
display: block;

}


.box1 {
	width: 56px;
	height: 56px;
	border-radius: 30%;
	overflow: hidden;
}
.profile1 {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.randomtable{
	    max-width: 500px;
    margin: auto;
    background-color: #fff;

    border-radius: 3px;
    margin-bottom: 10px;
}

.randomfont{

	font-size: small;

}


</style>
	
	


<!------ Include the above in your HEAD tag ---------->
<body>
	
	
	
			<div class="fb-cards-designs">
		
		<div data-role="content">
	<!-- 랜덤한 5명의 리스트 Start-->
	<table class="randomtable">
		<tr>
	<% 	for(int k=0;k<mvlist.size();k++){
			IMemberbean mvbean = mvlist.get(k);
		
	%>

		<td width="80">
				<div class="box1" style="background: #BDBDBD;">
					<a href="javascript:goURL('guest.jsp','<%=mvbean.getEmail()%>')">
					<img class="profile1" src="img/<%=mvbean.getProfile()%>"
						width="30" height="30"></a>
				</div>
				<div class="randomfont"><%=mvbean.getNickname()%></div>
			</td>
		<%}//for%>
</tr>
</table>
	
	
	
	         		 <%
	         		
               
                int count = imgr.getfollowed(gemail);
                int count1 = imgr.getfollow(gemail);
         		
                
                %>
	
	
	
	
	<table>

		
	 <div class="fb-clone-card">
	 <div class="fb-card-main-content">
		

                <div class="fb-card-header">
                    <div class="user-post-info">
                        <div class="user-thumb">
                            <img src="img/<%=mgbean.getProfile()%>" class="img-responsive" />
                        </div>
                        <div class="user-information">
           <div class="user-information">          <p class="pclass"><%=mgbean.getNickname()%></p></div>
			 <div class="user-information">		<p class="pclass">팔로우 <%=count1%></p></div>
  				 <div class="user-information">	<p class="pclass">팔로워 <%=count%></p></div>
                			<%if(email!=gemail) { %>
  					<%if(email==null && email=="") {
  						
  					%>
  					<a href="login.jsp">
  					<%} else { %>
  					 <div class="user-information">
  					<a href="pagedetailProc.jsp?email=<%=email%>&gemail=<%=gemail%>&flag=not"><input type="button" class="btn btn-primary next-step" value="팔로우" onclick=""></a>
  					<a href="guestlist.jsp?email=<%=email%>&gemail=<%=gemail%>&flag=not"><input type="button" class="btn btn-primary next-step" value="게시물 보기" onclick=""></a>
  					</div>
  					<%}//else%>
  					<%}//if 첫번째%>
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>	
          </div>

  
    
  

		
		
	
		
		
		
	
		

	</table>

	<form method="post" name="frm">
		<input type="hidden" name="num">
		<input type="hidden" name="comment">
		<input type="hidden" name="rnum">
		<input type="hidden" name="email">
		<input type="hidden" name="nickname">
		<input type="hidden" name="gemail">
	</form>

	<form method="post" name="frm1" action="main.jsp">
		<input type="hidden" name="gemail">
	</form>



	
	

</body>
	<%@include file="footer.jsp"%>
