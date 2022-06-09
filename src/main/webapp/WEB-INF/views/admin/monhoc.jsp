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
		<h1>Subject</h1>
	</div>
	<!-- End Page Title -->
	 <a href = "/TutorRent2/QuanLy/MonHoc/insert.html"><button type="button"
		class="btn add-new btn-outline-danger shadow-none">Thêm mới
		 <i class="bi bi-plus-circle"></i></button></a>
	 
	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card-body">
					<!-- Table with stripped rows -->
					<table class="table datatable table-striped table-bordered">
						<thead>
							<tr class="v-table-tr-color">
								<th scope="col">SubjectId</th>
								<th scope="col">SubjectName</th>
								<th scope="col">SubjectLevel</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "u" items = "${list}">
								<tr>
									<th scope="row">${u.subjectId }</th>
									<td>${u.name}</td>
									<td>${u.subjectLevel}</td>
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
<!-- End #main -->
<!-- ProfileViewModal -->
<div class = "modal_flag" idModal = "${idModal }"></div>

<!-- add model -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered v-modal-add">
		<div class="modal-content border-0">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Thêm</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close"
					style="font-weight: 700;">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body modal-add">
				<!-- Profile Edit Form -->
				 <form:form method="post" modelAttribute="sub">
					<div class="row mb-3">
						<label for="machuyen"
							class="col-md-4 col-lg-3 col-form-label v-label">Subject Name</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="name" type="text"
								class="form-control v-form-control"/>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Subject Level</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="subjectLevel" type="text"
								class="form-control v-form-control" />
						</div>
					</div>
					<button type="submit"
							class="btn  btn-primary btn-main-color border-0">
							Lưu</button>
				</form:form>
				
			
				<!-- End Profile Edit Form -->
			</div>
		</div>
	</div>
</div>

<!-- End Vertically centered Modal-->
<!-- Vendor JS Files -->
<script src="<c:url value='/resources/vendor/apexcharts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/chart.js/chart.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/echarts/echarts.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/quill/quill.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/simple-datatables/simple-datatables.js'/>"></script>
<script src="<c:url value='/resources/vendor/tinymce/tinymce.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/php-email-form/validate.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function () {
console.log($(".modal_flag").attr("idModal"));
	if($(".modal_flag").attr("idModal") === "modalCreate"){
		$("#verticalycentered").modal("show");
	}
})
</script>

<!-- Template Main JS File -->
<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
</body>
</html>