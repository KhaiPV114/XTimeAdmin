<%@  language="VBSCRIPT" codepage="65001" %>
<!--#include file="DBconnection.asp"-->

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Trang quản trị phần mềm XTime</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- Font awesome-->
    <script src="https://kit.fontawesome.com/d0374d505e.js" crossorigin="anonymous"></script>

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 09 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
    <!--#include file="header.asp"-->
    <!-- End Header -->

    <!-- ======= Sidebar ======= -->
        <!--#include file="navbar.asp"-->
    <!-- End Sidebar-->

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Quản lý Web</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Nhập tin tức mới</li>
        </ol>
      </nav>    
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <div class="card">
            <div class="card-body">
              <h5 class="card-title">Danh sách chuyên mục</h5>
                 <!-- General Form Elements -->
                <form id="add-form">
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Chuyên mục: </label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" name="cateId">
                      <option selected="">Chọn chuyên mục</option>
                        <%
                          set rsCate = CreateObject("ADODB.recordset")
                            sql = "select * from Category order by categoryOrder, updateDate"
                            rsCate.open sql, conn
                            Do Until rsCate.eof
                            cateName = rsCate("categoryName")
                            cateId = rsCate("categoryId")
                            cateOrder = rsCate("categoryOrder")
                        %>
                            <option value="<%=cateId%>"><%=cateName%></option>
                        <%
                          rsCate.movenext
                          Loop
                          rsCate.close
                        %>
                    </select>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Tiêu đề: </label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="articleName" placeholder="Tiêu đề">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputEmail" class="col-sm-2 col-form-label">Mô Tả: </label>
                  <div class="col-sm-10">
                    <div>
                        <!-- Quill Editor Default -->
                        <div class="quill-editor-default" name="articleDescription">
                        </div>
                        <!-- End Quill Editor Default -->
                    </div>  
                  </div>
                </div>
                <div class="row mb-3">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Nội dung: </label>
                    <div class="col-sm-10">
                      <div>
                          <!-- Quill Editor Full -->
                          <div class="quill-editor-full" name="articleBody" aria-placeholder="Nội dung">
                          </div>
                          <!-- End Quill Editor Full -->
                      </div>  
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputNumber" class="col-sm-2 col-form-label">Ảnh lớn: </label>
                    <div class="col-sm-10">
                      <input class="form-control" type="file" id="formFile" name="articleLargePic">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputNumber" class="col-sm-2 col-form-label">Ảnh nhỏ: </label>
                    <div class="col-sm-10">
                      <input class="form-control" type="file" id="formFile" name="articleSmallPic">
                    </div>
                </div>
                <div class="row mb-3 d-flex justify-content-center">
                  <div class="col-sm-10  d-flex justify-content-center">
                    <button onclick="addNews(event)" class="btn btn-primary">Submit Form</button>
                  </div>
                </div>

              </form>
                <!-- General Form Elements -->
            </div>
          </div>
        </div><!-- End Left side columns -->
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>s
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <!--JS-->
  <script src="assets/js/function.js"></script>
</body>

</html>