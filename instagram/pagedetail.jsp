<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="instagram.IMemberbean"%>
<jsp:useBean id="imgr" class="instagram.InstagramMgr"/>


<%
request.setCharacterEncoding("UTF-8");

String email = (String)session.getAttribute("emailKey");
String email2 = request.getParameter("email2");
if(email==null) //로그인이 안된 상태
	response.sendRedirect("login.jsp");
	


	
	IMemberbean ibean = new IMemberbean();
	ibean = imgr.getUser(email);
	
	
	






%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Instagram짜가리</title>
	<%@include file="top.jsp"%>

	</head>

<style>

body{
 background: -webkit-linear-gradient(left, #F6F6F6, #F6F6F6);
}
.contact-form{
    background: #fff;
    margin-top: 10%;
    margin-bottom: 5%;
    width: 70%;
}
.contact-form .form-control{
    border-radius:1rem;
}
.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    
}
.contact-form form{
    padding: 14%;
}
.contact-form form .row{
    margin-bottom: -7%;
}
.contact-form h3{
    margin-bottom: 8%;
    margin-top: -10%;
    text-align: center;
    color: #0062cc;
}
.contact-form .btnContact {
    width: 50%;
    border: none;
    border-radius: 1rem;
    padding: 1.5%;
    background: #dc3545;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
}
.btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
}


</style>


<script type="text/javascript">
function send() {
	document.MemberFrm.submit();
}

</script>

<body>


   


<div class="container contact-form">
            <div class="contact-image">
              <img src="img/<%=ibean.getProfile()%>"> 
            </div>
            		<div class="container">
            		<div class="row">
  					<div class="col-md-1"><p>팔로우</p><input type="text"  class="form-control" placeholder="Your Name *" value="3420" name="follow" readonly="readonly"/></div>
  					<div class="col-md-1"><p>팔로워</p><input type="text"  class="form-control" placeholder="Your Name *" value="200" name="following" readonly="readonly"/></div>
  					
  					
  					<div class="col-md-1">
  					<%if(email!=email2) { %>
  					<%if(email==null && email=="") {
  						
  					%>
  					<a href="login.jsp">
  					<%} else { %>
  					
  					<a href="pagedetailProc.jsp?email=<%=email%>&email2=<%=email2%>&flag=not"><input type="button" class="btn btn-primary next-step" value="팔로우" onclick=""></a></div>
  					<%}//else%>
  					<%}//if 첫번째%>
  					
 
                   
                   </div>
            		</div>
            
           <form role="form" method="post" name="MemberFrm" action="MemberUpdate" enctype="multipart/form-data">
                            	<input type="hidden" name="email" value="<%=email%>">
                            	<input type="hidden" name="email" value="<%=email2%>">
                	
                

                 
               <div class="row">
                    <div class="col-md-4">
                    <label for="exampleInputEmail1">이름</label>
                        <div class="form-group">
                            <input type="text"  class="form-control" placeholder="Your Name *" value="<%=ibean.getName()%>" name="name"/>
                        </div>
                        	<label for="exampleInputEmail1">사용자 이름</label>
                        <div class="form-group">
                            <input type="text"  class="form-control" placeholder="Your Email *" value="<%=ibean.getNickname()%>" name="nickname"/>
                        </div>
                
                     
        
             
                   </div> <!--  col-md-6 -->
                   
   
 
                   
                   
                   
                    <div class="col-md-6">
                        
                        
                       <label for="exampleInputEmail1">핸드폰</label><%if(ibean.getPhone()!=null){%>
                        <div class="form-group">
                       <input type="phone" class="form-control" name="phone"  value="<%=ibean.getPhone()%>" placeholder="01012345678">
                        <%} else { %>
                         <input type="phone" class="form-control" name="phone"   placeholder="전화번호를 입력해주세요...">
                        <%} %>
                        </div>
                        
                        
                        
                           <div class="form-group">
                            <input type="text"  class="form-control" placeholder="Your Phone Number *" value="<%=ibean.getPassword()%>"  name="password"/>
                        </div>
                            <div class="form-group">
                            <input type="button" class="btn btn-primary next-step" value="제출" onclick="send()">
                        </div>
                    </div>
                </div>
            </form>
</div>
</div>
  
	
         
             

</body>
</html>