/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
import Model.Account;
import Model.Category;
import Model.Category_Group;
import Model.Product;
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
public class productManagement extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account listA = (Account) session.getAttribute("account");
        if (session.getAttribute("account") == null || !listA.getPosition().equals("admin")) {
            response.sendRedirect("home");
        } else {
            GetDataDAO s = new GetDataDAO();

            
            ArrayList<Product> listP = s.getAllProductDESC();
            // Phân trang
            int pageIndex;
            if (request.getParameter("page") == null) {
                pageIndex = 1;
            } else {
                pageIndex = Integer.parseInt(request.getParameter("page"));
            }

            
            

            int totalItem = listP.size();
            int totalItemInPage = 11;
            int totalPage = 0;
            if (totalItem % totalItemInPage == 0) {
                totalPage = totalItem / totalItemInPage;
            } else {
                totalPage = totalItem / totalItemInPage + 1;
            }

            int start = (pageIndex - 1) * totalItemInPage;
            int end = Math.min(pageIndex * totalItemInPage, totalItem);

            ArrayList<Product> listPByPage = new ArrayList<>();
            for (int i = start; i < end; i++) {
                listPByPage.add(listP.get(i));
            }
//            
            // alert
            
            String messP = "";
            String messPx = (String) request.getSession().getAttribute("messP");

            if (messPx != null) {

                
                    
                    messP = messPx;
                    session.removeAttribute("messP");
            }
//
            request.setAttribute("messP", messP);
            
            
            ArrayList<Category_Group> listCG = s.getAllCategory_Group();
            request.setAttribute("totalPage", totalPage);

            request.setAttribute("listCG", listCG);
            request.setAttribute("pageIndex", pageIndex);
            ArrayList<Category> listC = s.getBrand();
            request.setAttribute("listC", listC);
            request.setAttribute("listProducts", listPByPage);
            request.getRequestDispatcher("productManagement.jsp").forward(request, response);
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
