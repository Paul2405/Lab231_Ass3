/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import daos.ProductDAO;
import entities.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import views.ListProductViewModel;
import views.ProductsViewModel;

/**
 *
 * @author haudq
 */
public class GetProductsAdminController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter();) {
            List<Products> list = new ArrayList<Products>();
            ProductDAO productDAO = new ProductDAO();
            int pageIndex = Integer.parseInt(request.getParameter("pageIndex").trim());
            int maxSize = Integer.parseInt(request.getParameter("maxS").trim());
            String by = request.getParameter("by");
            String searchMessage = request.getParameter("content").trim();
            String status = request.getParameter("status").trim();
            String sort = request.getParameter("sort").trim();
            String category = request.getParameter("category").trim();
            int size = 0;
            if (status.equals("All") && category.equals("All")) {
                list = productDAO.findByProductNameAdmin(maxSize, pageIndex, sort, searchMessage);
                size = productDAO.countByProductNameAdmin(searchMessage);
            } else {
                if (!status.equals("All") && category.equals("All")) {
                    list = productDAO.findByStatusProductNameAdmin(maxSize, pageIndex, sort, searchMessage, status);
                    size = productDAO.countByStatusProductNameAdmin(searchMessage, status);
                } else {
                    if (status.equals("All") && !category.equals("All")) {
                        list = productDAO.findByCategoryProductNameAdmin(maxSize, pageIndex, sort, searchMessage, category);
                        size = productDAO.countByCategoryProductNameAdmin(searchMessage, category);
                    } else {
                        list = productDAO.findByCateStaProductNameAdmin(maxSize, pageIndex, sort, searchMessage, category, status);
                        size = productDAO.countByCateStaProductNameAdmin(searchMessage, category, status);
                    }
                }
            }
            ListProductViewModel listProduct = new ListProductViewModel(size);
            List<ProductsViewModel> listP = new ArrayList<ProductsViewModel>();
            for (Products item : list) {
                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                String date = format.format(item.getCreatedDate());
                ProductsViewModel temp = new ProductsViewModel();
                temp.setProductName(item.getProductName());
                temp.setCategory(item.getCategoryId().getCategoryName());
                temp.setCreateDate(date);
                temp.setPrice(item.getUniPrice());
                temp.setStatus(item.getStatus());
                temp.setQuantity(item.getQuantity());
                temp.setId(item.getId());
                temp.setAuthor(item.getAuthor() == null ? "" : item.getAuthor());
                listP.add(temp);
            }
            listProduct.setListProducts(listP);
            Gson gson = new Gson();
            out.print(gson.toJson(listProduct));
        } catch (Exception e) {
            log("Error at GetProductsAdminController: " + e.getMessage());
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
