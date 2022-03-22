/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
import Model.Category_Group;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eighth_Note
 */
public class insertCategoryGroup extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
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
        GetDataDAO db = new GetDataDAO();
        String cgid = request.getParameter("id");
        String name = request.getParameter("name");
        String categoryID = request.getParameter("category");
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        boolean checkIdExist = false;
        for (int i = 0; i < listCG.size(); i++) {
            if(listCG.get(i).getCGID().equalsIgnoreCase(cgid)){
                checkIdExist = true;
            }
        }
        
        Category_Group cg = new Category_Group();
        
        String messCG = "";
        if(checkIdExist){
            messCG= "Id đã tồn tại ! ";
        }else{
            cg.setCGID(cgid);
            cg.setCGName(name);
            cg.setCID(categoryID);
            db.insertCategory_Group(cg);
            messCG="Thêm Category_Group thành công !";
        }
        
        HttpSession session = request.getSession();
        request.getSession().setAttribute("messCG", messCG);
        response.sendRedirect("category_groupManager");
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
