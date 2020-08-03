
<%@ page contentType="text/html;charset=UTF-8"%>
<%
		String msg = (String)session.getAttribute("msg");
%>


<html>
<head>
<title>Simple FACETAGRAM</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/></head>
<style>

        body{
        padding-top:4.2rem;
		padding-bottom:4.2rem;
		background:rgba(0, 0, 0, 0.76);
        }
        a{
         text-decoration:none !important;
         }
         h1,h2,h3{
         font-family: sans-serif;
         }
         #h1style{
        
         font-family: cursive;
         }
          .myform{
		position: relative;
		display: -ms-flexbox;
		display: flex;
		padding: 1rem;
		-ms-flex-direction: column;
		flex-direction: column;
		width: 100%;
		pointer-events: auto;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid rgba(0,0,0,.2);
		border-radius: 1.1rem;
		outline: 0;
		max-width: 500px;
		 }
         .tx-tfm{
         text-transform:uppercase;
         }
         .mybtn{
         border-radius:50px;
         }
        
         .login-or {
         position: relative;
         color: #aaa;
         margin-top: 10px;
         margin-bottom: 10px;
         padding-top: 10px;
         padding-bottom: 10px;
         }
         .span-or {
         display: block;
         position: absolute;
         left: 50%;
         top: -2px;
         margin-left: -25px;
         background-color: #fff;
         width: 50px;
         text-align: center;
         }
         .hr-or {
         height: 1px;
         margin-top: 0px !important;
         margin-bottom: 0px !important;
         }
         .google {
         color:#666;
         width:100%;
         height:40px;
         text-align:center;
         outline:none;
         border: 1px solid lightgrey;
         }
          form .error {
         color: #ff0000;
         }
         #second{display:none;}

</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
      <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script>
function login() {
	document.ifrm.submit();
}

</script>
<body>
    <div class="container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1 id="h1style">SnSKing</h1>
						 </div>
						 <div class="myform form ">
                        <div class="logo mb-3">
                           <div class="col-md-12 text-center">
                              <h1 >Sign-UP</h1>
                           </div>
                        </div>
                        <form action="ijoinproc.jsp" name="registration" method="post">
                           <div class="form-group">
                              <label for="exampleInputEmail1">이름</label>
                              <input type="text"  name="name" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="이름을 입력하세요.">
                           </div>
                   			
                   			     <div class="form-group">
                              <label for="exampleInputEmail1">사용자이름</label>
<!--                                 <input type="button" class="btn btn-block mybtn btn-primary tx-tfm" style="width:90px;" value="ID체크" onClick="idCheck()"/> -->
                              <input type="text"  name="nickname" class="form-control" id="nickname" aria-describedby="emailHelp" placeholder="이름을 입력하세요.">
                           </div>
                           
                           
                   			
                           <div class="form-group">
                              <label for="exampleInputEmail1">이메일</label>
                              <input type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="이메일을 입력하세요.">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="비밀번호을 입력하세요.">
                           </div>
                           <div class="col-md-12 text-center mb-3">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">회원가입</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="form-group">
                                 <p class="text-center"><a href="login.jsp" id="signin">이미 가입 되어 있으세요?</a></p>
                              </div>
                           </div>
                            </div>
                        </form>
					</div>
         
                 
				</div>
			</div>
			  <div id="second">
			      
                     </div>
			</div>
		</div>
      </div>   
         	<%if(msg!=null){%>
		<div align="center"><font color="red"><%=msg%></font></div>
	<%}%>
</body>


<script>
// $("#signup").click(function() {
// 	$("#first").fadeOut("fast", 
// 			function() {
// 	$("#second").fadeIn("fast");
// 	});
// 	});

// 	$("#signin").click(function() {
// 	$("#second").fadeOut("fast", function() {
// 	$("#first").fadeIn("fast");
// 	});
// 	});


	  
	         $(function() {
	           $("form[name='login']").validate({
	             rules: {
	               
	               email: {
	                 required: true,
	                 email: true
	               },
	               password: {
	                 required: true,
	                 
	               }
	             },
	              messages: {
	               email: "유효한 이메일 주소를 입력해주세요",
	              
	               password: {
	                 required: "패스워드를 입력해주세요",
	                
	               }
	               
	             },
	             submitHandler: function(form) {
	               form.submit();
	             }
	           });
	         });
	         


	$(function() {
	  
	  $("form[name='registration']").validate({
	    rules: {
	    	nickname: "required",
	    	name: "required",
	      email: {
	        required: true,
	        email: true
	      },
	      password: {
	        required: true,
	        minlength: 5
	      }
	    },
	    
	    messages: {
	    
	      name: "이름을 입력하세요.",
	      nickname: "사용자이름 을 입력하세요.",
	      password: {
	        required: "패스워드를 입력해주세요.",
	        minlength: "패스워드를 5자리 이상 만들어주세요."
	      },
	  	
	      email: "유효한 이메일 주소를 입력해주세요"
	    },
	  
	    submitHandler: function(form) {
	      form.submit();
	    }
	  });
	});


</script>