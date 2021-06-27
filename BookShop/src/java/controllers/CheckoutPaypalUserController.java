/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import com.paypal.base.rest.PayPalRESTException;
import daos.AccountDAO;
import daos.DiscountDAO;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import daos.ProductCart;
import daos.ProductDAO;
import entities.Discounts;
import entities.OrderDetails;
import entities.Orders;
import entities.Products;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import paypals.OrderDetailPaypal;
import paypals.PaymentServices;
import views.DiscountsViewModel;
import views.ProductsViewModel;

/**
 *
 * @author haudq
 */
public class CheckoutPaypalUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "login.jsp";
        private static final String CART = "user/cart.jsp";


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
                Double finalPrice = 0d;
                Double discountPercent = 0d;
                HttpSession session = request.getSession();
                String username = (String) session.getAttribute("USERNAME");
                ProductCart productCart = (ProductCart) session.getAttribute(username + "-CART");
                Map<Integer, ProductsViewModel> map = productCart.get().getProduct();
                ProductsViewModel productsViewModel = null;
                Products products = null;
                OrderDetails orderDetails = null;
                ProductDAO productDAO = new ProductDAO();
                // check discount
                DiscountsViewModel discountViewModel = productCart.getDiscount();
                if (discountViewModel != null) {
                    DiscountDAO discountDAO = new DiscountDAO();
                    Discounts discount = discountDAO.findDiscountByCode(discountViewModel.getCode());
                    if (discount != null) {
                        discountPercent = discount.getDiscountPercent();
                    }
                }
                Double total = 0d;
                for (Map.Entry<Integer, ProductsViewModel> item : map.entrySet()) {
                    productsViewModel = item.getValue();
                    products = productDAO.findById(productsViewModel.getId());
                    orderDetails = new OrderDetails();
                    orderDetails.setProductId(products);
                    orderDetails.setQuantity(productsViewModel.getQuantity());
                    orderDetails.setProductName(products.getProductName());
                    orderDetails.setUnitPrice(products.getUniPrice());
                    orderDetails.setTotalPrice(orderDetails.getUnitPrice() * orderDetails.getQuantity());
                    total += orderDetails.getTotalPrice();
                }
                finalPrice = total - total * discountPercent / 100;
            String product = "product";
            String subtotal = "0";
            String shipping = "0";
            String tax = "0";
            String totalPay = finalPrice + "";
            OrderDetailPaypal orderDetail = new OrderDetailPaypal(product, subtotal, shipping, tax, totalPay);

            try {
                PaymentServices paymentServices = new PaymentServices();
                String approvalLink = paymentServices.authorizePayment(orderDetail);

                response.sendRedirect(approvalLink);

            } catch (PayPalRESTException ex) {
                request.setAttribute("errorMessage", ex.getMessage());
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
            log("Error at CheckoutPaypalUserController: " + e.getMessage());
            request.setAttribute("ERROR", e.getMessage());
            url = ERROR;
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
