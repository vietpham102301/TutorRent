<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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
			<h1>POST</h1>
		</div>
		<!-- End Page Title -->
		<a href="/TutorRent2/QuanLy/Post/PostNotApply.html"><button
				type="button" class="btn add-new btn-outline-danger shadow-none">
				Bài đăng chưa được apply <i class="bi bi-plus-circle"></i>
			</button></a> <a href="/TutorRent2/QuanLy/Post/PostApply.html"><button type="button"
				class="btn add-new btn-outline-danger shadow-none">
				Bài đăng đã được apply <i class="bi bi-plus-circle"></i>
			</button></a>
		<div><a href = "/TutorRent2/QuanLy/Post/PostNotApply/insert.html"><button type="button"
		class="btn add-new btn-outline-danger shadow-none">Thêm mới
		 <i class="bi bi-plus-circle"></i></button></a></div>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card-body">
						<!-- Table with stripped rows -->
						<table class="table datatable table-striped table-bordered">
							<thead>
								<tr class="v-table-tr-color">
									<th scope="col">StudentName</th>
									<th scope="col">Birthday</th>
									<th scope="col">Address</th>
									<th scope="col">Phone</th>
									<th scope="col">SubjectName</th>
									<th scope="col">SubjectLevel</th>
									<th scope="col">NumofLesson</th>
									<th scope="col">Fee</th>
									<th scope="col">Description</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${list}">
									<tr>
										<th scope="row">${u.student.lName} ${u.student.fName }</th>
										<td>${u.student.bdate}</td>
										<td>${u.student.address}</td>
										<td>${u.student.phone}</td>
										<td>${u.subject.name}</td>
										<td>${u.subject.subjectLevel}</td>
										<td>${u.numOfLesson}</td>
										<td><f:setLocale value="vi_VN" /> <f:formatNumber
												value="${u.fee }" />vnđ</td>
										<td><span><a
												href="/TutorRent2/QuanLy/Post/PostNotApply/${u.postId}.html?info">
													<i class="bi bi-info-circle-fill v-icon-modal"></i>
												<a href = "/TutorRent2/QuanLy/Post/PostNotApply/${u.postId}.html?update"><i class="bi bi-pencil-square v-icon-modal"
											data-bs-toggle="modal" data-bs-target="#ProfileEditModal"></i></a>
											</a> </span></td>
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
	<div class="modal_flag" idModal="${idModal }"></div>
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
														<div class="col-lg-8 col-md-5">${post.description}</div>
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
	<!-- ProfileEditModal -->
	<div class="modal fade" id="ProfileEditModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered v-modal-add">
			<div class="modal-content border-0">
				<div class="modal-header v-modal-header">
					<h5 class="modal-title v-modal-title">Chỉnh sửa</h5>
					<button type="button" class="btn shadow-none"
						data-bs-dismiss="modal" aria-label="Close"
						style="font-weight: 700;">
						<i class="bi bi-x v-icon-close"></i>
					</button>
				</div>
				<div class="modal-body modal-add">
					<!-- Profile Edit Form -->
					<form method="post">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">FirstName</label>
							<div class="col-md-8 col-lg-9">
								<input name="fname" type="text"
									class="form-control v-form-control" readonly="true" value = "${post.student.fName }"/>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">LastName</label>
							<div class="col-md-8 col-lg-9">
								<input name="lname" type="text"
									class="form-control v-form-control" readonly="true"  value = "${post.student.lName }"/>
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày Sinh</label>
							<div class="col-md-3">
							<input type="date" class="form-control v-form-control" readonly="true" name = "date" value = "${post.student.bdate }"/>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Address</label>
							<div class="col-md-8 col-lg-9">
								<input name="address" type="text"
									class="form-control v-form-control" readonly="true" value = "${post.student.address }"/>
								
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Subject</label>
							<div class="col-md-8 col-lg-9">
								<input type="text"
									class="form-control v-form-control" readonly="true" value = "${post.subject.name} - ${post.subject.subjectLevel}"/>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">NumOfLession</label>
							<div class="col-md-8 col-lg-9">
								<input name="numlesson" type="text"
									class="form-control v-form-control" value = "${post.numOfLesson }"/>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Fee</label>
							<div class="col-md-8 col-lg-9">
								<input name="fee" type="money"
									class="form-control v-form-control" value = "${post.fee }"/>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Apply status</label>
							<div class="col-md-8 col-lg-9">
								<input name="applyStatus" type="text"
									class="form-control v-form-control" value = "${post.applystatus }"/>
							</div>
						</div>
						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0">Save
								Changes</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
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
					<form method = "post">
						<div class="row mb-3">
							<label for="machuyen"
								class="col-md-4 col-lg-3 col-form-label v-label">FirstName</label>
							<div class="col-md-8 col-lg-9">
								<input name="fname" type="text"
									class="form-control v-form-control" value = ""/>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">LastName</label>
							<div class="col-md-8 col-lg-9">
								<input name="lname" type="text"
									class="form-control v-form-control" value = ""/>
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputDate" class="col-md-3 col-form-label v-label">Ngày Sinh</label>
							<div class="col-md-3">
							<input type="date" class="form-control v-form-control" name = "date" value = ""/>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Address</label>
							<div class="col-md-8 col-lg-9">
								<input name="address" type="text"
									class="form-control v-form-control" value = ""/>
								
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Phone</label>
							<div class="col-md-8 col-lg-9">
								<input name="phone" type="text"
									class="form-control v-form-control" value = ""/>
								
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Subject</label>
							<div class="col-md-8 col-lg-9">
								<select class="form-select v-form-control"
									aria-label=" select example" name = "subject">
									<c:forEach var= "u" items="${Sub}">
										<option value="${u.subjectId}">${u.name} - ${u.subjectLevel}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">NumOfLession</label>
							<div class="col-md-8 col-lg-9">
								<input name="numlesson" type="text"
									class="form-control v-form-control" value = ""/>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Fee</label>
							<div class="col-md-8 col-lg-9">
								<input name="fee" type="money"
									class="form-control v-form-control" value = ""/>
							</div>
						</div>
						
							<div class="row mb-3">
							<label class="col-md-4 col-lg-3 col-form-label v-label">Description</label>
							<div class="col-md-8 col-lg-9">
								<input name="description" type="text"
									class="form-control v-form-control" value = ""/>
								
							</div>
						</div>

						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-main-color border-0 mt-3">Lưu</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Vertically centered Modal-->
	<!-- Vendor JS Files -->
	<script
		src="<c:url value='/resources/vendor/apexcharts/apexcharts.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/chart.js/chart.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/echarts/echarts.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/quill/quill.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/simple-datatables/simple-datatables.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/tinymce/tinymce.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/php-email-form/validate.js'/>"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log($(".modal_flag").attr("idModal"));
			if ($(".modal_flag").attr("idModal") === "modalCreate") {
				$("#verticalycentered").modal("show");
			} else if ($(".modal_flag").attr("idModal") === "modalShow") {
				$("#ProfileViewModal").modal("show");

			} else if ($(".modal_flag").attr("idModal") === "modalUpdate") {
				$("#ProfileEditModal").modal("show");
			}
		})
	</script>

	<!-- Template Main JS File -->
	<script src="<c:url value='/resources/javascript/main.js'/>"></script>
</body>
</html>