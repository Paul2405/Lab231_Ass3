/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import daos.OrderDetailDAO;
import dtos.HistoryDTO;
import entities.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author haudq
 */
public class GetHistoryUserController extends HttpServlet {

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
            List<OrderDetails> list = new ArrayList<OrderDetails>();
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("USERNAME");
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            int pageIndex = Integer.parseInt(request.getParameter("pageIndex").trim());
            int maxSize = Integer.parseInt(request.getParameter("maxS").trim());
            String searchMessage = request.getParameter("content").trim();
            String sort = request.getParameter("sort").trim();
            String dateString = request.getParameter("txtDate");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(dateString);
            Calendar cl = Calendar.getInstance();
            cl.setTime(date);
            cl.set(cl.get(Calendar.YEAR), cl.get(Calendar.MONTH), cl.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
            Date fromDate = cl.getTime();
            cl.add(Calendar.DATE, 1);
            cl.set(cl.get(Calendar.YEAR), cl.get(Calendar.MONTH), cl.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
            Date toDate = cl.getTime();
            int size = 0;
            list = orderDetailDAO.getHistory(maxSize, pageIndex, username, sort, searchMessage, toDate, fromDate);
            size = orderDetailDAO.countHistory(username, sort, searchMessage, toDate, fromDate);
            Gson gson = new Gson();
            HistoryDTO history = null;
            List<HistoryDTO> listHistory = new ArrayList<HistoryDTO>();
            for (OrderDetails item : list) {
                history = new HistoryDTO();
                SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy");
                String dateTemp = format2.format(item.getCreatedDate());
                history.setOrderId(item.getOrderId().getId() + "");
                history.setBuyDate(dateTemp);
                history.setProductName(item.getProductName());
                history.setQuantity(item.getQuantity());
                history.setSize(size);
                history.setCategory(item.getProductId().getCategoryId().getCategoryName());
                history.setStatus(item.getStatus());
                history.setTotalPrice(item.getTotalPrice());
                history.setUnitPrice(item.getUnitPrice());
                listHistory.add(history);
            }
            out.print(gson.toJson(listHistory));
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
