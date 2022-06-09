<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<!---<title> Responsive Registration Form | CodingLab </title>--->

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sign up</title>
<link href="<c:url value="/resources/css/signupPageStyle.css" />"
	rel="stylesheet">

</head>
<body>

	<div class="container">
		<div class="title" style="font-family:times new roman">Đăng ký</div>
		<div class="content">

			<spring:form method="post" action="infor.html" modelAttribute = "acc">
				<div class="input-box">
						<span class="details" style="font-family:times new roman">Tên tài khoản</span> 
						<spring:input type="text" placeholder="Enter your username" maxlength= "50" path = "username" />
						<br><spring:errors class="errors" path="username"/>
					</div>
				<div class="input-box">
						<span class="details" style="font-family:times new roman">Mật khẩu</span> 
						<spring:input id="pass1" type="password"  placeholder="Enter your password" maxlength="50" path="password" />
						<br><spring:errors class="errors" path="password"/>
					</div>
				<div class="input-box">
						<span class="details" style="font-family:times new roman">Nhập lại mật khẩu</span> 
						<spring:input id="pass2" type="password"  placeholder="Enter your password again" maxlength="50" path="confirmPass"  />
						<br><spring:errors class="errors" path="confirmPass"/>
					</div>
					<div class="input-box">
						<span class="details" style="font-family:times new roman">Email</span> 
						<spring:input id="pass2" type="text"  placeholder="Enter your email" maxlength="50" path="email"  />
						<br><spring:errors class="errors" path="email"/>
					</div>
				   <div class="role-details">
<%--           <spring:radiobutton path="role" name="role" id="dot-1" value="Gia sư" required="required"/> --%>
<%--           <spring:radiobutton path="role" name="role" id="dot-2" value="Học viên"/> --%>
 
<!--           <span class="role-title" style="font-family:times new roman">Bạn là:</span> -->
<!--           <div class="category"> -->
<!--             <label for="dot-1"> -->
<!--             <span class="dot one"></span> -->
<!--             <span class="role" style="font-family:times new roman">Gia Sư</span> -->
<!--           </label> -->
<!--           <label for="dot-2"> -->
<!--             <span class="dot two"></span> -->
<!--             <span class="role" style="font-family:times new roman">Học viên</span> -->
<!--           </label> -->
        
<!--           </div> -->
        </div>
				<div class="button">
					<input style="font-family:times new roman" type="submit" id="formSubmit" value="Đăng ký">
				</div>
			</spring:form>
		</div>
	</div>

</body>
</html>
