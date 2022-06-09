<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>sign up</title>
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="<c:url value="/resources/css/tempcss.css" />"
	rel="stylesheet">
	
     <base href="${pageContext.servletContext.contextPath}/">
   </head>
<body>
  <div class="container">
    <div class="title">Thông tin</div>
  <div class="content">
      <spring:form action="tutor/indexForTutor.html" method="post" modelAttribute="tutor" enctype="multipart/form-data">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Họ & Tên</span>
            <input type="text" placeholder="Nhập tên đầy đủ của bạn" required name="name"> <!-- dung requestParams -->
          </div>
          <div  class="input-box">
            <span class="details">Ngày sinh</span>
            <div></div>
           <select name="birthday"> <!-- dung requestParams -->
           		<c:forEach var="day" items="${day}">
           			<option value="${day.getKey()}">${day.getValue()}</option>
           		</c:forEach>
           		
           	
           </select>
        
           <select name="birthmonth">
           	<c:forEach var="month" items="${month}">
           			<option value="${month.getKey()}">${month.getValue()}</option>
           		</c:forEach>
           </select>
           
           <select name="birthyear">
           		<c:forEach var="year" items="${year}">
           			<option value="${year.getKey()}">${year.getValue()}</option>
           		</c:forEach>
           	
           </select>
          </div>
          <div class="input-box">
            <span class="details">Số CMND/ Thẻ CCCD</span>
            <spring:input path="identityNum" type="text" placeholder="Nhập số CMND/CCCD" required="required"/>
          </div>
          <div class="input-box">
            <span class="details">Địa chỉ</span>
            <spring:input path="address" type="text" placeholder="Nhập địa chỉ" required="required"/>
          </div>
          <div class="input-box">
            <span class="details">Chuyên ngành</span>
            <spring:input path="major" type="text" placeholder="Nhập chuyên ngành của bạn" required="required"/>
          </div>
          <div class="input-box">
            <span class="details">Mô tả/ giới thiệu bản thân</span>
            <spring:input path="description" type="text" placeholder="Mô tả & giới thiệu bản thân" required="required"/> 
          </div>
       
           <div class="input-box">
            <span class="details">Số điện thoại</span>
            <spring:input path="phone" type="text" placeholder="Nhập số điện thoại" required="required"/> 
          </div>
          <div class="input-box">
            <span class="details">Tên Trường đã học</span>
            <spring:input path="schoolName" type="text" placeholder="Nhập Tên Trường bạn đã học" required="required"/> 
          </div>
         <div class="input-box2">
            <span class="details" style="font-family: times new roman">Ảnh thẻ</span>
            <input name="photo" type="file" placeholder="Tải lên ảnh thẻ" required="required"/>
          </div>
            
        </div>
        <div class="gender-details">
          <input type="radio" value="Nam" name="gender" id="dot-1">
          <input type="radio" value="Nữ" name="gender" id="dot-2">
          <input type="radio" value ="Khác" name="gender" id="dot-3">
          <span class="gender-title" style="font-family: times new roman">Giới tính</span>
          <div class="category" style="font-family: times new roman">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender">Nam</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Nữ</span>
          </label>
          <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender">Khác</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Đăng ký">
        </div>
      </spring:form>
    </div>
	</div>

</body>
</html>

