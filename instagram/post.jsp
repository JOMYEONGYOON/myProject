<%@page import="instagram.IMemberbean"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="imgr" class="instagram.InstagramMgr"></jsp:useBean>
<%
	String email = (String) session.getAttribute("emailKey");
	String nickname = request.getParameter("nickname");
	if (email == null)
		response.sendRedirect("login.jsp");
	
	IMemberbean mbean = imgr.getImember(email);
	IMemberbean bean = new IMemberbean();
	IMemberbean bean1 = new IMemberbean();
	bean = imgr.getUser(email);
	bean1 = imgr.getNickname(email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<head>
    <meta charset="UTF-8">
    <title>Post</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
    
</head>

<script type="text/javascript">

function send() {
	document.frm.submit();
}
function goURL(url) {
	document.frm1.action = url;
	document.frm1.submit();
}
</script>



<style>

/* Copy this code in your css file. */

html,body
{
    
         max-width: 500px;
    margin: auto;
}
.container
{
    
 
  margin: auto;
  background-color: #fff;
  border: 1px solid #dddfe2;
  border-radius: 3px;
  margin-bottom: 10px;
}
img {
    width: 300px;
    height: 200px;
    align-items: center;
    margin-left: 20px;
}
.preview
{
    padding: 10px;
    position: relative;
}

.preview i
{
    color: white;
    font-size: 35px;
    transform: translate(50px,130px);
}

.preview-img
{
    border-radius: 100%;
    box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.7);
}

.browse-button
{
	
    width: 250px;
    height: 200px;
/*     border-radius: 100%; */
    position : absolute; /* Tweak the position property if the element seems to be unfit */
    top: 10px;
 	left: 20%;
    background: linear-gradient(180deg, transparent, black);
    opacity: 0;
    transition: 0.3s ease;
}

.browse-button:hover
{
     opacity: 1; 
}

.browse-input
{
    width: 50%;
    height: 200px;
    border-radius: 100%;
    transform: translate(-1px,-26px);
    opacity: 0;
}

.form-group
{
    width:  250px;
    margin: 10px auto;
}
.form-msg{
	
	margin-top: 150px;
}

.form-group input
{
    transition: 0.3s linear;
}

.form-group input:focus
{
    border: 1px solid crimson;
    box-shadow: 0 0 0 0;
}

.Error
{
    color: crimson;
    font-size: 13px;
}

.Back
{
    font-size: 25px;
}


  .image_outer_container{
       	margin-top: auto;
       	margin-bottom: auto;
       	border-radius: 50%;
       	position: relative;
       }

       .image_inner_container{
       	border-radius: 50%;
       	padding: 5px;
        background: #833ab4; 
        background: -webkit-linear-gradient(to bottom, #fcb045, #fd1d1d, #833ab4); 
        background: linear-gradient(to bottom, #fcb045, #fd1d1d, #833ab4);
       }
       .image_inner_container img{
       	height: 200px;
       	width: 200px;
       	border-radius: 50%;
       	border: 5px solid white;
       }

       .image_outer_container .green_icon{
         background-color: #4cd137;
         position: absolute;
         right: 30px;
         bottom: 10px;
         height: 30px;
         width: 30px;
         border:5px solid white;
         border-radius: 50%;
       }
	#image_container{
	
	text-align: center;
	
	
	}
</style>

<body>
    <div class="container">
       <div class="Back">
            <i class="fa fa-arrow-left" onclick="Back()"></i>
        </div>
        <p class="h2 text-center">Post</p>
        <form method="post" name="frm" action="iBlogPost"
				enctype="multipart/form-data" >
            <div class="preview text-center">
				<p>이미지를 업로드 해주세요</p>
                <div class="browse-button">
                    <i class="fa fa-pencil-alt"></i>
                    <input type="file" class="browse-input" id="UploadedFile" name="photo"accept="image/*" onchange="setThumbnail(event);"   width="100px" height="100px"/> 
                </div>
                <span class="Error"></span>
            </div>
            
               
    <div id="image_container"></div>
     <script> 
     function setThumbnail(event) {
    	 for (var image of event.target.files) { 
    		 var reader = new FileReader();
    		 reader.onload = function(event) {
 			 var img = document.createElement("img");
 			 img.setAttribute("src", event.target.result); 
 			 document.querySelector("div#image_container").appendChild(img); };
 			 console.log(image); reader.readAsDataURL(image); } } 
     </script>
            
           
           
            <div class="form-msg">
                <label>메세지</label>
 <textarea rows="10" cols="10" class="form-control" required placeholder="Message를 등록해주세요" name="message"></textarea>
                <span class="Error"></span>
            </div>
<!--           <div class="form-group"> -->
<!--              <label>닉네임</label> -->
<%--            <input type="text" name="nickname" value="<%=bean1.getNickname()%>" readonly>   --%>
<%--              <input type="text" class="input" value="<%=bean.getUserName()%>" readonly> --%>
<!--              </div> -->
     
            <div class="form-group">
                <input type="hidden" value="<%=email%>" name="email"> 
                <input type="hidden" value="<%=bean1.getNickname()%>" name="nickname"> 
                <input type="button" class="btn btn-primary btn-block" value="업로드" onclick="send()"/>
            </div>
        </form>
    </div>
    


    
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>

<script type="text/javascript">


function Back()
{
    window.history.back();
}
</script>