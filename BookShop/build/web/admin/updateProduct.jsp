<%-- 
    Document   : registration
    Created on : Jan 14, 2020, 12:56:42 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png" />

        <!-- CSS -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/media.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.transitions.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.bxslider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider-set.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container text-center padding-vertical-50">
            <h2 class="double-line"><span>Update book id: ${requestScope.product.id}</span></h2>
            <div class="row justify-content-md-center"  >
                <div class="col-md-6 col-sm-6" >
                    <div class="row justify-content-md-center padding-bottom-30">
                        <!--<input type="button" name="btn_actived" id="btn_actived" value="Active Selected" class="btn btn-dark padding-vertical-10 margin-right-20"/>-->
                        <input type="button" name="btn_deleted" id="btn_deleted" value="Delete Selected" class="btn btn-danger padding-vertical-10"/>
                    </div>
                    <form action="UpdateProductAdminController" method="POST"  class="contact-form padding-top-50 margin-bottom-15">
                        <input type="hidden" name="id" value="${requestScope.product.id}"/>
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group text-left">
                                    <label for="author">Creator: </label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <div class="fom-group text-left">
                                    <label id="author" > <h3 class="fontawesome-icon-list" style="font-weight: bold;">${requestScope.product.creator.fullname}</h3> </label>
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group text-left">
                                    <label for="category">Category</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group text-right">
                                    <select name="list_categories" id="p_show" class="form-control">

                                    </select>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-3 col-sm-3" hidden="true">
                                <div class="form-group text-left">
                                    <label for="status">Status</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-3 col-sm-3" hidden="true">
                                <div class="form-group text-right">
                                    <h3 class="padding-bottom-30" id="status_product">${requestScope.product.status}</h3>
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group text-left">
                                    <label for="product-name">Book name</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <div class="form-group text-right">
                                    <input type="text"  name="txtProductName" id="product-name" class="form-control" value="${requestScope.product.productName}" value="${param.txtProductName}" required />
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <font color="red">${requestScope.INVALID}<font>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group text-left">
                                    <label for="price">Price</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group text-right">
                                    <input type="number"  name="txtUnitPrice" id="price" class="form-control" min="0"  value="${requestScope.product.uniPrice}" required />
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group text-left">
                                    <label for="quantity">Quantity</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group text-right">
                                    <input type="number"  name="txtQuantity" id="quantity" class="form-control" min="0"  value="${requestScope.product.quantity}" required />
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group text-left">
                                    <label for="description">Description</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <div class="form-group text-right">
                                    <input type="text"  name="txtDescription" id="description" class="form-control" value="${requestScope.product.description}" />
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                                         <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group text-left">
                                    <label for="author">Author</label>
                                </div>
                                <!-- /form-group -->
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <div class="form-group text-right">
                                    <input type="text"  name="txtAuthor" id="author" class="form-control" value="${requestScope.product.author}" />
                                </div>
                                <!-- /form-group -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <label for="files" class="btn btn-info">Select Image</label>
                                <input type="file" id="files" name="image_prd" onchange="previewFile()" style="visibility:hidden;"><br>
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <img src="" height="200" id="image_product" alt="No image selected">
                                <input type="hidden"  name="txtImage" id="images" class="form-control" value="${requestScope.product.images}" />
                            </div>

                        </div>

                        <div class="row">
                            <input type="submit" name="action" value="Update Product" class="btn btn-login"/>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lib/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lib/moderniz.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery.bxslider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/jquery.flexslider-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/flexslider-init.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendors/smoothscroll.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery_01.js" type="text/javascript"></script>
        <script>
                                    $(document).ready(function () {
                                        getCategories();
                                        $("#image_product").attr("src", '${pageContext.request.contextPath}' + "/" + '${requestScope.product.images}');
                                    });
                                    function getCategories() {
                                        document.getElementById("p_show").innerHTML = "";
                                        $.ajax({
                                            type: 'GET',
                                            url: "${pageContext.request.contextPath}/ToAddProductAdminController",
                                            data: {},
                                            headers: {
                                                Accept: "application/json; charset=urf-8",
                                                "Content-type": "application/json; charset=urf-8"
                                            },
                                            success: function (data, textStatus, jqXHR) {
                                                var list = JSON.parse(data);
                                                $.each(list, function (i, item) {
                                                    if ('${requestScope.product.categoryId.categoryName}' == item) {
                                                        document.getElementById("p_show").innerHTML += "<option selected> " + item + "</option>";
                                                    } else {
                                                        document.getElementById("p_show").innerHTML += "<option> " + item + "</option>";
                                                    }
                                                });
                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {
                                            }
                                        });
                                    }
                                    function previewFile() {
                                        var preview = document.querySelector('#image_product');
                                        var file = document.querySelector('input[type=file]').files[0];
                                        var reader = new FileReader();
                                        reader.onloadend = function (e) {
                                            preview.src = reader.result;
                                        }
                                        if (file) {
                                            reader.readAsDataURL(file);
                                            uploadImage();
                                        } else {
                                            preview.src = "";
                                        }
                                    }
                                    function uploadImage() {
                                        var fd = new FormData();
                                        var file = $('input[name=image_prd]')[0].files[0];
                                        fd.append('file', file);
                                        $.ajax({
                                            type: 'POST',
                                            url: "UploadImageAdminController",
                                            data: fd,
                                            contentType: false,
                                            processData: false,
                                            success: function (data, textStatus, jqXHR) {
                                                $('#images').val(JSON.parse(data));
                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {

                                            }
                                        });
                                    }
                                    $("#btn_actived").click(function () {
                                        changeStatus("Actived");
                                    });
                                    $("#btn_deleted").click(function () {
                                        var answer = window.confirm("Delete product?");
                                        if (answer) {
                                            changeStatus("Inactive");
                                        }
                                    });
                                    function changeStatus(status) {
                                        var input = '${requestScope.product.id}';
                                        $.ajax({
                                            type: 'GET',
                                            url: "${pageContext.request.contextPath}/ChangeStatusAdminController",
                                            data: {input: input, status: status},
                                            headers: {
                                                Accept: "application/json; charset=utf-8",
                                                "Content-Type": "application/json; charset=utf-8"
                                            },
                                            success: function (data, textStatus, jqXHR) {
                                                var result = JSON.parse(data);
                                                if (result == "successful") {
                                                    document.getElementById("status_product").innerHTML = status;
                                                    window.location = "${pageContext.request.contextPath}/admin/listProducts.jsp";
                                                }
                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {
                                                alert("Some thing wrong, try again");
                                            }

                                        });
                                    }
        </script>
    </body>
</html>
