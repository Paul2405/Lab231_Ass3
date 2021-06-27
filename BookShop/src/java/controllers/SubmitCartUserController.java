/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
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
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import paypals.PaymentServices;
import views.DiscountsViewModel;
import views.ProductsViewModel;

/**
 *
 * @author haudq
 */
public class SubmitCartUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String HISTORY = "user/history.jsp";
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
        String url = ERROR;
        try (PrintWriter out = response.getWriter();) {
            Gson gson = new Gson();
            PayerInfo payerInfo = null;
            try {
                String paymentId = request.getParameter("paymentId");
                try {
                    PaymentServices paymentServices = new PaymentServices();
                    Payment payment = paymentServices.getPaymentDetails(paymentId);

                    payerInfo = payment.getPayer().getPayerInfo();

                } catch (Exception ex) {

                }finally{
                    
                }

                HttpSession session = request.getSession();
                String username = (String) session.getAttribute("USERNAME");
                AccountDAO accountDAO = new AccountDAO();
                Users users = accountDAO.findByUsername(username);
                ProductCart productCart = (ProductCart) session.getAttribute(username + "-CART");
                Map<Integer, ProductsViewModel> map = productCart.get().getProduct();
                ProductsViewModel productsViewModel = null;
                Products products = null;
                OrderDAO orderDAO = new OrderDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                Orders orders = null;
                OrderDetails orderDetails = null;
                boolean check = true;
                String outOfStock = "";
                ProductDAO productDAO = new ProductDAO();
                // check out of stock
                for (Map.Entry<Integer, ProductsViewModel> item : map.entrySet()) {
                    productsViewModel = item.getValue();
                    products = productDAO.findById(productsViewModel.getId());
                    if (products.getQuantity() < productsViewModel.getQuantity()) {
                        check = false;
                        productCart.update(productsViewModel.getId(), products.getQuantity());
                        outOfStock += products.getProductName() + "; ";
                    }
                }
                if (!check) {
                    session.setAttribute(username + "-CART", productCart);
                    out.print(gson.toJson("We see that product " + outOfStock + "has quantity > we have. Submit again if you want to buy"));
                    if (payerInfo != null) {
                        url = CART;
                        request.getRequestDispatcher(url).forward(request, response);
                    }
                } else {
                    orders = new Orders();
                    orders = orderDAO.create(orders);
                    Double finalPrice = 0d;
                    Double discountPercent = 0d;
                    // check discount
                    DiscountsViewModel discountViewModel = productCart.getDiscount();
                    if (discountViewModel != null) {
                        DiscountDAO discountDAO = new DiscountDAO();
                        Discounts discount = discountDAO.findDiscountByCode(discountViewModel.getCode());
                        if (discount != null) {
                            orders.setDiscountId(discount);
                            discountPercent = discount.getDiscountPercent();
                        }
                    }
                    orders.setUserId(users);
                    orders.setTotalPrice(Double.NaN);
                    Double total = 0d;
                    List<OrderDetails> listOrderDetails = new ArrayList<OrderDetails>();
                    if (orders.getId() != null) {
                        for (Map.Entry<Integer, ProductsViewModel> item : map.entrySet()) {
                            productsViewModel = item.getValue();
                            products = productDAO.findById(productsViewModel.getId());
                            orderDetails = new OrderDetails();
                            orderDetails.setProductId(products);
                            orderDetails.setOrderId(orders);
                            orderDetails.setQuantity(productsViewModel.getQuantity());
                            orderDetails.setProductName(products.getProductName());
                            orderDetails.setUnitPrice(products.getUniPrice());
                            orderDetails.setTotalPrice(orderDetails.getUnitPrice() * orderDetails.getQuantity());
                            if (payerInfo != null) {
                                orderDetails.setStatus("Paid");
                            }
                            listOrderDetails.add(orderDetails);
                            total += orderDetails.getTotalPrice();
                            products.setQuantity(products.getQuantity() - productsViewModel.getQuantity());
                            productDAO.update(products);
                        }
                        orderDetailDAO.createList(listOrderDetails);
                        orders.setTotalPrice(total);
                        finalPrice = total - total * discountPercent / 100;
                        orders.setFinalPrice(finalPrice);
                        session.removeAttribute(username + "-CART");
                        if (payerInfo != null) {
                            url = HISTORY;
                            orders.setStatus("Paid");
                            orderDAO.update(orders);
                            request.getRequestDispatcher(url).forward(request, response);
                        } else {
                            orderDAO.update(orders);
                        }
                        out.print(gson.toJson("successfully"));
                    }
                }
            } catch (RollbackException e) {
                out.print(gson.toJson("failed"));
            }
        } catch (Exception e) {
            log("Error at RemoveCartItemUserController: " + e.getMessage());
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
