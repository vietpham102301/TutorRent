<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
  <%@ include file="slidebar.jsp" %>
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>POST MAIN</h1>
	<a href = "/TutorRent2/QuanLy/Post/PostNotApply.html"><button type="button"
		class="btn add-new btn-outline-danger shadow-none">Bài đăng chưa được apply
		 <i class="bi bi-plus-circle"></i></button></a>
	<a href = "/TutorRent2/QuanLy/Post/PostApply.html"><button type="button"
		class="btn add-new btn-outline-danger shadow-none">Bài đăng đã được apply
		 <i class="bi bi-plus-circle"></i></button></a>
  </main>
  <!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

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

  <!-- Template Main JS File -->
<script src="<c:url value='/resources/javascript/main.js'/>"></script>