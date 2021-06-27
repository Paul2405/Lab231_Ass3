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
        <title>List Products</title>
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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="back-top">
            <a href="#" class="scroll">
                <i class="arrow_carrot-up"></i>
            </a>
        </div>
        <div class="container text-center padding-vertical-50">
            <h2 class="double-line"><span>Book list</span></h2>
            <div class="container padding-bottom-100">
                <div class="row">
                    <div class="col-md-12">


                        <div class="row justify-content-md-center padding-top-25">
                            <div class="sidebar-search padding-bottom-10">
                                <div class="row justify-content-md-center">
                                    <div class="col-md-6 form-group">
                                        <label for="txt_Search"> </label>
                                        <input type="text" name="txtProductSearch" id="txt_Search" class="form-control" placeholder="Search product...">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="p_show">Categories:</label>
                                        <select name="p_show" id="p_show" class="form-control">

                                        </select>
                                    </div>
                                    <div class="col-md-4 form-group" hidden="true">
                                        <label for="p_status">Status:</label>
                                        <select name="p_status" id="p_status" class="form-control" hidden="true">
                                            <!--<option>All</option>-->
                                            <option>Actived</option>
                                            <!--<option>Deleted</option>-->

                                        </select>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="btn_search"> </label>
                                        <input type="button" class=" btn btn-block" id="btn_search" name="search_by_ctn" value="Search"/>
                                    </div>
                                </div>
                                <!-- /product-search -->
                            </div>
                        </div>
                        <!--filter-->

                        <!-- /tab-content -->
                        <div class="row justify-content-md-center">
                            <div class="product-filter">
                                <div class="container">
                                    <div class="col-md-12">
                                        <div class="filter-content padding-horizontal-25">
                                            <span id="items_count">Showing of results</span>
                                            <ol>
                                                <li>
                                                    <div class="form-group">
                                                        <select id="order-by-date" class="form-control">
                                                            <option value=""  selected="true">Ascending</option>
                                                            <option value="" >Descending</option>
                                                        </select>
                                                        <!-- /form-control -->
                                                    </div>
                                                    <!-- /form-group -->
                                                </li>
                                            </ol>
                                        </div>
                                        <!-- /filter-content -->
                                    </div>


                                    <!-- /column -->
                                </div>
                                <!-- /container -->
                            </div>
                        </div>
<!--                        <div class="row justify-content-md-center">
                            <input type="button" name="btn_actived" id="btn_actived" value="Active Selected" class="btn btn-dark padding-vertical-10 margin-right-20"/>
                            <input type="button" name="btn_deleted" id="btn_deleted" value="Delete Selected" class="btn btn-danger padding-vertical-10"/>
                        </div>-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="blog-list">
                                    <div class="container padding-vertical-10 col-md-12 col-lg-12">
                                        <table border="1" class="table tab-content" id="table_id">
                                            <thead>
                                                <tr class="row">
                                                    <th>Book Name
                                                    </th>
                                                    <th>Unit Price
                                                    </th>
                                                    <th>Quantity
                                                    </th>
                                                    <th>Created Date
                                                    </th>
                                                    <th>Category
                                                    </th>
                                                    <th>Author
                                                    </th>
                                                    <th>Edit
                                                    </th>
<!--                                                    <th>Select
                                                    </th>-->
                                                </tr>
                                            </thead>
                                            <tbody id="content-here">

                                            </tbody>
                                        </table>


                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--product list-->


                        <div class="row justify-content-md-center">
                            <div class="col-md-2 col-sm-2" id="firstIndex">
                                <a class="btn btn-dark"><i class="fa fa-angle-double-left"></i></a>
                            </div>
                            <div class="col-md-2 col-sm-2" id="preIndex">
                                <a class="btn btn-dark"><i class="fa fa-angle-left"></i></a>
                            </div>
                            <div class="col-md-2 col-sm-2" id="nextIndex">
                                <a class="btn btn-dark"><i class="fa fa-angle-right"></i></a>
                            </div>
                            <div class="col-md-2 col-sm-2">
                                <a class="btn btn-dark" id="lastIndex"><i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /tabs -->
                </div>
                <!-- /column -->
            </div>
            <!-- /row -->
        </div>
        <!--search-->
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
    <script src="${pageContext.request.contextPath}/js/vendors/smoothscroll.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery_01.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tbody_html = '<tr class="row">' +
                '<td></td>' +
                '<td></td>' +
                '<td></td>' +
                '<td></td>' +
                '<td></td>' +
                '<td></td>' +
                '<td>' +
                '<a href = "" class = "btn btn-default">  </a>' +
                '</td>' +
                '<td>' +
                '<input type = "checkbox" name = "check_id" value = "" />' +
                '</td>' +
                '</tr>';
        var inputId = [];
        var listStatus = [];
        var size;
        var max = 20;
        var pageIndex = 1;
        var numPage = 0;
        var infor = '${requestScope.INFOR}';
        $(document).ready(function () {
            getCategories();
            getProductList(pageIndex, max);

        });

        function getCategories() {
            document.getElementById("p_show").innerHTML = "<option>All</option>";
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
                        document.getElementById("p_show").innerHTML += "<option> " + item + "</option>";
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }
        $("#order-by-date").change(function () {
            getProductList(pageIndex, max);
        });
        function getSort() {
            return $("#order-by-date option:selected").text() == "Ascending" ? "asc" : "desc";
        }
        function getProductList(pageI, max) {
            var content = "";
            content = $("input[name=txtProductSearch]").val().trim();
            var category = $("#p_show option:selected").text();
            var status = $("#p_status option:selected").text();
            var sort = getSort();
            $.ajax({
                type: 'GET',
                url: "GetProductsAdminController",
                data: {pageIndex: pageI, maxS: max, content: content, sort: sort, category: category, status: status},
                headers: {
                    Accept: "application/json; charset=utf-8",
                    "Content-Type": "application/json; charset=utf-8"
                },
                success: function (data, textStatus, jqXHR) {
                    document.getElementById("content-here").innerHTML = "";
                    var listObj = JSON.parse(data);
                    $.each(listObj.listProducts, function (i, item) {
                        tbody_html = '<tr class="row">' +
                                '<td>' + item.productName + '</td>' +
                                '<td> ' + item.price + ' </td>' +
                                '<td>' + item.quantity + '</td>' +
                                '<td>' + item.createDate + '</td>' +
                                '<td>' + item.category + '</td>' +
                                '<td>' + item.author + '</td>' +
                                '<td>' +
                                '<a href="${pageContext.request.contextPath}/ToUpdateProductAdminController?productId=' + item.id + '" class="btn btn-default">Edit</a>' +
                                '</td>' +
                                '</tr>';
                        document.getElementById("content-here").innerHTML += tbody_html;
                    });
                    if (listObj.size == 0) {
                        document.getElementById("content-here").innerHTML = '<tr class="row"><td><h3>No article found</h3></td> </tr>';
                    }
                    size = listObj.size;
                    numPage = Math.floor(size / max);
                    if ((size % max) > 0)
                        numPage++;
                    setPaging();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Some thing wrong, try again");

                }
            });
        }
        $("#firstIndex").click(function () {
            pageIndex = 1;
            getProductList(pageIndex, max);
        });
        $("#preIndex").click(function () {
            pageIndex--;
            getProductList(pageIndex, max);
        });
        $("#lastIndex").click(function () {
            pageIndex = numPage;
            getProductList(pageIndex, max);
        });
        $("#nextIndex").click(function () {
            pageIndex++;
            getProductList(pageIndex, max);
        });
        function setPaging() {
            document.getElementById("lastIndex").style.display = "block";
            document.getElementById("nextIndex").style.display = "block";
            document.getElementById("firstIndex").style.display = "block";
            document.getElementById("preIndex").style.display = "block";
            if (pageIndex === numPage) {
                document.getElementById("lastIndex").style.display = "none";
                document.getElementById("nextIndex").style.display = "none";
            }
            if (pageIndex === 1) {
                document.getElementById("firstIndex").style.display = "none";
                document.getElementById("preIndex").style.display = "none";
            }
            if ((pageIndex < numPage) && (pageIndex > 1))
            {
                document.getElementById("lastIndex").style.display = "block";
                document.getElementById("nextIndex").style.display = "block";
                document.getElementById("firstIndex").style.display = "block";
                document.getElementById("preIndex").style.display = "block";
            }
            if (numPage == 0) {
                document.getElementById("lastIndex").style.display = "none";
                document.getElementById("nextIndex").style.display = "none";
                document.getElementById("firstIndex").style.display = "none";
                document.getElementById("preIndex").style.display = "none";
            }
            var sizeInPage;
            if (pageIndex == numPage)
                sizeInPage = size;
            else
                sizeInPage = pageIndex * max;
            document.getElementById("items_count").innerHTML = "Showing " + ((pageIndex - 1) * max + 1) + " - " + sizeInPage + " of " + size + " result.";
        }
        $('input[name=search_by_ctn]').click(function () {
            pageIndex = 1;
            getProductList(pageIndex, max);
        });
        $("#btn_actived").click(function () {
            changeStatus("Actived");
        });
        $("#btn_deleted").click(function () {
            var answer = window.confirm("Delete list selected products?");
            if (answer) {
                changeStatus("Inactive");
            }
        });
        function changeStatus(status) {
            var input = getSelected();
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
                        pageIndex = 1;
                        getProductList(pageIndex, max);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Some thing wrong, try again");
                }

            });
        }
        function getSelected() {
            var input = "";
            $('input[name=check_id]:checked').each(function () {
                console.log($(this).attr('value'));
                input += $(this).attr('value') + ";";
            });
            return input;
        }
    </script>
</body>
</html>
