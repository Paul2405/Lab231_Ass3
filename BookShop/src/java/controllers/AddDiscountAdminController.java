/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.DiscountDAO;
import entities.Discounts;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author haudq
 */
public class AddDiscountAdminController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "admin/createDiscount.jsp";
    private static final String LIST_DISCOUNT = "admin/listDiscounts.jsp";

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
        try {
            HttpSession session = request.getSession();
            DiscountDAO discountDAO = new DiscountDAO();
            AccountDAO accountDAO = new AccountDAO();
            Users user = null;
            String disName = request.getParameter("txtName").trim();
            String disCode = request.getParameter("txtCode").trim();
            double percent = Double.parseDouble(request.getParameter("txtPercent").trim());
            String username = (String) session.getAttribute("USERNAME");
            if (username != null) {
                user = accountDAO.findByUsername(username);
            }
            // set discount
            Discounts discounts = new Discounts();
            discounts.setName(disName);
            discounts.setCode(disCode);
            discounts.setCreator(user);
            discounts.setDiscountPercent(percent);
            discountDAO.create(discounts);
            url = LIST_DISCOUNT;
        } catch (RollbackException ex) {
            if (ex.getMessage().indexOf("duplicate") > -1) {
                request.setAttribute("INVALID", "Discount code is existing, try another");
                url = INVALID;
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
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
