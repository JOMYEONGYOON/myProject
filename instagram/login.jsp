
<%@ page contentType="text/html;charset=UTF-8"%>
<%
		String msg = (String)session.getAttribute("msg");

// int isMobile = 0;

// String agent = request.getHeader("USER-AGENT");

// String[] mobileos = {"iPhone X","Galaxy S5","Pixel 2","IPhone 5/SE","IPhone 6/7/8","IPhone 6/7/8 Plus","Webos","Opera Mini","SonyEricsson","Opera Mobi","IEMobile"};

// int j = -1;

// for(int i=0 ; i<mobileos.length ; i++) {

// 	j=agent.indexOf(mobileos[i]);

// 	if(j > -1 )

// 	{


// 	isMobile = 1;

// 	break;

// 	}

// }

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
<style>.yOZjD {
    -webkit-align-self: center;
    -ms-flex-item-align: center;
    align-self: center;
    background-image: url(/static/images/homepage/home-phones.png/43cc71bb1b43.png);
    background-position: 0 0;
    background-size: 454px 618px;
    -webkit-flex-basis: 454px;
    -ms-flex-preferred-size: 454px;
    flex-basis: 454px;
    height: 400px;
    margin-left: -55px;
    margin-right: -15px;

}
.V64Sp {
    margin: 99px 0 0 151px;
    position: relative;
}
</style>


<body>


    <div class="container">
        <div class="row">
<%--         <%if(isMobile==0) { %>  --%>
        
        <div class="yOZjD _80tAB">
<div class="V64Sp">
<img class="RP4i1" src="img/login.png" alt="" width="200px" height="200px">
</div>
</div>

<%-- <%} %> --%>
<%-- <%if(isMobile==1) { %>  --%>
		
		
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1 id="h1style">SnSKing</h1>
						 </div>
					</div>
                   <form action="ilogin" method="post" name="ifrm">
                           <div class="form-group">
                              <label for="exampleInputEmail1">이메일 주소</label>
                              <input type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="이메일을 입력하세요.">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">패스워드</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="비밀번호을 입력하세요." >
                           </div>
                     
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm" onclick="login()">로그인</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">또는</span>
                              </div>
                           </div>
                          
                           <div class="form-group">
                              <p class="text-center">계정이 없으세요? <a href="ijoin.jsp" id="signup">회원가입</a></p>
                           </div>
                        </form>
                 
				</div>
			</div>
<%-- 			<%} %> --%>
			  <div id="second">
			      <div class="myform form ">
                        <div class="logo mb-3">
                           <div class="col-md-12 text-center">
                              <h1 >회원가입</h1>
                           </div>
                        </div>
                        <form action="#" name="registration">
                           <div class="form-group">
                              <label for="exampleInputEmail1">이름</label>
                              <input type="text"  name="name" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="이름을 입력하세요.">
                           </div>
                   			
                   			     <div class="form-group">
                              <label for="exampleInputEmail1">사용자이름</label>
                              <input type="text"  name="nickname" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="이름을 입력하세요.">
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
                                 <p class="text-center"><a href="#" id="signin">이미 가입 되어 있으세요?</a></p>
                              </div>
                           </div>
                            </div>
                        </form>
                     </div>
			</div>
		</div>
      </div>   
         	<%if(msg!=null){%>
		<div align="center"><font color="red"><%=msg%></font></div>
	<%}%>
	<%@include file="footer.jsp"%>
</body>
	

<script>
$("#signup").click(function() {
	$("#first").fadeOut("fast", 
			function() {
	$("#ijoin.jsp").fadeIn("fast");
	});
	});

	$("#signin").click(function() {
	$("#second").fadeOut("fast", function() {
	$("#first").fadeIn("fast");
	});
	});


	  
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
	      firstname: "required",
	      lastname: "required",
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
	      firstname: "이름을 입력하세요.",
	      lastname: "이름을 입력하세요.",
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