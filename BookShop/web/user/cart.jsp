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
        <title>Shop Cart</title>
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
            <h2 class="double-line"><span>Cart</span></h2>
            <div class="row justify-content-md-center"  >
                <div class="cart-table">
                    <div class="container padding-vertical-100">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Product name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total Price</th>
                                            </tr>
                                        </thead>
                                        <!-- /thead -->

                                        <tbody id="content_here">


                                        </tbody>
                                        <!-- /tbody -->
                                    </table>
                                    <!-- /table -->
                                </div>
                                <!-- /table-responsive -->
                                <!-- /row -->
                            </div>
                            <div class="col-md-4 ">
                                <div class="shop_measures">
                                    <h4>cart totals</h4>
                                    <ul class="cart-total padding-top-50 margin-bottom-80">
                                        <li>Discount:<span class="product-price discount" id="discount-value"></span>
                                        </li>
                                        <li>Cart Totals:<span class="product-price total" id="total"></span>
                                        </li>
                                        <li>Cart Finals: <span class="product-price total" id="final"></span>
                                        </li>
                                    </ul>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group text-center">
                                            <label for="discount">Add discount</label>
                                        </div>
                                        <!-- /form-group -->
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group text-right">
                                            <input type="text" name="txtDiscount" id="discount" class="form-control" value="${param.txtDiscount}"/>
                                        </div>

                                        <!-- /form-group -->
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <a href="#" class="btn btn-info margin-right-20" onclick="addDiscount()">Add Discount</a>

                                        <!-- /form-group -->
                                    </div>
                                    <!-- /cart-total -->
                                    <div class="col-md-12 col-sm-12">
                                        <a href="#" class="btn btn-success " onclick="buyProducts()">Buy</a>
                                        <!-- /form-group -->
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <form action="CheckoutPaypalUserController">
                                            <input type="submit" value="Checkout Paypal" class="btn btn-primary"/>
                                        </form>
                                        <script
    src="https://www.paypal.com/sdk/js?client-id=ARdlXwobcucIVshy_a1rcifxm4JVsrzDWoUHnjdAUlTWA2lufUS_E8b5sD-I-Cc0i4FlZ03d6d6hNc2H"> // Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
  </script>
                                        <!-- /form-group -->
                                    </div>
                                </div>
                                <!-- /shop_measures -->
                            </div>
                            <!-- /column -->
                        </div>
                        <!-- /row -->

                        <!-- /row -->
                    </div>
                    <!-- /container -->
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
                                                                                         var html = '<tr>' +
                                                                                                 '<td class="product-name">' +
                                                                                                 '<p>Name product #01</p>' +
                                                                                                 '</td>' +
                                                                                                 ' <td class="product-price">' +
                                                                                                 '<h5>160.00</h5>' +
                                                                                                 '</td>' +
                                                                                                 '<td>' +
                                                                                                 '<input type="number" value=""/>' +
                                                                                                 ' </td>' +
                                                                                                 '<td class="product-price">' +
                                                                                                 '<h5>160.00</h5>' +
                                                                                                 '</td>' +
                                                                                                 '<td class="text-center" id="remove_btn"><a class="btn-close" href="" ><i class="fa fa-close"></i></a>' +
                                                                                                 '</td>' +
                                                                                                 '</tr>';
                                                                                         var total = 0;
                                                                                         $(document).ready(function () {
                                                                                                   //      alert(request.STOCK);
//                                                                                     
//        if (${request.STOCK} != null){
//                                                                                                 alert(request.STOCK);
//                                                                                             }
                                                                                             getCarts();
                                                                                         });
                                                                                         function buyProducts() {
                                                                                             $.ajax({
                                                                                                 type: 'GET',
                                                                                                 url: "SubmitCartUserController",
                                                                                                 data: {},
                                                                                                 headers: {
                                                                                                     Accept: "application/json; charset=utf-8",
                                                                                                     "Content-Type": "application/json; charset=utf-8"
                                                                                                 },
                                                                                                 success: function (data, textStatus, jqXHR) {
                                                                                                     var result = JSON.parse(data);
                                                                                                     if (result == "successfully") {
                                                                                                         alert("successfully");
                                                                                                         getCarts();
                                                                                                     } else if (result == "failed") {
                                                                                                         alert("try again");
                                                                                                     } else {
                                                                                                         getCarts();
                                                                                                         alert(result);
                                                                                                     }
                                                                                                 },
                                                                                                 error: function (jqXHR, textStatus, errorThrown) {
                                                                                                     alert("Some thing wrong, try again");
                                                                                                 }
                                                                                             });
                                                                                         }
                                                                                         function addDiscount() {
                                                                                             var code = $("#discount").val();
                                                                                             $.ajax({
                                                                                                 type: 'GET',
                                                                                                 url: "GetDiscountInforUserController",
                                                                                                 data: {code: code},
                                                                                                 headers: {
                                                                                                     Accept: "application/json; charset=utf-8",
                                                                                                     "Content-Type": "application/json; charset=utf-8"
                                                                                                 },
                                                                                                 success: function (data, textStatus, jqXHR) {
                                                                                                     var result = JSON.parse(data);
                                                                                                     if (result === "successfully") {
                                                                                                         getCarts();
                                                                                                     } else if (result === "not-found") {
                                                                                                         alert("Discount code not found");
                                                                                                         getCarts();
                                                                                                     } else {
                                                                                                         getCarts();
                                                                                                         alert(result);
                                                                                                     }
                                                                                                 },
                                                                                                 error: function (jqXHR, textStatus, errorThrown) {
                                                                                                     alert("Some thing wrong, try again");
                                                                                                 }
                                                                                             });
                                                                                         }
                                                                                         function remove(id) {
                                                                                             var answer = window.confirm("Do you want to delete this product?");
                                                                                             if (answer) {
                                                                                                 $.ajax({
                                                                                                     type: 'GET',
                                                                                                     url: "RemoveCartItemUserController",
                                                                                                     data: {id: id},
                                                                                                     headers: {
                                                                                                         Accept: "application/json; charset=utf-8",
                                                                                                         "Content-Type": "application/json; charset=utf-8"
                                                                                                     },
                                                                                                     success: function (data, textStatus, jqXHR) {
                                                                                                         var result = JSON.parse(data);
                                                                                                         if (result == "successfully") {
                                                                                                             getCarts();
                                                                                                         } else {
                                                                                                             alert("try again");
                                                                                                         }
                                                                                                     },
                                                                                                     error: function (jqXHR, textStatus, errorThrown) {
                                                                                                         alert("Some thing wrong, try again");
                                                                                                     }
                                                                                                 });
                                                                                             }
                                                                                         }
                                                                                         function change(id) {
                                                                                             var quantity = parseInt($('#' + id).val());
                                                                                             if (quantity <= 0) {
                                                                                                 alert("Quantity must be > 0");
                                                                                                 getCarts();
                                                                                             } else {
                                                                                                 $.ajax({
                                                                                                     type: 'GET',
                                                                                                     url: "UpdateCartItemUserController",
                                                                                                     data: {id: id, quantity: quantity},
                                                                                                     headers: {
                                                                                                         Accept: "application/json; charset=utf-8",
                                                                                                         "Content-Type": "application/json; charset=utf-8"
                                                                                                     },
                                                                                                     success: function (data, textStatus, jqXHR) {
                                                                                                         var result = JSON.parse(data);
                                                                                                         if (result == "successfully") {
                                                                                                             getCarts();
                                                                                                         } else {
                                                                                                             alert("try again");
                                                                                                         }
                                                                                                     },
                                                                                                     error: function (jqXHR, textStatus, errorThrown) {
                                                                                                         alert("Some thing wrong, try again");
                                                                                                     }
                                                                                                 });
                                                                                             }

                                                                                         }
                                                                                         function getCarts() {
                                                                                             $.ajax({
                                                                                                 type: 'GET',
                                                                                                 url: "ToCartUserController",
                                                                                                 data: {},
                                                                                                 headers: {
                                                                                                     Accept: "application/json; charset=utf-8",
                                                                                                     "Content-Type": "application/json; charset=utf-8"
                                                                                                 },
                                                                                                 success: function (data, textStatus, jqXHR) {
                                                                                                     total = 0;
                                                                                                     document.getElementById("content_here").innerHTML = "";
                                                                                                     var result = JSON.parse(data);
                                                                                                     var listObj = result.product;
                                                                                                     var discount = result.discount;
                                                                                                     Object.keys(listObj).map(function (key, index) {
                                                                                                         var id = listObj[key].id;
                                                                                                         var productName = listObj[key].productName;
                                                                                                         var price = parseFloat(listObj[key].price);
                                                                                                         var quantity = parseInt(listObj[key].quantity);
                                                                                                         var totalPrice = price * quantity;
                                                                                                         total += totalPrice;
                                                                                                         document.getElementById("content_here").innerHTML +=
                                                                                                                 '<tr>' +
                                                                                                                 '<td class="product-name">' +
                                                                                                                 '<p>' + productName + '</p>' +
                                                                                                                 '</td>' +
                                                                                                                 ' <td class="product-price">' +
                                                                                                                 '<h5>' + price + '</h5>' +
                                                                                                                 '</td>' +
                                                                                                                 '<td>' +
                                                                                                                 '<input type="number" min="0" id="' + id + '" value="' + quantity + '" onchange="change(' + id + ')"/>' +
                                                                                                                 ' </td>' +
                                                                                                                 '<td class="product-price">' +
                                                                                                                 '<h5>' + totalPrice + '</h5>' +
                                                                                                                 '</td>' +
                                                                                                                 '<td class="text-center"><a class="remove btn-close" href="" onclick="remove(' + id + ')"><i class="fa fa-close"></i></a>' +
                                                                                                                 '</td>' +
                                                                                                                 '</tr>';
                                                                                                     });
                                                                                                     $("#total").text(total);
                                                                                                     var discountValue = 0;
                                                                                                     if (typeof (discount) == "undefined") {
                                                                                                         discountValue = 0;
                                                                                                     } else {
                                                                                                         discountValue = discount.percent;
                                                                                                         $("#discount").val(discount.code);
                                                                                                     }
                                                                                                     $("#discount-value").text(discountValue + " %");
                                                                                                     $("#final").text(total - total * discountValue / 100);


                                                                                                 },
                                                                                                 error: function (jqXHR, textStatus, errorThrown) {
                                                                                                     alert("Some thing wrong, try again");
                                                                                                 }
                                                                                             });
                                                                                         }
        </script>
    </body>
</html>
