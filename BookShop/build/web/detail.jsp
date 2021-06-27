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
        <title>Book Detail</title>
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
            <div class="p-details bg-gray">
                <div class="container padding-top-100 padding-bottom-70">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product">
                                <div class="col-md-6">
                                    <div class="product-image">
                                        <div class="product-quickview-slider">
                                            <ul class="slides">
                                                <li data-thumb="/${requestScope.product.images}">
                                                    <img src="${requestScope.product.images}" alt="" />
                                                </li>
                                            </ul>
                                            <!-- /slides -->
                                        </div>
                                        <!-- /product-quickview-slider -->
                                    </div>
                                    <!-- /product-image -->
                                </div>
                                <!-- /column-->

                                <div class="col-md-6">
                                    <div class="product-details">
                                        <div class="product-title">
                                            <p><a href="#"><h2>${requestScope.product.productName}</h2></a>
                                            </p>
                                        </div>
                                        <!-- /product-title -->

                                        <div class="product-reviews">
                                            <ul class="product-rate padding-top-15">
                                                <li><i class="icon_star_alt"></i>
                                                    <i class="icon_star_alt"></i>
                                                    <i class="icon_star_alt"></i>
                                                    <i class="icon_star_alt"></i>
                                                    <i class="icon_star_alt not-rated"></i>
                                                </li>
                                                <li><span>10 review(s)</span>
                                                </li>
                                                <li><a href="#">Add your review</a>
                                                </li>
                                            </ul>
                                            <!-- /product-rate -->
                                        </div>
                                        <!-- /product-reviews -->

                                        <div class="product-small-detail padding-vertical-35">
                                            <p>${requestScope.product.description}</p>
                                        </div>
                                        <!-- /product-small-detail-->

                                        <div class="product-price padding-bottom-50">
                                            <p>Price: ${requestScope.product.uniPrice}</p>
                                        </div>
                                        <!-- /product-price -->

                                        <div class="product-list-actions padding-top-40 padding-bottom-25">


                                            <!-- /product-quantity -->


                                            <!-- /product-cart -->


                                            <!-- /social-share -->

                                            <div class="product-category-tag">
                                                <div class="p-categories">
                                                    <p>Categories:</p>
                                                    <ul>
                                                        <li><a href="#">${requestScope.product.categoryId.categoryName}</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-cart margin-left-30">
                                                <c:if test="${sessionScope.ROLE eq 'User'}">
                                                    <a onclick="addToCart(${requestScope.product.id})">
                                                        <p>Add to card</p>
                                                    </a> 
                                                </c:if>
                                                <div class="product-icons">
                                                    <ul>
                                                        <li><a href="#" title="favourite"><i class="icon_heart_alt"></i></a>
                                                        </li>
                                                        <li class="icon-bg-color"><a href="#" title="compare"><i class="fa fa-sliders"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!-- /product-icons -->
                                            </div>
                                            <!-- /product-category-tag -->
                                        </div>
                                        <!-- /product-list-actions -->
                                    </div>
                                    <!-- /product-details -->
                                </div>
                                <!-- /column -->
                            </div>
                            <!-- /product -->
                        </div>
                        <!-- /column -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <div class="related-products">
                <div class="container text-center padding-top-20 padding-bottom-100">
                    <h2 class="double-line"><span>Related Products</span></h2>
                    <div class="row padding-top-60" id="list_related_product">

                        <!-- /column -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
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
    <script src="${pageContext.request.contextPath}/js/notify.js" type="text/javascript"></script>

    <script type="text/javascript">
                                                        $(document).ready(function () {
                                                            getRelatedProduct('${requestScope.product.id}');
                                                        });
                                                        var comment_htmlz = '<div class="post-comment">' +
                                                                '<a href="#"><img src="http://placehold.it/86x79" alt="" />  </a>' +
                                                                '<div class="comment-body bd-bottom padding-bottom-30 text-left">' +
                                                                '<div class="comment-head">' +
                                                                '<p>Artical by <a href="#">Erentheme</a><span> August 02, 2016</span> </p>' +
                                                                ' </div>' +
                                                                '<div class="leave-reply pull-right">' +
                                                                '<a href="#"><i class="fa fa-share fa-flip-vertical"></i>Leave reply</a>' +
                                                                '</div>' +
                                                                '<p class="comment margin-top-15"></p>' +
                                                                '</div>' +
                                                                '</div>';
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

                                                        function getRelatedProduct(id) {
                                                            $.ajax({
                                                                type: 'GET',
                                                                url: "GetRelatedProductController",
                                                                data: {id: id},
                                                                headers: {
                                                                    Accept: "application/json; charset=utf-8",
                                                                    "Content-Type": "application/json; charset=utf-8"
                                                                },
                                                                success: function (data, textStatus, jqXHR) {
                                                                    document.getElementById("list_related_product").innerHTML = "";
                                                                    var listObj = JSON.parse(data);
                                                                    $.each(listObj.listProducts, function (i, item) {
                                                                        document.getElementById("list_related_product").innerHTML +=
                                                                                '<div class="col-md-2 col-sm-2"> <div class="product-item padding-bottom-60">' +
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
                                                                },
                                                            });
                                                        }
    </script>
</body>
</html>
