<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="instagram.IMemberbean"%>
<jsp:useBean id="imgr" class="instagram.InstagramMgr"/>


<%
request.setCharacterEncoding("UTF-8");

String email = (String)session.getAttribute("emailKey");
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
 background: -webkit-linear-gradient(left, #FFFFFF, #F6F6F6);
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
           <form role="form" method="post" name="MemberFrm" action="MemberUpdate" enctype="multipart/form-data">
                            	<input type="hidden" name="email" value="<%=email%>">
                <h4>프로필 편집</h4>
               <div class="row">
                    <div class="col-md-6">
                    <label for="exampleInputEmail1">이름</label>
                        <div class="form-group">
                            <input type="text"  class="form-control" placeholder="Your Name *" value="<%=ibean.getName()%>" name="name"/>
                        </div>
                        	<label for="exampleInputEmail1">사용자 이름</label>
                        <div class="form-group">
                            <input type="text"  class="form-control" placeholder="Your Email *" value="<%=ibean.getNickname()%>" name="nickname"/>
                        </div>
                     
                      <label for="exampleInputEmail1">프로필 편집</label>
                                      <div class="form-group">
          			
        			<div class="filebox bs3-primary">
                            <input class="upload-name"  disabled="disabled" value="<%=ibean.getProfile()%>" >

                            <label for="ex_filename" >업로드</label> 
                          <input type="file" id="ex_filename" class="upload-hidden" name="profile" > 
           
        			</div>
     
                    </div>
                   </div> <!--  col-md-6 -->
                   
   
   <style>
.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
	margin: 10px;
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: small;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}
/* named upload */
.filebox .upload-name  {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.upload-name1{

    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;

}

.filebox.bs3-primary label {
  color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    
}


</style>

    <script>


    $(document).ready(function(){
  	  var fileTarget = $('.filebox .upload-hidden');

  	    fileTarget.on('change', function(){
  	        if(window.FileReader){
  	            var filename = $(this)[0].files[0].name;
  	        } else {
  	            var filename = $(this).val().split('/').pop().split('\\').pop();
  	        }

  	        $(this).siblings('.upload-name').val(filename);
  	    });
  	});

  $(document).ready(function(){
  	  var fileTarget1 = $('.filebox .upload-hidden1');

  	    fileTarget1.on('change', function(){
  	        if(window.FileReader){
  	            var filename1 = $(this)[0].files[0].name;
  	        } else {
  	            var filename1 = $(this).val().split('/').pop().split('\\').pop();
  	        }

  	        $(this).siblings('.upload-name1').val(filename1);
  	    });
  	});
    
    </script>   
   
   
                   
                   
                   
                    <div class="col-md-6">
                        
                        
                       <label for="exampleInputEmail1">핸드폰</label><%if(ibean.getPhone()!=null){%>
                        <div class="form-group">
                       <input type="phone" class="form-control" name="phone"  value="<%=ibean.getPhone()%>" placeholder="01012345678">
                        <%} else { %>
                         <input type="phone" class="form-control" name="phone"   placeholder="전화번호를 입력해주세요...">
                        <%} %>
                        </div>
                        
                        
                        <label for="exampleInputEmail1">비밀번호 변경</label>
                           <div class="form-group">
                            <input type="password"  class="form-control" placeholder="Your Phone Number *" value="<%=ibean.getPassword()%>"  name="password"/>
                        </div>
                            <div class="form-group">
                            <input type="button" class="btn btn-primary next-step" value="제출" onclick="send()">
                        </div>
                    </div>
                </div>
            </form>
</div>

  
	
         
             

</body>
</html>