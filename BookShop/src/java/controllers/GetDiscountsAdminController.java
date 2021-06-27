/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import daos.DiscountDAO;
import daos.ProductDAO;
import entities.Discounts;
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
import views.DiscountsViewModel;
import views.ListDiscountViewModel;

/**
 *
 * @author haudq
 */
public class GetDiscountsAdminController extends HttpServlet {

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
            List<Discounts> list = new ArrayList<Discounts>();
            DiscountDAO discountDAO = new DiscountDAO();
            int pageIndex = Integer.parseInt(request.getParameter("pageIndex").trim());
            int maxSize = Integer.parseInt(request.getParameter("maxS").trim());
            int size = 0;
            list = discountDAO.findByDiscountAdmin(maxSize, pageIndex);
            size = discountDAO.countByDiscountAdmin();
            ListDiscountViewModel listDiscount = new ListDiscountViewModel(size);
            List<DiscountsViewModel> listP = new ArrayList<DiscountsViewModel>();
            for (Discounts item : list) {
                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                String date = format.format(item.getCreatedDate());
                DiscountsViewModel temp = new DiscountsViewModel();
                temp.setName(item.getName());
                temp.setCode(item.getCode());
                temp.setPercent(item.getDiscountPercent());
                temp.setCreatedDate(date);
                listP.add(temp);
            }
            listDiscount.setListDiscounts(listP);
            Gson gson = new Gson();
            out.print(gson.toJson(listDiscount));
        } catch (Exception e) {
            log("Error at GetDiscountsAdminController: " + e.getMessage());
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
