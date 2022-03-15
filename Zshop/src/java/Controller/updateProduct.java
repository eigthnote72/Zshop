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
        Account listA = (Account)session.getAttribute("account");
        if(session.getAttribute("account") == null ||  !listA.getPosition().equals("admin")){
            response.sendRedirect("home");
        }else{
        GetDataDAO db = new GetDataDAO();
        String idInput = request.getParameter("pid");
        ArrayList<Category> listC = db.getBrand();
        ArrayList<Product> listP = db.getAllProductToUpdate();
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();

        Product pUpdate = new Product();
        for (int i = 0; i < listP.size(); i++) {
            if (idInput.equals(listP.get(i).getProductID())) {
                pUpdate = listP.get(i);
            }
        }

        String categoryID = "";
        for (int i = 0; i < listCG.size(); i++) {
            if (listCG.get(i).getCGID().equals(pUpdate.getCategory_groupID())) {
                categoryID = listCG.get(i).getCID();
            }
        }
        String name = pUpdate.getProductName().replace(pUpdate.getStorage(), "");

        pUpdate.setProductName(name);

        String unit = pUpdate.getStorage().replace(pUpdate.getProductID().replace(pUpdate.getCategory_groupID(), ""), "");

        request.setAttribute("idInput",idInput);
        request.setAttribute("categoryID", categoryID);
        request.setAttribute("unit", unit);
        request.setAttribute("listC", listC);
        request.setAttribute("pUpdate", pUpdate);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
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

        PrintWriter out = response.getWriter();
        GetDataDAO db = new GetDataDAO();
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        ArrayList<Product> listP = db.getAllProduct();
        String id = request.getParameter("id");

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String CId = request.getParameter("category");

        String CGID = "";
        for (int i = 0; i < listP.size(); i++) {
            if (listP.get(i).getProductID().equals(id)) {
                CGID = listP.get(i).getCategory_groupID();
            }
        }

        for (int i = 0; i < listCG.size(); i++) {
            if (listCG.get(i).getCGID().equals(CGID)) {
                if (!listCG.get(i).getCID().equals(CId)) {
                    db.updateCategory_Group(CGID, CId);
                }
            }
        }

        db.updateProduct(name, price, image, id);
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
