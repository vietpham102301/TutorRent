<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Tutor Online Website</title>
    
    <!-- Bootstrap core CSS -->
<%--     <link href="<c:url value="/resources/css/productStyle.css" />" rel="stylesheet"> --%>
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    
<!--     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

    <!-- Additional CSS Files -->
    
    <link href="<c:url value="/resources/css/fontawesome.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/templatemo-grad-school.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/owl.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/lightbox.css" />" rel="stylesheet">
    
    <base href="${pageContext.servletContext.contextPath}/">
 
<!--
    
TemplateMo 557 Grad School

https://templatemo.com/tm-557-grad-school

-->
  </head>

<body>

   
  <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
      <a href="#Link trang chu"><em>Tutor</em> Website</a>
    </div>
    <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
    <nav id="menu" class="main-nav" role="navigation">
      <ul class="main-menu">
        <li><a href="#section1">Home</a></li>
        <li class="has-submenu"><a href="#section2">About Us</a>
          <ul class="sub-menu">
            <li><a href="#section2">Who we are?</a></li>
            <li><a href="#section3">What we do?</a></li>
            <li><a href="#section3">How it works?</a></li>
          </ul>
        </li>
        <li><a href="#section4">Courses</a></li>
        <!-- <li><a href="#section5">Video</a></li> -->
        <li><a href="#section6">Contact</a></li>
         <li><a href="${pageContext.servletContext.contextPath}/tutor/login.html">Login</a></li>
          <li><a href="${pageContext.servletContext.contextPath}/tutor/signup.html">Sign up</a></li>
      </ul>
    </nav>
  </header>

  <!-- ***** Main Banner Area Start ***** -->
  <section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
      		
          <source src="<c:url value="/resources//image/course-video.mp4" />" type="video/mp4" />
      </video>

      <div class="video-overlay header-text">
          <div class="caption">
              <h2><em>Gia Sư</em> Của Bạn <em>Lớp Học</em> Của Chúng Tôi</h2>
              <div class="main-button">
                  <div class="scroll-to-section"><a href="#link đăng nhập">Khám Phá Thêm</a></div>  
              </div>
          </div>
      </div>
  </section>
  <!-- ***** Main Banner Area End ***** -->


  <section class="features">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-12">
          <div class="features-post">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-pencil"></i>Tất CẢ KHÓA HỌC</h4>
              </div>
              <div class="content-hide">
                <p>Chúng tôi cung cấp đầy đủ các khóa học để bạn có thể thoải mái chọn lựa khóa học phù hợp với mình từ mọi cấp bậc tiểu học cho tới đại học. Nếu Bạn muốn tìm kiếm khóa học phù hợp với bản thân hay liên hệ cho chúng tôi </p>
                <!-- <p class="hidden-sm">Curabitur id eros vehicula, tincidunt libero eu, lobortis mi. In mollis eros a posuere imperdiet.</p> -->
                <div class="scroll-to-section"><a href="#section6">Contact</a></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-12">
          <div class="features-post second-features">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-graduation-cap"></i>Gia sư</h4>
              </div>
              <div class="content-hide">
                <p>Gia sư trên tutorwebsite được chọn lựa để lấy chất lượng, có khả năng đào tạo giỏi phù hợp với mọi đối tượng, trình độ học vấn cao. Liên hệ chúng tôi để giúp bạn lựa chọn gia sư phù hợp với bạn!!!!</p>
                <div class="scroll-to-section"><a href="#section6">Contact</a></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-12">
          <div class="features-post third-features">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-book"></i>Trực Tiếp/ Trực Tuyến</h4>
              </div>
              <div class="content-hide">
                <p>Gia sư giảng dạy hỗ trợ trên đa nền tảng trực tuyến hoặc trực tiếp.</p>
                <div class="scroll-to-section"><a href="#section6">Contact</a></div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section why-us" data-section="section2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Why choose Tutor Website?</h2>
          </div>
        </div>
        <div class="col-md-12">
          <div id='tabs'>
            <ul>
              <li><a href='#tabs-1'>Chất lượng giảng dạy</a></li>
              <li><a href='#tabs-2'>Chất lượng gia sư</a></li>
              <li><a href='#tabs-3'>Hỗ trợ học tập</a></li>
            </ul>
            <section class='tabs-content'>
              <article id='tabs-1'>
                <div class="row">
                  <div class="col-md-6">
                  <img src="<c:url value="/resources//image/choose-us-image-01.png" />" />
<!--                     <img src="assets/images/choose-us-image-01.png" alt=""> -->
                  </div>
                  <div class="col-md-6">
                    <h4>Chất lượng giảng dạy</h4>
                    <p>Cam kết chất lượng giảng dạy uy tín. Học viên được học lại không quá hai lần khi cảm thấy chưa hài lòng hay học viên chưa thực sự đạt đúng chuẩn chất lượng cam kết về chất lượng giảng dạy, gia sư </p>
                  </div>
                </div>
              </article>
              <article id='tabs-2'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="<c:url value="/resources//image/choose-us-image-02.png" />" />
                  </div>
                  <div class="col-md-6">
                    <h4>Chất lượng gia sư</h4>
                    <p>Được tuyển chọn từ hơn 40.000 gia sư từ các trường đại học hàng đầu Việt Nam, các gia sư còn trải qua quá trình đào tạo và kiểm tra nghiêm khắc</p> 
                    <p>Mỗi lớp gia sư sẽ có một giáo viên giỏi giám sát và đảm bảo chất lượng dạy và học. Giáo viên chuyên môn sẽ lên lộ trình, theo dõi và trao đổi cùng gia sư và phụ huynh. </p>
                  </div>
                </div>
              </article>
              <article id='tabs-3'>
                <div class="row">
                  <div class="col-md-6">
                   <img src="<c:url value="/resources//image/choose-us-image-03.png" />" />
                  </div>
                  <div class="col-md-6">
                    <h4>HỌC TẬP CÁ NHÂN HOÁ</h4>
                    <p>Không chỉ cá nhân hoá lộ trình học mà mỗi học sinh đều được xác định phong cách học riêng và giảng dạy theo phương pháp phù hợp nhất với phong cách đó.</p>
                    <p>Học sinh được học theo đúng phong cách của mình nên tiếp thu nhanh hơn, hứng thú hơn. Kho bài giảng được nghiên cứu giúp học dễ hiểu và hiệu quả hơn.</p>
                  </div>
                </div>
              </article>
            </section>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section coming-soon" data-section="section3">
    <div class="container">
      <div class="row">
        <div class="col-md-7 col-xs-12">
          <div class="continer centerIt">
            <div>
              <h4>Liên Hệ Với Chúng tôi Để Nhận Tư Vấn Tốt Nhất Cho Học Viên</h4>
              <div class="counter">

                <div class="days">
                  <div class="value">00</div>
                  <span>Days</span>
                </div>

                <div class="hours">
                  <div class="value">00</div>
                  <span>Hours</span>
                </div>

                <div class="minutes">
                  <div class="value">00</div>
                  <span>Minutes</span>
                </div>

                <div class="seconds">
                  <div class="value">00</div>
                  <span>Seconds</span>
                </div>

              </div>
            </div>
          </div>
        </div>
  </section>
  <section class="section courses" data-section="section4">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Hãy Lựa Chọn Gia Sư Và Khóa Học Của Bạn</h2>
          </div>
        </div>
        <!-- đoạn này ông cho hiện các thông tin gia sư ra -->
        <div class="owl-carousel owl-theme">
          <div class="item">
          <img src="<c:url value="/resources//image//courses-01.jpg" />" />
<!--             <img src="assets/images/courses-01.jpg" alt="Course #1"> -->
            <div class="down-content">
              <h4>Digital Marketing</h4>
              <p>You can get free images and videos for your websites by visiting Unsplash, Pixabay, and Pexels.</p>
              <div class="author-image">
              <img src="<c:url value="/resources//image//author-01.png" />" />
<!--                 <img src="assets/images/author-01.png" alt="Author 1"> -->
              </div>
              <!-- <div class="text-button-pay">
                <a href="#link mô tả của từng gia sư">description <i class="fa fa-angle-double-right"></i></a>
              </div> -->
            </div>
          </div>
          <!-- <div class="item">
            <img src="assets/images/courses-02.jpg" alt="Course #2">
            <div class="down-content">
              <h4>Business World</h4>
              <p>Quisque cursus augue ut velit dictum, quis volutpat enim blandit. Maecenas a lectus ac ipsum porta.</p>
              <div class="author-image">
                <img src="assets/images/author-02.png" alt="Author 2">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-03.jpg" alt="Course #3">
            <div class="down-content">
              <h4>Media Technology</h4>
              <p>Pellentesque ultricies diam magna, auctor cursus lectus pretium nec. Maecenas finibus lobortis enim.</p>
              <div class="author-image">
                <img src="assets/images/author-03.png" alt="Author 3">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-04.jpg" alt="Course #4">
            <div class="down-content">
              <h4>Communications</h4>
              <p>Download free images and videos for your websites by visiting Unsplash, Pixabay, and Pexels.</p>
              <div class="author-image">
                <img src="assets/images/author-04.png" alt="Author 4">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-05.jpg" alt="">
            <div class="down-content">
              <h4>Business Ethics</h4>
              <p>Pellentesque ultricies diam magna, auctor cursus lectus pretium nec. Maecenas finibus lobortis enim.</p>
              <div class="author-image">
                <img src="assets/images/author-05.png" alt="">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-01.jpg" alt="">
            <div class="down-content">
              <h4>Photography</h4>
              <p>Quisque cursus augue ut velit dictum, quis volutpat enim blandit. Maecenas a lectus ac ipsum porta.</p>
              <div class="author-image">
                <img src="assets/images/author-01.png" alt="">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-02.jpg" alt="">
            <div class="down-content">
              <h4>Web Development</h4>
              <p>Pellentesque ultricies diam magna, auctor cursus lectus pretium nec. Maecenas finibus lobortis enim.</p>
              <div class="author-image">
                <img src="assets/images/author-02.png" alt="">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-03.jpg" alt="">
            <div class="down-content">
              <h4>Learn HTML CSS</h4>
              <p>You can get free images and videos for your websites by visiting Unsplash, Pixabay, and Pexels.</p>
              <div class="author-image">
                <img src="assets/images/author-03.png" alt="">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-04.jpg" alt="">
            <div class="down-content">
              <h4>Social Media</h4>
              <p>Pellentesque ultricies diam magna, auctor cursus lectus pretium nec. Maecenas finibus lobortis enim.</p>
              <div class="author-image">
                <img src="assets/images/author-04.png" alt="">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-05.jpg" alt="">
            <div class="down-content">
              <h4>Digital Arts</h4>
              <p>Quisque cursus augue ut velit dictum, quis volutpat enim blandit. Maecenas a lectus ac ipsum porta.</p>
              <div class="author-image">
                <img src="assets/images/author-05.png" alt="">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="assets/images/courses-01.jpg" alt="">
            <div class="down-content">
              <h4>Media Streaming</h4>
              <p>Pellentesque ultricies diam magna, auctor cursus lectus pretium nec. Maecenas finibus lobortis enim.</p>
              <div class="author-image">
                <img src="assets/images/author-01.png" alt="">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
  </section>
  

  <!-- <section class="section video" data-section="section5">
    <div class="container">
      <div class="row">
        <div class="col-md-6 align-self-center">
          <div class="left-content">
            <span>our presentation is for you</span>
            <h4>Watch the video to learn more <em>about Grad School</em></h4>
            <p>You are NOT allowed to redistribute this template ZIP file on any template collection website. However, you can use this template to convert into a specific theme for any kind of CMS platform such as WordPress. You may <a rel="nofollow" href="https://templatemo.com/contact" target="_parent">contact TemplateMo</a> for details.
            <br><br>Suspendisse tincidunt, magna ut finibus rutrum, libero dolor euismod odio, nec interdum quam felis non ante.</p>
            <div class="main-button"><a rel="nofollow" href="https://fb.com/templatemo" target="_parent">External URL</a></div>
          </div>
        </div>
        <div class="col-md-6">
          <article class="video-item">
            <div class="video-caption">
              <h4>Power HTML Template</h4>
            </div>
            <figure>
              <a href="https://www.youtube.com/watch?v=r9LtOG6pNUw" class="play"><img src="assets/images/main-thumb.png"></a>
            </figure>
          </article>
        </div>
      </div>
    </div>
  </section> -->

  <footer id="page-footer" class="l-footer" itemscope itemtype="https://schema.org/WPFooter">
		<section class="l-section wpb_row height_large color_footer-top"><div class="l-section-h i-cf"><div class="g-cols vc_row type_default valign_top gap-10px"><style>.g-cols.gap-10px{margin:0 calc(-1.5rem - 10px)}.gap-10px > .vc_column_container {padding:10px}</style><div class="vc_col-sm-4 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="g-cols wpb_row  type_default valign_middle vc_inner"><div class="vc_col-sm-4 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="w-image align_none"><div class="w-image-h"><img width="150" height="150" src="https://ketnoigiasu.vn/wp-content/uploads/2021/04/logo2-150x150.png" class="attachment-thumbnail size-thumbnail" alt="" loading="lazy" srcset="https://ketnoigiasu.vn/wp-content/uploads/2021/04/logo2-150x150.png 150w, https://ketnoigiasu.vn/wp-content/uploads/2021/04/logo2-48x48.png 48w" sizes="(max-width: 150px) 100vw, 150px" /></div></div></div></div></div><div class="vc_col-sm-8 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="wpb_text_column us_custom_4af741be" ><div class="wpb_wrapper"><p><span style="color: #ffffff; font-size: 24px; font-weight: 600;">TRUNG TÂM</span><br />
<span style="color: #ffffff; font-size: 24px; font-weight: 600;">KẾT NỐI GIA SƯ</span></p>
</div></div></div></div></div><div class="vc_col-sm-4 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="w-iconbox iconpos_left style_default color_contrast align_left no_text"><div class="w-iconbox-icon" style="font-size:21px; margin-right:0.5rem;"><i class="material-icons">location_on</i></div><div class="w-iconbox-meta"><h4 class="w-iconbox-title" style="font-size:14px; font-weight:600;"></h4></div></div><div class="wpb_text_column" ><div class="wpb_wrapper"><p>Địa Chỉ: 97 Man Thiện, Thành Phố Thủ Đức</p>
</div><div class="vc_col-sm-2 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="w-iconbox iconpos_left style_default color_contrast align_left no_text"><div class="w-iconbox-icon" style="font-size:21px; margin-right:0.5rem;"><i class="material-icons">mail</i></div><div class="w-iconbox-meta"><h4 class="w-iconbox-title" style="font-size:14px; font-weight:600;">Email</h4></div></div><div class="wpb_text_column" ><div class="wpb_wrapper"><p><span style="color: #ffffff;">Email: info@tutorwebsite.vn</span></p>
</div><div class="vc_col-sm-2 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="w-iconbox iconpos_left style_default color_contrast align_left no_text"><div class="w-iconbox-icon" style="font-size:21px; margin-right:0.5rem;"><i class="material-icons">phone</i></div><div class="w-iconbox-meta"><h4 class="w-iconbox-title" style="font-size:14px; font-weight:600;">Hotline</h4></div></div><div class="wpb_text_column" ><div class="wpb_wrapper"><p><a style="color: #ffffff;" href="tel:0963672299">Hotline: 09.2333.4488</a></p>
</div></div></div><div class="vc_col-sm-6 wpb_column vc_column_container"><div class="vc_column-inner"><div class="wpb_wrapper"><div class="w-socials us_custom_a6ceb248 color_text shape_circle style_default hover_fade"><div class="w-socials-list" style="margin:-0.1em;"><div class="w-socials-item facebook" style="padding:0.1em;"><a class="w-socials-item-link" href="https://www.facebook.com/trungtamketnoigiasu" target="_blank" rel="noopener nofollow" title="Facebook" aria-label="Facebook"><span class="w-socials-item-link-hover"></span><i class="fab fa-facebook"></i></a><div class="w-socials-item-popup"><span>Facebook</span></div></div><div class="w-socials-item tiktok" style="padding:0.1em;"><a class="w-socials-item-link" href="https://www.tiktok.com/@ket_noi_gia_su" target="_blank" rel="noopener nofollow" title="TikTok" aria-label="TikTok"><span class="w-socials-item-link-hover"></span><i class="fab fa-tiktok"></i></a><div class="w-socials-item-popup"><span>TikTok</span></div></div></div></div></div></div></div></div></div></section>
	</footer>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  
  
<%--   <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script> --%>
  
<%--   <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script> --%>
  
<%--   <script src="<c:url value='/resources/javascript/isotope.min.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/javascript/lightbox.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/javascript/tabs.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/javascript/video.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/javascript/custom.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/javascript/owl-carousel.js'/>"></script> --%>
<%--   <script src="<c:url value='/resources/javascript/slick-slider.js'/>"></script> --%>
  	
<!--     <script src="vendor/jquery/jquery.min.js"></script> -->
<!--     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!--     <script src="assets/js/isotope.min.js"></script> -->
<!--     <script src="assets/js/owl-carousel.js"></script> -->
<!--     <script src="assets/js/lightbox.js"></script> -->
<!--     <script src="assets/js/tabs.js"></script> -->
<!--     <script src="assets/js/video.js"></script> -->
<!--     <script src="assets/js/slick-slider.js"></script> -->
<!--     <script src="assets/js/custom.js"></script> -->
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
          if($(e.target).hasClass('external')) {
            return;
          }
          e.preventDefault();
          $('#menu').removeClass('active');
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>
</html>