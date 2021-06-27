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
        <title>Review Payment</title>
        <link rel="icon" href="img/favicon.png" type="image/png" />

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
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="860031936830-22rbp8ftmj3rqab34emrev8om6c7nfup.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>

    </head>
    <body>
        <div class="container text-center padding-vertical-100">
            <h2 class="double-line"><span>Payment Cancel</span></h2>
            <div class="row justify-content-md-center"  >
                <h1>Please Review Before Paying</h1>
                <form action="SubmitCartUserController" method="post">
                    <table>
                        <tr>
                            <td colspan="2"><b>Transaction Details:</b></td>
                            <td>
                                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                                <input type="hidden" name="PayerID" value="${param.PayerID}" />
                            </td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td>${transaction.description}</td>
                        </tr>
                        <tr>
                            <td>Subtotal:</td>
                            <td>${transaction.amount.details.subtotal} USD</td>
                        </tr>
                        <tr>
                            <td>Shipping:</td>
                            <td>${transaction.amount.details.shipping} USD</td>
                        </tr>
                        <tr>
                            <td>Tax:</td>
                            <td>${transaction.amount.details.tax} USD</td>
                        </tr>
                        <tr>
                            <td>Total:</td>
                            <td>${transaction.amount.total} USD</td>
                        </tr>
                        <tr><td><br/></td></tr>
                        <tr>
                            <td colspan="2"><b>Payer Information:</b></td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td>${payer.firstName}</td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td>${payer.lastName}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>${payer.email}</td>
                        </tr>
                        <tr><td><br/></td></tr>
                        <tr>
                            <td colspan="2"><b>Shipping Address:</b></td>
                        </tr>
                        <tr>
                            <td>Recipient Name:</td>
                            <td>${shippingAddress.recipientName}</td>
                        </tr>
                        <tr>
                            <td>Line 1:</td>
                            <td>${shippingAddress.line1}</td>
                        </tr>
                        <tr>
                            <td>City:</td>
                            <td>${shippingAddress.city}</td>
                        </tr>
                        <tr>
                            <td>State:</td>
                            <td>${shippingAddress.state}</td>
                        </tr>
                        <tr>
                            <td>Country Code:</td>
                            <td>${shippingAddress.countryCode}</td>
                        </tr>
                        <tr>
                            <td>Postal Code:</td>
                            <td>${shippingAddress.postalCode}</td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="paypal" value="Pay Now" />
                            </td>
                        </tr>    
                    </table>
                </form>

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
        <script>
            function signOut() {
                var auth = gapi.auth2.getAuthInstance();
                auth.signOut().then(function () {
                    console.log('User signed out.');
                });
            }
        </script>
    </body>
</html>
