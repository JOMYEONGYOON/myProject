

<%@page import="instagram.IMemberbean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="gmgr" class="instagram.InstagramMgr"/>



<%
	request.setCharacterEncoding("UTF-8");
 String email1 = (String)session.getAttribute("emailKey");



 
 
		  IMemberbean mbean1 = new IMemberbean();
		  IMemberbean mbean2 = new IMemberbean();
		
		  mbean1 = gmgr.getNickname(email1);
		  mbean2 = gmgr.getUser(email1);
		  
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>PhotoBlog</title>


<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>




</head>

 <style>
.box {

    width: 36px;
    height: 36px;
    border-radius: 70%;
    overflow: hidden;
}

.nav-item{
float : left;
margin-top: 15px;

}
 
 </style>
  
  <!-- Image and text -->
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-right">
  <a class="navbar-brand" href="main.jsp">
    <img src="/docs/4.5/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
<%--     <img  align="bottom" class="profile" src="img/<%=mbean.getProfile()%>"  --%>
  <%=mbean1.getNickname()%>
 
  </a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
     
        <a class="nav-link" href="#" onclick="location='logout.jsp'">로그아웃<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="post.jsp">내 글 게시하기</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          
        	<img src="img/<%=mbean2.getProfile()%>" class="box" />
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">메세지</a>
          <a class="dropdown-item" href="updatepage.jsp">내 정보 변경</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="mypage.jsp">마이페이지</a>
        </div>
      </li>
   
    </ul>
  </div>
</nav>