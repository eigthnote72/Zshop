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
public class updateProduct extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account listA = (Account) session.getAttribute("account");
        if (session.getAttribute("account") == null || !listA.getPosition().equals("admin")) {
            response.sendRedirect("home");
        } else {
            GetDataDAO db = new GetDataDAO();
            ArrayList<Category_Group> listCG = db.getAllCategory_Group();
            ArrayList<Category> listC = db.getBrand();
            String idInput = request.getParameter("pid");

            ArrayList<Product> listP = db.getAllProductDESC();
            ArrayList<Product> listPUpdate = db.getAllProductToUpdate();
            Product uP = new Product();
            for (int i = 0; i < listPUpdate.size(); i++) {
                if(listPUpdate.get(i).getProductID().equals(idInput)){
                    uP = listPUpdate.get(i);
                }
            }
            // phaan trang 
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

            
            request.setAttribute("uP", uP);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("listProducts", listPByPage);
            request.setAttribute("listCG", listCG);
            request.setAttribute("listC", listC);
            request.setAttribute("edit", "edit");
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

        HttpSession session = request.getSession();
        GetDataDAO db = new GetDataDAO();
        ArrayList<Product> listP = db.getAllProductToUpdate();
        String id = request.getParameter("pid");


        String price = request.getParameter("pprice");
        String image = request.getParameter("pimage");


        db.updateProduct(price, image, id);
       
        
        String messP = "Đã cập nhật thành công !";
        request.getSession().setAttribute("messP", messP);
        response.sendRedirect("productManagement");
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
