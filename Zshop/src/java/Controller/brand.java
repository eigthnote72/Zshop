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

/**
 *
 * @author Eighth_Note
 */
public class brand extends HttpServlet {

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
        GetDataDAO db = new GetDataDAO();
        String CID = request.getParameter("cid");
        String CGID = request.getParameter("cgid");
        ArrayList<Product> listP = new ArrayList<>();
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        String CGName = "";
        String brandName = "";
        ArrayList<Category> listC = db.getBrand();
        
        for(int i =0;i<listC.size();i++){
            if(listC.get(i).getcID().equals(CID)){
                brandName = listC.get(i).getcName();
            }
        }
       
        
        
        if(CGID != null){
            listP = db.getProductByCategory_Group(CID, CGID);
            for(int i=0;i<listCG.size();i++){
                if(listCG.get(i).getCGID().equals(CGID)){
                    CGName = listCG.get(i).getCGName();
                }
            }
        }else{
            listP = db.getProductbyCategory(CID);
        }
        request.setAttribute("CGName", CGName);
        request.setAttribute("listCG", listCG);
        request.setAttribute("brandName", brandName);
        request.setAttribute("listC", listC);
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("../brand.jsp").forward(request, response);
        
        
        
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
