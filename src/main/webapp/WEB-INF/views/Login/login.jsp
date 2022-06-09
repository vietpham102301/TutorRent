<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <title>Đăng nhập</title>
    <!--<link rel="stylesheet" href="/YourProjectName/XXX.css" type="text/css"-->
    <link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
 
  </head>
  <body>
    <div class="signup">
      <h1 class="signup-heading">Đăng nhập</h1>
      <button class="signup-social">
        <i class="fa fa-google signup-social-icon"></i>
        <span class="signup-social-text">Đăng nhập với tài khoản Google</span>
      </button>
      <div class="signup-or"><span>Or</span></div>
      <spring:form method="post" modelAttribute = "acc" action = "index.html" class="signup-form" autocomplete="off">
      
      <label for="fullname" class="signup-label">Tên tài khoản</label>
      		 <spring:input type="text" id="fullname" class="signup-input" placeholder="Eg: John Doe" path="username"/>
      		
<!--         <input type="text" id="fullname" class="signup-input" placeholder="Eg: Johndoe"> -->
        <label for="email" class="signup-label">Mật Khẩu</label>
         <spring:password id="email" class="signup-input" placeholder="Enter password" path= "password" />
<!--         <input type="email" id="email" class="signup-input" placeholder="Eg: johndoe@gmai.com"> -->
        <label class="signup-label-fail">${message}</label>
        <input class="signup-submit" type ="submit" value = "Đăng nhập"/>
      </spring:form>
<!--       <form action="#" > -->
        
<!--       </form> -->
      <p class="signup-already">
        <span>Bạn chưa có tài khoản?</span>
        <a href=${pageContext.request.contextPath}/tutor/signup.html class="signup-login-link">Đăng ký</a>
      </p>
    </div>
  </body>
</html>