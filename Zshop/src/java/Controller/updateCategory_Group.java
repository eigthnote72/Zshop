/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
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
public class updateCategory_Group extends HttpServlet {

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
        String cgid = request.getParameter("cgid");
        
        GetDataDAO db = new GetDataDAO();
        
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        Category_Group cg = new Category_Group();
        for (int i = 0; i < listCG.size(); i++) {
            if(listCG.get(i).getCGID().equals(cgid)){
                cg = listCG.get(i);
            }
        }
        ArrayList<Category> listC = db.getBrand();
        request.setAttribute("listC", listC);
        request.setAttribute("cg", cg);
        request.setAttribute("edit", "edit");
        request.setAttribute("listCG", listCG);
        
        request.getRequestDispatcher("category_groupManager.jsp").forward(request, response);
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
        String CGID = request.getParameter("idCIDG");
        String name = request.getParameter("nameCG");
        String CID = request.getParameter("category");
        
        ArrayList<Product> listP = db.getAllProduct();
        
        db.updateCategory_Group(CGID, name, CID);
        
        for (int i = 0; i < listP.size(); i++) {
            if(listP.get(i).getCategory_groupID().equals(CGID)){
                String newPName = name+" "+listP.get(i).getStorage();
                db.updateProduct(newPName, listP.get(i).getProductID());
            }
        }
        
        String messCG = "Update thành công ID : " +CGID;
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
