/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import daos.DiscountDAO;
import daos.ProductCart;
import daos.ProductDAO;
import entities.Products;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import views.DiscountsViewModel;
import views.ProductsViewModel;

/**
 *
 * @author haudq
 */
public class GetDiscountInforUserController extends HttpServlet {
    private static final String ERROR = "error.jsp";

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
        try(PrintWriter out = response.getWriter();) {
            Gson gson = new Gson();
            HttpSession session = request.getSession();
            String role = (String)session.getAttribute("ROLE");
            String username = (String)session.getAttribute("USERNAME");
            if (role.equals("User")){
                String discountCode = request.getParameter("code").trim();
                ProductCart productCart = null;
                DiscountDAO discountDAO = new DiscountDAO();
                DiscountsViewModel discount = discountDAO.findByCode(discountCode);
                productCart = (ProductCart)session.getAttribute(username + "-CART");
                if (productCart == null){
                    productCart = new ProductCart();
                }
                if (discount != null){
                    productCart.setDiscount(discount);
                    session.setAttribute(username+"-CART",productCart);
                    out.print(gson.toJson("successfully"));
                }else{
                    productCart.setDiscount(discount);
                    session.setAttribute(username+"-CART",productCart);
                    out.print(gson.toJson("not-found"));
                }
            }else{
                out.print(gson.toJson("Access has not permission"));
            }
        } catch (Exception e) {
            log("Error at AddToCardUserController: " + e.getMessage());
            request.setAttribute("ERROR", e.getMessage());
            request.getRequestDispatcher(ERROR).forward(request, response);
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
