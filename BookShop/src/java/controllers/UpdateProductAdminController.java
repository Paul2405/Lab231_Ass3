/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.CategoryDAO;
import daos.ProductDAO;
import entities.Categories;
import entities.Products;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author haudq
 *
 */
public class UpdateProductAdminController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "admin/updateProduct.jsp";
    private static final String LIST_PRODUCT = "admin/listProducts.jsp";
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
        int id = Integer.parseInt(request.getParameter("id"));
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        Products products = null;
        try {
            Categories cate = null;
            String catename = request.getParameter("list_categories");
            String productName = request.getParameter("txtProductName").trim();
            Double price = Double.parseDouble(request.getParameter("txtUnitPrice").trim());
            int quantiy = Integer.parseInt(request.getParameter("txtQuantity").trim());
            String description = request.getParameter("txtDescription").trim();
            String author = request.getParameter("txtAuthor").trim();
            String images = request.getParameter("txtImage").trim();
            
            if (catename != null) {
                cate = categoryDAO.getCategoryByCateName(catename);
            }
            products = productDAO.findById(id);
            if (products != null) {
                products.setProductName(productName);
                products.setCategoryId(cate);
                products.setUniPrice(price);
                products.setQuantity(quantiy);
                products.setDescription(description);
                products.setAuthor(author);
                products.setRevisionDate(Calendar.getInstance().getTime());
                products.setImages(images);
                products = productDAO.update(products);
                url = LIST_PRODUCT;
            }
        } catch (RollbackException ex) {
            if (ex.getMessage().indexOf("duplicate") > -1) {
                request.setAttribute("INVALID", "Product name is existing, try another");
                request.setAttribute("product", products);
                url = INVALID;
            }
        } catch (Exception e) {
            log("Error at UpdateProductAdminController: " + e.getMessage());
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
