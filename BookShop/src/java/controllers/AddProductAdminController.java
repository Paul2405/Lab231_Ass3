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
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.StringTokenizer;
import javax.imageio.ImageIO;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.FileItem;

/**
 *
 * @author haudq
 */
//@MultipartConfig
public class AddProductAdminController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "admin/createProduct.jsp";
    private static final String UPDATE = "ToUpdateProductAdminController";
    private static final String LOGIN = "login.jsp";
    private static final String IMAGE_URL = "img/product_default.png";

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
            CategoryDAO categoryDAO = new CategoryDAO();
            AccountDAO accountDAO = new AccountDAO();
            ProductDAO productDAO = new ProductDAO();
            Users user = null;
            Categories cate = null;
            String catename = request.getParameter("list_categories");
            String productName = request.getParameter("txtProductName").trim();
            Double price = Double.parseDouble(request.getParameter("txtUnitPrice").trim());
            int quantiy = Integer.parseInt(request.getParameter("txtQuantity").trim());
            String description = request.getParameter("txtDescription").trim();
            String author = request.getParameter("txtAuthor").trim();
            String username = (String) session.getAttribute("USERNAME");
            if (username != null) {
                user = accountDAO.findByUsername(username);
                if (catename != null) {
                    cate = categoryDAO.getCategoryByCateName(catename);
                }
                Products products = new Products();
                products.setProductName(productName);
                products.setCategoryId(cate);
                products.setCreator(user);
                products.setUniPrice(price);
                products.setQuantity(quantiy);
                products.setDescription(description);
                products.setImages(IMAGE_URL);
                products.setAuthor(author);
                products = productDAO.create(products);
                url = UPDATE;
                url += "?productId=" + products.getId();
            } else {
                url = LOGIN;
            }
        } catch (RollbackException ex) {
            if (ex.getMessage().indexOf("duplicate") > -1) {
                request.setAttribute("INVALID", "Product name is existing, try another");
                url = INVALID;
            }
        } catch (Exception e) {
            log("Error at AddProductAdminController: " + e.getMessage());
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
