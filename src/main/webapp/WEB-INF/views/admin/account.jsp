<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="head.jsp"%>
</head>
<body>
<%@ include file="header.jsp"%>
<!-- End Header -->
<%@ include file="slidebar.jsp"%>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>Tài khoản</h1>
	</div>
	<!-- End Page Title -->
	 
	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card-body">
					<!-- Table with stripped rows -->
					<table class="table datatable table-striped table-bordered">
						<thead>
							<tr class="v-table-tr-color">
								<th scope="col">Tài Khoản</th>
								<th scope="col">Email</th>
								<th scope="col">UserId</th>
								<th scope="col">Username</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "u" items = "${list}">
								<tr>
									<th scope="row">${u.accId }</th>
									<td>${u.email}</td>
									<td>${u.userID}</td>
									<td>${u.username}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- End Table with stripped rows -->
				</div>
			</div>
		</div>
	</section>
</main>



<!-- End Vertically centered Modal-->
<!-- Vendor JS Files -->
<script src="<c:url value='/resources/assets/vendor/apexcharts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/chart.js/chart.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/echarts/echarts.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/quill/quill.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/simple-datatables/simple-datatables.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/tinymce/tinymce.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/php-email-form/validate.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
</body>
</html>