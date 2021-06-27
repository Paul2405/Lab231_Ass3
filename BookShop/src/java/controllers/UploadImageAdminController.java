/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import utils.MyUtil;

/**
 *
 * @author haudq
 */
public class UploadImageAdminController extends HttpServlet {
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
       String url = ERROR;
       String imageFile ="";
        try (PrintWriter out = response.getWriter();) {
            Gson gson = new Gson();
            List<FileItem> items = (new ServletFileUpload(new DiskFileItemFactory())).parseRequest(new ServletRequestContext(request));
            for (FileItem item : items) {
                if (item.getFieldName().equals("file")){
                    String applicationPath = request.getServletContext().getRealPath("") + "/";

                    File directory = new File(applicationPath +  MyUtil.fileStored);
                    if (!directory.isDirectory()){
                        directory.mkdirs();
                    }
                    File file = new File(applicationPath + MyUtil.fileStored + item.getName());
                    item.write(file);
                    imageFile =  MyUtil.fileStored + item.getName();
                }
            }
            out.print(gson.toJson(imageFile));
        } catch (Exception e) {
            log("Error at ToAddProductAdminController: " + e.getMessage());
            request.setAttribute("ERROR", e.getMessage());
            url = ERROR;
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
