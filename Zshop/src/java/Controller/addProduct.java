/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
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
public class addProduct extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String id = request.getParameter("data");
        GetDataDAO db = new GetDataDAO();
        
        ArrayList<Product> listP = db.getProductByID(id);
        boolean check = false;
        for(int i = 0 ;i<listP.size();i++){
           if(listP.get(i).getProductID().equalsIgnoreCase(id)){
               check = true;
           }
        }
        if(id.equals("") || id == null){
            out.println();
        } else if(check){
            out.println("<li style=\"color:red\"> ProductID is exist </li>");
        }else{
            out.println("<li style=\"color:green\"> ProductID is availability </li>");
        }
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
        
        GetDataDAO db = new GetDataDAO();
        ArrayList<Category_Group> listCG = new ArrayList<>();
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String storage = request.getParameter("storage");
        String unit = request.getParameter("unit");
        String image = request.getParameter("image");
        String Cid = request.getParameter("category");
         
        String CGID =id.substring(0, id.length()- storage.length());
       
        
        
        
        boolean check = false;
        
        for (int i = 0; i < listCG.size(); i++) {
            if(listCG.get(i).getCGID().equalsIgnoreCase(CGID)){
                check = true;
            }
        }
        
        if(check){
            Category_Group cg = new Category_Group();
            cg.setCGID(CGID);
            cg.setCGName(name);
            cg.setCID(Cid);
            db.createCategory_Group(cg);
        }
        
        Product p = new Product();
        p.setProductID(id);
        String nameP = name + " " +storage + unit;
        p.setProductName(nameP);
        p.setProductPrice(price);
        String storageP = storage + unit;
        p.setStorage(storageP);
        p.setImage(image);
//        p.setCategory_groupID("SSS20P");
        db.createProduct(p);
        
        response.sendRedirect("/Zshop/productManagement");
        
        
        
        
        
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
