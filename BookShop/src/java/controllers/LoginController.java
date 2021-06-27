/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import daos.AccountDAO;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.MyUtil;
import validations.AccountValidation;

/**
 *
 * @author haudq
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "login.jsp";
    private static final String INDEX = "index.jsp";

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
        boolean checkValid = true;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            if (username.equals("")) {
                accountValidation.setUsernameError("Username can not be blank");
                checkValid = false;
            }
            if (password.equals("")) {
                accountValidation.setPasswordError("Password can not be blank");
                checkValid = false;
            }
            if (checkValid) {
                AccountDAO accountDAO = new AccountDAO();
                password = MyUtil.getHash(password, "SHA-512");
                Users user = accountDAO.login(username, password);
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USERNAME", user.getUsername());
                    session.setAttribute("ROLE", user.getRoles());
                    session.setAttribute("FULLNAME", user.getFullname());
                    request.setAttribute("INFOR", "Login successfuly");
                    url = INDEX;
                } else {
                    url = INVALID;
                    accountValidation.setUsernameError("Invalid account");
                    request.setAttribute("INVALID", accountValidation);
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", accountValidation);
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
            request.setAttribute("ERROR", "Some thing wrong, try again");
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
