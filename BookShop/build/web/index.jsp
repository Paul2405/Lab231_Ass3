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
        <title>Index</title>
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
        <div id="back-top">
            <a href="#" class="scroll">
                <i class="arrow_carrot-up"></i>
            </a>
        </div>

        <div class="container text-center padding-vertical-50">
            <h2 class="double-line"><span>Books</span></h2>

            <div class="container padding-bottom-100">
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
                <div class="row">
                    <div class="col-md-12">


                        <div class="container padding-vertical-50">

                            <div class="row">
                                <!-- Siderbar -->
                                <div class="col-md-3 col-sm-4 sidebar">
                                    <div class="row justify-content-md-center">
                                        <input type="button" name="btn_search" id="btn_actived" value="Search" class="btn btn-search padding-vertical-10 margin-right-20"/>
                                    </div>
                                    <div class="sidebar-search padding-bottom-10">
                                        <h4>Book Search</h4>
                                        <!-- /button -->
                                        <input type="text" name="txtSearch" class="form-control" placeholder="Search products...">
                                        <!-- /product-search -->
                                    </div>
                                    <!-- /sidebar-search -->

                                    <div class="product-categories padding-vertical-5">
                                        <h4>Book Categories</h4>
                                        <div class="product-categories-list">
                                            <ul class="padding-top-20" id="list_category">

                                            </ul>
                                        </div>
                                        <!-- /product-categories-list-->
                                    </div>
                                    <!-- /product-categories-->

                                    <div class="filter-price">
                                        <h4>Filter By Price</h4>
                                        <div class="slider-range padding-bottom-20">
                                            <fieldset  class="price-range">
                                                <div class="price-slider"></div>
                                                <p>
                                                    <input type="number" min="0" value="0" name="min_price"/> -  
                                                    <input type="number" min="0" value="10000000" name="max_price" />
                                                </p>
                                            </fieldset>
                                            <!-- /filter-button-->
                                            <!-- /product-categories-->
                                        </div>
                                        <!-- /slider-range -->
                                    </div>
                                    <!-- /filter-price -->


                                    <!-- best-product -->


                                    <div class="best-product padding-vertical-5">
                                        <h4>Best buy by you</h4>
                                        <ul class="padding-top-10" id="list_best">



                                        </ul>
                                    </div>
                                    <!-- /best-product -->
                                </div>
                                <!-- /sidebar -->

                                <!-- Product Item List Begin -->

                                <div class="product-item-list col-md-9 col-sm-8 padding-top-20 text-center" id="list_product_item">

                                    <!-- /column -->

                                </div>
                                <!-- /product-item-list -->
                            </div>
                            <!-- /row -->
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
    >
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
    <script src="${pageContext.request.contextPath}/js/notify.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tbody_html = '<div class="col-md-6 col-sm-6"> <div class="product-item padding-bottom-60">' +
                '<div class="product-image">  ' +
                ' <img src="img/product_default.png" alt=""/>' +
                '<div class="product_overlay">   <div class="product-cart"> ' +
                '<a href="#">' +
                '<p>+ Add to card</p>' +
                '</a> ' +
                '<div class="product-icons">' +
                '<ul>' +
                '<li><a href="#" title="favourite"><i class="icon_heart_alt"></i></a>' +
                '</li>' +
                '<li class="icon-bg-color"><a href="#" title="compare"><i class="fa fa-sliders"></i></a>' +
                '</li>' +
                ' <li><a href="product-quick-view.html" class="product-quick-view" title="quickview"><i class="arrow_condense"></i></a>' +
                '</li>' +
                '</ul>' +
                '</div></div></div></div>' +
                '<div class="product-short-detail padding-top-20">' +
                '<div class="product-rate">' +
                '<i class="icon_star_alt"></i>' +
                '<i class="icon_star_alt"></i>' +
                '<i class="icon_star_alt"></i>' +
                '<i class="icon_star_alt"></i>' +
                '<i class="icon_star_alt not-rated"></i>' +
                '</div>' +
                '<div class="product-title">' +
                '<p><a href="#">Black Cotton Leggings</a></p>' +
                '</div>' +
                   '<div class="product-author">' +
                '<p><a href="#">Black Cotton Leggings</a></p>' +
                '</div>' +
                '<div class="product-price">' +
                '<p><i class="fa fa-gbp"></i>160.00</p>' +
                '<del><i class="fa fa-gbp"></i>130.00</del>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
        var inputId = [];
        var listStatus = [];
        var size;
        var max = 4;
        var pageIndex = 1;
        var numPage = 0;
        var checkGetCate = false;
        //    var infor = '${requestScope.INFOR}';
        $(document).ready(function () {
            var role = '${sessionScope.ROLE}';
            role += "";
            if (role == "User") {
               // getPreferenceProduct();
            } 
             getCategories();
            if (infor.length > 0)
                alert(infor);
            //getArticleList(pageIndex, max);
        });
        // constrain price input
        $('input[name=max_price]').on('input', function (e) {
            var minP = parseInt($('input[name=min_price]').val());
            var maxP = parseInt($('input[name=max_price]').val());
            if (maxP < minP) {
                alert("Please input max price > min price");
                $('input[name=max_price]').val(minP);
            }
        });
        $('input[name=min_price]').on('input', function (e) {
            var maxP = parseInt($('input[name=min_price]').val());
            var maxP = parseInt($('input[name=max_price]').val());
            if (maxP < maxP) {
                $('input[name=max_price]').val(minP);
            }
        });

        function getCategories() {
            var category_html = '<li><a href="#"></a><span>' +
                    '<input type="checkbox" name="cate_checkbox" value=""/>' +
                    '</span>' +
                    '</li>';
            document.getElementById("list_category").innerHTML = "";
            $.ajax({
                type: 'GET',
                url: "${pageContext.request.contextPath}/GetCategoryJsonController",
                data: {},
                headers: {
                    Accept: "application/json; charset=urf-8",
                    "Content-type": "application/json; charset=urf-8"
                },
                success: function (data, textStatus, jqXHR) {
                    var list = JSON.parse(data);
                    $.each(list, function (i, item) {
                        document.getElementById("list_category").innerHTML += '<li><a>' + item + '</a><span>' +
                                '<input type="checkbox" name="cate_checkbox" value="' + item + '" checked />' +
                                '</span>' +
                                '</li>';
                    });
                    getProductList(pageIndex, max);

                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }
        function getCategorySelected() {
            var input = "";
            $('input[name=cate_checkbox]:checked').each(function () {
                input += $(this).attr('value') + ";";
            });
            return input;
        }
        function getMinPrice() {
            return parseInt($('input[name=min_price]').val());
        }
        function getMaxPrice() {
            return parseInt($('input[name=max_price]').val());
        }
        function getSort() {
            return $("#order-by-date option:selected").text() == "Ascending" ? "asc" : "desc";
        }
        $('input[name=btn_search]').click(function () {
            pageIndex = 1;
            getProductList(pageIndex, max);
        });
        $("#order-by-date").change(function () {
            pageIndex = 1;
            getProductList(pageIndex, max);
        });
        function addToCart(id) {
            $.ajax({
                type: 'GET',
                url: "AddToCardUserController",
                data: {id: id},
                headers: {
                    Accept: "application/json; charset=utf-8",
                    "Content-Type": "application/json; charset=utf-8"
                },
                success: function (data, textStatus, jqXHR) {
                    var result = JSON.parse(data);
                    if (result == "successfully") {
                        $.notify("Add successfully", "info");
                    } else {
                        $.notify(result, "info");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Some thing wrong, try again");
                }
            });
        }
        function getProductList(pageIndex, max) {
            var content = "";
            content = $("input[name=txtSearch]").val().trim();
            var category = getCategorySelected();
            var minP = getMinPrice();
            var maxP = getMaxPrice();
            var sort = getSort();
            $.ajax({
                type: 'GET',
                url: "GetProductsController",
                data: {pageIndex: pageIndex, maxS: max, content: content, min: minP, max: maxP, category: category, sort: sort},
                headers: {
                    Accept: "application/json; charset=utf-8",
                    "Content-Type": "application/json; charset=utf-8"
                },
                success: function (data, textStatus, jqXHR) {
                    document.getElementById("list_product_item").innerHTML = "";
                    var listObj = JSON.parse(data);
                    $.each(listObj.listProducts, function (i, item) {
                        document.getElementById("list_product_item").innerHTML +=
                                '<div class="col-md-6 col-sm-6"> <div class="product-item padding-bottom-60">' +
                                '<div class="product-image">  ' +
                                '<img src="' + item.images + '" alt=""/>' +
                                '<div class="product_overlay">   <div class="product-cart"> ' +
                                '<c:if test="${sessionScope.ROLE eq 'User'}">' +
                                '<a onclick="addToCart(' + item.id + ')">' +
                                '<p>+ Add to card</p>' +
                                '</a> ' +
                                '</c:if>' +
                                '<div class="product-icons">' +
                                '<ul>' +
                                '<li><a href="#" title="favourite"><i class="icon_heart_alt"></i></a>' +
                                '</li>' +
                                '<li class="icon-bg-color"><a href="#" title="compare"><i class="fa fa-sliders"></i></a>' +
                                '</li>' +
                                ' <li><a  class="product-quick-view" title="quickview"><i class="arrow_condense"></i></a>' +
                                '</li>' +
                                '</ul>' +
                                '</div></div></div></div>' +
                                '<div class="product-short-detail padding-top-20">' +
                                '<div class="product-rate">' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt not-rated"></i>' +
                                '</div>' +
                                '<div class="product-title">' +
                                '<p><a href="ToProductDetailController?id=' + item.id + '"> ' + item.productName + '</a></p>' +
                                '</div>' +
                                 '<div class="product-author">' +
                                '<p><a href="ToProductDetailController?id=' + item.id + '"> ' + item.author + '</a></p>' +
                                '</div>' +
                                '<div class="product-price">' +
                                '<p><i class="fa fa-money"></i> ' + item.price + '</p>' +
                                '</div>' +
                                '<div class="product-price">' +
                                '<p><i class="fa fa-drupal"></i> ' + item.category + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                    });
                    if (listObj.size == 0) {
                        //     document.getElementById("list_product_item").innerHTML = '<tr class="row"><td><h3>No article found</h3></td> </tr>';
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
        function getPreferenceProduct() {
            $.ajax({
                type: 'GET',
                url: "GetPreferenceProductUserController",
                data: {},
                headers: {
                    Accept: "application/json; charset=utf-8",
                    "Content-Type": "application/json; charset=utf-8"
                },
                success: function (data, textStatus, jqXHR) {
                    document.getElementById("list_best").innerHTML = "";
                    var listPreference = JSON.parse(data);
                    $.each(listPreference.listProducts, function (i, item) {
                        document.getElementById("list_best").innerHTML +=
                                '<li>' +
                                '<a href="ToProductDetailController?id=' + item.id + '"><img src="' + item.images + '" alt="">' +
                                '</a>' +
                                '<div class="product-rate">' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt"></i>' +
                                '<i class="icon_star_alt not-rated"></i>' +
                                '</div>' +
                                '<div class="product-title">' +
                                '<p><a href="#">' + item.productName + '</a>' +
                                '</p>' +
                                '</div>' +
                                 '<div class="product-author">' +
                                '<p><a href="#">' + item.author + '</a>' +
                                '</p>' +
                                '</div>' +
                                '<div class="product-price">' +
                                '<p><i class="fa fa-gbp"></i>' + item.price + '</p>' +
                                '</div>' +
                                '</li>';
                    });
                    getCategories();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("try again");
                }
            });
        }
    </script>
</body>
</html>
