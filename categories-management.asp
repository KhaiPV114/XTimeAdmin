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

  <!-- Side bar-->
    <!--#include file="navbar.asp"-->
  <!-- End Sidebar-->

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Quản lý Web</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Quản lý chuyên mục</li>
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

              <!-- Table with stripped rows -->
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th scope="col">Tên chuyên mục</th>
                    <th scope="col">Vị trí</th>
                    <th scope="col">Loại</th>
                    <th scope="col">Di chuyển</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                    <%
                        set rsCate = CreateObject("ADODB.recordset")
                        sql = "select * from Category order by categoryOrder"
                        rsCate.open sql, conn
                        Do Until rsCate.eof
                            cateName = rsCate("categoryName")
                            cateId = rsCate("categoryId")
                    %>
                    <tr>
                        <th scope="row"><%=cateName%></th>
                        <td>Haha</td>
                        <td>Designer</td>
                        <td><%=Now%></td>
                        <td class="w3-center">
                        <button type="button" onclick="editCate(this)" class="border-0 rounded bg-primary text-light btn" data-bs-toggle="modal" data-cate-id="<%=cateId%>" data-bs-target="#cateEdit"><i class="fa fa-pencil-square-o"></i>Sửa</button>
                        <button type="button" onclick="deleteCate(this)" class="border-0 rounded bg-danger text-light btn delete-cate-btn"  data-cate-id="<%=cateId%>" data-bs-toggle="modal" data-bs-target="#cateDelete"><i class="fa fa-trash-o fa-lg"></i> Xóa</button>
                        </td>
                    </tr>
                    <%
                        rsCate.movenext
                        Loop
                        rsCate.close
                    %>
                  
                </tbody>    
              </table>
              <!-- End Table with stripped rows -->

            </div>
          </div>
        </div><!-- End Left side columns -->
      </div>
    </section>

        <!-- Modal Cate edit-->
    <div class="modal fade" id="cateEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa chuyên mục</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form method="get" action="func_cateEdit.asp">
            <div class="row mb-3">
                  <input type="hidden" class="cateEditId" name="cateEditId" value="0">
                  <label for="inputCateName" class="col-sm-2 col-form-label">Chuyên mục:</label>
                  <div class="col-sm-10">
                    <input type="text" id="cateNameEdit" name="cateNameEdit" value class="form-control inputCateName">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputAfterCate" class="col-sm-2 col-form-label">Vị trí, sau:</label>
                  <div class="col-sm-10">
                    <select class="inputAfterCate" name="cateOrder">
                      <option value="" required>Chọn chuyên mục</option>
                        <%
                          set rsCate = CreateObject("ADODB.recordset")
                            sql = "select * from Category order by categoryOrder, updateDate"
                            rsCate.open sql, conn
                            Do Until rsCate.eof
                            cateName = rsCate("categoryName")
                            cateId = rsCate("categoryId")
                            cateOrder = rsCate("categoryOrder")
                        %>
                          <option value="<%=cateOrder%>"><%=cateName%></option>
                        <%
                          rsCate.movenext
                          Loop
                          rsCate.close
                        %>
                        <option value="1">At the beginning</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputLink" class="col-sm-2 col-form-label">Liên kết:</label>
                  <div class="col-sm-10">
                    <input type="text" name="cateEditBody" class="inputLink form-control">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">File Upload</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile">
                  </div>
                </div>
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
          </form>
        </div>
      </div>
    </div>

    <div class="modal fade" id="cateDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Xóa chuyên mục</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>Are you sure?<p>
          </div>
          <div class="modal-footer">

              <input type="submit" name="cateId" class="btn btn-secondary delete-cate-no" data-bs-dismiss="modal">
            <form method="get" action="func_cateDelete.asp">
              <button type="submit" name="cateId" value="0" class="btn btn-primary delete-cate-yes">Đồng ý</button>
            </form>
          </div>
        </div>
      </div>
    </div>


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
  <script src="/assets/js/function.js"></script>

  <!--JS-->
</body>

</html>