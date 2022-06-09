<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách lớp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="<c:url value="/resources/css/productStyle.css" />" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
    <div class = "main-wrapper">
        <div class = "container">
        <nav class="navbar navbar-expand-lg navbar-light .bg-transparent">
  <a class="navbar-brand" href="#">
	<img src="<c:url value="/resources/image/Logo3.jpg" />" alt="logo" width="50px" height="50px" class = "d-inline-block align-top"/>
	</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/tutor/indexForTutor.html">Trang chủ <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item"> 
         <a class="nav-link" href="${pageContext.request.contextPath}/tutor/tutorProfile.html">Thông tin cá nhân</a> 
       </li> 
         <li class="nav-item"> 
         <a class="nav-link" href="#">Liên hệ</a> 
       </li> 
       </li> 
         <li class="nav-item"> 
         <a class="nav-link" href="${pageContext.request.contextPath}/tutor/login.html">Đăng xuất</a> 
       </li> 
     
     
    </ul>
    
  </div>
</nav>
        
            <div class = "main-title">
                <h1>Danh sách lớp học</h1>
            </div>
            <div class = "display-style-btns">
                <button type = "button" id = "grid-active-btn">
                    <i class = "fas fa-th"></i>
                </button>
                <button type = "button" id = "details-active-btn">
                    <i class = "fas fa-list-ul"></i>
                </button>
            </div>

            <div class = "item-list">
            
     			<c:forEach var="post" items="${posts}">
     			
           				<div class="item">
           					<div class="item-img" style="padding-top: 40px; font-size:20px">
           					<div class= "post" style="margin: auto; text-align:left; padding-left:150px; padding-top: 10px;"> Mã lớp: ${post.getPostId()}</div>
           						<div class= "post" style="margin: auto; text-align:left; padding-left:100px; padding-top: 10px;">Môn học: ${post.getSubjectName()}, lớp: ${post.getSubjectLevel() }</div>
           						<div class= "post" style="margin: auto; text-align:left; padding-left:100px; padding-top: 10px;">Thời gian: ${post.getNumOfLesson() }/tuần, mỗi buổi 90p</div>
           						<div class= "post" style="margin: auto; text-align:left; padding-left:100px; padding-top: 10px;">Học phí: ${post.getFee() }đ</div>
           						<div class= "post" style="margin: auto; text-align:left; padding-left:100px; padding-top: 10px;">Khu vực: ${post.getAddress() }</div>
           						<div class= "post" style="margin: auto; text-align:left; padding-left:100px; padding-top: 10px;">Mức phí: 25%</div>
<%--            						<div class= "post" style="margin: auto; text-align:left; padding-left:100px; padding-top: 10px;">${$post.getPostId()==check?appSuccess:""}</div> --%>
           						
           					</div>
           					<div class = "item-detail">
                        		<a  href = "tutor/applied/${post.getPostId()}.html" class = "item-name"> ${post.getCheckApply() ==1 ? "Đã ứng tuyển thành công vui lòng kiểm tra email":"Ứng tuyển ngay"} </a>
        
                        <p>${post.getDescription()}</p>
                        <button type = "button" class = "add-btn">Ứng tuyển</button>
                    </div>
           				</div>
           		
           		</c:forEach>
           		
         
            </div>
        </div>
    </div>



    <script src = "<c:url value="/resources/javascript/script.js" />"></script>
  
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>