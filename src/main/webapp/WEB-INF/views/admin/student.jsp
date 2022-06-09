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
		<h1>Student</h1>
	</div>
	<!-- End Page Title -->
	 <a href = "/TutorRent2/QuanLy/User/insert.html"><button type="button"
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
								<th scope="col">FirstName</th>
								<th scope="col">LastName</th>
								<th scope="col">Birthday</th>
								<th scope="col">Sex</th>
								<th scope="col">Address</th>
								<th scope="col">Phone</th>
								<th scope="col">Description</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "u" items = "${list}">
								<tr>
									<th scope="row">${u.fName }</th>
									<td>${u.lName}</td>
									<td>${u.bdate}</td>
									<td>${u.sex}</td>
									<td>${u.address}</td>
									<td>${u.phone}</td>
									<td><span><a href = "/TutorRent2/QuanLy/User/${u.studentId}.html?info"> <i
											class="bi bi-info-circle-fill v-icon-modal"
											></i></a>
									</span></td>
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
<div class="modal fade" id="ProfileViewModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content border-0" style="width: 660px;">
			<div class="modal-header v-modal-header">
				<h5 class="modal-title v-modal-title">Thông tin</h5>
				<button type="button" class="btn shadow-none"
					data-bs-dismiss="modal" aria-label="Close"
					style="font-weight: 700;">
					<i class="bi bi-x v-icon-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<!-- profile -->
				<div id="modal-main" class="main">
					<section class="section profile">
						<div class="row">
							<div class="col-xl-12">
								<div class="card v-modal-de">
									<div class="card-body pt-3">
										<!-- Bordered Tabs -->
										<div class="tab-content pt-2">
											<div class="tab-pane fade show active profile-overview"
												id="profile-overview">
												<div class="row">
													<div class="col-lg-3 col-md-4 label v-label">Mô tả</div>
													<div class="col-lg-8 col-md-5">${st.description}</div>
												</div>
											</div>
										</div>
										<!-- End Bordered Tabs -->
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- end profile -->
			</div>
		</div>
	</div>
</div>

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
				 <form:form method="post" modelAttribute="student">
					<div class="row mb-3">
						<label for="machuyen"
							class="col-md-4 col-lg-3 col-form-label v-label">First
							Name</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="fName" type="text"
								class="form-control v-form-control" /><form:errors path="fName"/>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Last Name</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="lName" type="text"
								class="form-control v-form-control" /><form:errors path="lName"/>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Address</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="address" type="text"
								class="form-control v-form-control" /><form:errors path="address"/>
						</div>
					</div>

					 <div class="row mb-3">
						<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày Sinh</label>
						<div class="col-md-3">
							<input type="date" class="form-control v-form-control" name = "date"/>
						</div>
					</div> 

					<div class="row mb-3">
						<label for="Country"
							class="col-md-4 col-lg-3 col-form-label v-label">Phone</label>
						<div class="col-md-8 col-lg-9">
							<form:input path="phone" type="text"
								class="form-control v-form-control" id="Country" /><form:errors path="phone"/>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Gender</label>
						<div class="col-md-8 col-lg-9">
							 <form:select class="form-select v-form-control"
								aria-label=" select example" path = "sex">
								<form:option selected ="NULL" value = "NULL">none</form:option>
								<form:option value="Nam">Nam</form:option>
								<form:option value="Nữ">Nữ</form:option>
							</form:select>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-md-4 col-lg-3 col-form-label v-label">Description</label>
						<div class="col-md-8 col-lg-9">
							<input name="descrip" type="text"
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
	if($(".modal_flag").attr("idModal") === "modalShow"){
		$("#ProfileViewModal").modal("show");
	}else if($(".modal_flag").attr("idModal") === "modalCreate"){
		$("#verticalycentered").modal("show");
	}
})
</script>

<!-- Template Main JS File -->
<script src="<c:url value='/resources/javascript/main.js'/>"></script>
</body>
</html>