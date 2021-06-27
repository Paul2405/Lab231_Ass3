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
        <title>List Discount</title>
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
<div class="row justify-content-md-center">
                            <div class="product-filter">
                                <div class="container">
                                    <div class="col-md-12">
                                        <div class="filter-content padding-horizontal-25">
                                            <span id="items_count">Showing of results</span>
                                            <ol>
                                                <li>
                                                    
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

                        <div class="row">
                            <div class="col-md-12">
                                <div class="blog-list">
                                    <div class="container padding-vertical-10 col-md-12 col-lg-12">
                                        <table border="1" class="table tab-content" id="table_id">
                                            <thead>
                                                <tr class="row">
                                                    <th>Discount Code
                                                    </th>
                                                    <th>Discount Name
                                                    </th>
                                                    <th>Percent
                                                    </th>
                                                    <th>Created Date
                                                    </th>
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
                '</tr>';
        var inputId = [];
        var listStatus = [];
        var size;
        var max = 20;
        var pageIndex = 1;
        var numPage = 0;
        var infor = '${requestScope.INFOR}';
        $(document).ready(function () {
            getDiscountList(pageIndex, max);

        });

        
        $("#order-by-date").change(function () {
            getDiscountList(pageIndex, max);
        });
       
        function getDiscountList(pageI, max) {
            var content = "";
            $.ajax({
                type: 'GET',
                url: "GetDiscountsAdminController",
                data: {pageIndex: pageI, maxS: max},
                headers: {
                    Accept: "application/json; charset=utf-8",
                    "Content-Type": "application/json; charset=utf-8"
                },
                success: function (data, textStatus, jqXHR) {
                    document.getElementById("content-here").innerHTML = "";
                    var listObj = JSON.parse(data);
                    $.each(listObj.listDiscounts, function (i, item) {
                        tbody_html = '<tr class="row">' +
                                '<td>' + item.name + '</td>' +
                                '<td> ' + item.code + ' </td>' +
                                '<td>' + item.percent + '</td>' +
                                '<td>' + item.createdDate + '</td>' +
                                '</tr>';
                        document.getElementById("content-here").innerHTML += tbody_html;
                    });
                    if (listObj.size == 0) {
                        document.getElementById("content-here").innerHTML = '<tr class="row"><td><h3>No discount found</h3></td> </tr>';
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
            getDiscountList(pageIndex, max);
        });
        $("#preIndex").click(function () {
            pageIndex--;
            getDiscountList(pageIndex, max);
        });
        $("#lastIndex").click(function () {
            pageIndex = numPage;
            getDiscountList(pageIndex, max);
        });
        $("#nextIndex").click(function () {
            pageIndex++;
            getDiscountList(pageIndex, max);
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
            getDiscountList(pageIndex, max);
        });
        $("#btn_actived").click(function () {
            changeStatus("Actived");
        });
        $("#btn_deleted").click(function () {
            var answer = window.confirm("Delete list selected products?");
            if (answer) {
                changeStatus("Deleted");
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
                        getDiscountList(pageIndex, max);
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
