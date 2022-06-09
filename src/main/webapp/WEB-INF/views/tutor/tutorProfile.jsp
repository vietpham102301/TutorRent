<%@ page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my title</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<base href="${pageContext.servletContext.contextPath}/">
<link href="<c:url value="/resources/css/tutorProfileStyle.css" />" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="main">
	<div class="topbar">
		<a href="${pageContext.servletContext.contextPath}/tutor/login.html">Đăng xuất</a>
		<a href="#">Liên hệ</a>
		<a href="${pageContext.servletContext.contextPath}/tutor/indexForTutor.html">Trang chủ</a>
	</div>
	<div class="row">
		<div class="col-md-4 mt-1">
			<div class="card text-center sidebar" style="border-style: none;">
				<div class="card-body">
					<img src="<c:url value="//resources//image//${userPhotoName}" />" class="rounded-circle" width="150"/>
						<div class="mt-3" style="font-weight: bold">
							<h3>${fullName }</h3>
							
						</div>
				</div>
			</div>
		</div>
		<div class="col-md-8 mt-1">
			<div class= "car mb3 content">
				<h1 class= "m-3 pt-3">About</h1>
				<spring:form method="post" action="tutor/tutorProfile.html" modelAttribute="tutor" class="card-body">
					<div class="row">
						<div class="col-md-3" style="padding-top:10px">
							<h5>Họ và tên:</h5>
							
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px">
							<input name="fullName" value="${fullName}" type="text" placeholder="Họ và tên" style="height:40px; width: 400px"/>
						</div>
					</div>
					<hr>
					<div class= "row">
						<div class="col-md-3">
							<h5>Ngày sinh:</h5>
						</div>
						<div class="cod-md-9 text-secondary" style="padding-left:0px">
							   <select name="birthday" style="height:25px; width:60px"> <!-- dung requestParams -->
					           		<c:forEach var="day" items="${day}">
					           			
					           			<option value="${day.getKey()}" ${day.getKey() == bday ? "selected=":"" } >${day.getValue()}</option>
					           		</c:forEach>
           						</select>
           						<select name="birthmonth" style="height:25px; width:60px">
						           	<c:forEach var="month" items="${month}">
						           			<option value="${month.getKey()}" ${month.getKey() == bmonth ? "selected=":"" } >${month.getValue()}</option>
						           		</c:forEach>
           						</select>
           						
			           			<select name="birthyear" style="height:25px; width:60px">
					           		<c:forEach var="year" items="${year}">
					           			<option value="${year.getKey()}" ${year.getKey() == byear ? "selected=":"" } >${year.getValue()}</option>
					           		</c:forEach>
           	
           						</select>
           						<span style="padding-left:35px; font-color:black;">Giới tính:</span>
           						<select name="gender" style="height:25px; width:60px">
					           		
					           			<option value="Nam" ${currentTutor.getSex() == 'Nam' ? "selected":"" }>Nam</option>
					           			<option value="Nữ" ${currentTutor.getSex() == 'Nữ' ? "selected":"" }>Nữ</option>
					           			<option value="Khác" ${currentTutor.getSex() == 'Khác' ? "selected":"" }>Khác</option>
           						</select>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3" style="padding-top:0px">
							<h5>Số CMND/ CCCD:</h5>
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px">
							<spring:input path="identityNum" value="${currentTutor.getIdentityNum() }" type="text" style="height:40px; width: 400px" placeholder="CMND/ CCCD"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="padding-top:10px">
							<h5>Số điện thoại:</h5>
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px">
							<spring:input path="phone" value="${currentTutor.getPhone() }" type="text" style="height:40px; width: 400px" placeholder="Số điện thoại"/>
						</div>
					</div>
					<div class="row" style="padding-top:20px">
						<div class="col-md-3" style="padding-top:10px">
							<h5>Địa chỉ:</h5>
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px">
							<spring:input path="address" value="${currentTutor.getAddress() }" type="text" style="height:40px; width: 400px" placeholder="Địa chỉ"/>
						</div>
					</div>
						<div class="row" style="padding-top:20px">
						<div class="col-md-3" style="padding-top:10px">
							<h5>Tên trường học:</h5>
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px" >
							<spring:input path="schoolName" value="${currentTutor.getSchoolName() }" type="text" style="height:40px; width: 400px" placeholder="Tên trường đã học"/>
						</div>
					</div>
					<div class="row" style="padding-top:20px">
						<div class="col-md-3" style="padding-top:10px">
							<h5>Chuyên ngành:</h5>
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px" >
							<spring:input path="major" value = "${currentTutor.getMajor() }" type="text" style="height:40px; width: 400px" placeholder="Chuyên ngành"/>
						</div>
					</div>
					<div class="row" style="padding-top:20px">
						<div class="col-md-3" style="padding-top:10px">
							<h5>Mô tả:</h5>
						</div>
						<div class= "col-md-9 text-secondary" style="padding-left:0px" >
							<spring:input path="description" value = "${currentTutor.getDescription() }" type="text" style="height:40px; width: 400px" placeholder="Mô tả bản thân"/>
						</div>
					</div>
						<div class="card mb-3 content" style="border-style: none; padding-top:20px">
				
				<div class="card-body"  >
					<div class= "row" >
						<div >
							
							<button id="" style="height:50px; width:150px">Sửa thông tin</button>
						
						</div>
						
					</div>
				</div>
			</div>
				</spring:form>
			</div>
		
		</div>
		</div>
	
	</div>
	</div>
</body>
</html>