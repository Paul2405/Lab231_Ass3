/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import entities.Users;
import java.io.IOException;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.MyUtil;
import validations.AccountValidation;

/**
 *
 * @author haudq
 */
public class RegistrationController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "registration.jsp";
    private static final String LOGIN = "login.jsp";

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
        AccountValidation accountValidation = new AccountValidation();
        boolean valid = true;
        try {
            String username = request.getParameter("txtUsername");
            String fullname = request.getParameter("txtFullname");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            if (!confirm.equals(password)) {
                accountValidation.setConfirmPasswordError("Confirm password not equal");
                valid = false;
            }
            if (valid) {
                AccountDAO accountDAO = new AccountDAO();
                password = MyUtil.getHash(password, "SHA-512");
                Users user = new Users();
                user.setUsername(username);
                user.setPassword(password);
                user.setFullname(fullname);
                accountDAO.registry(user);
                request.setAttribute("INFOR", "Registration successfully. Login again to use my service");
                url = LOGIN;
            } else {
                url = INVALID;
                request.setAttribute("INVALID", accountValidation);
            }
        } catch (RollbackException ex) {
            if (ex.getMessage().indexOf("duplicate") > -1) {
                accountValidation.setUsernameError("Username is existing. Try another");
                valid = false;
                url = INVALID;
                request.setAttribute("INVALID", accountValidation);
            }
        } catch (Exception e) {
            log("Error at Registration: " + e.getMessage());
            url = ERROR;
            request.setAttribute("ERROR", e.getMessage());
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
