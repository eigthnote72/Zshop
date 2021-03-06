/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
import Model.Account;
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
public class insertProduct extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account listA = (Account) session.getAttribute("account");
        if (session.getAttribute("account") == null || !listA.getPosition().equals("admin")) {
            response.sendRedirect("home");
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
       

        GetDataDAO db = new GetDataDAO();
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        ArrayList<Product> listP = db.getAllProduct();
        String CGID = request.getParameter("cgid");
 
        String price = request.getParameter("price");
        String storage = request.getParameter("storage");
        String unit = request.getParameter("unit");
        String image = request.getParameter("image");
        Category_Group cg =  new Category_Group();
        // l???y ra t??n c???a category_Group
        for (int i = 0; i < listCG.size(); i++) {
            if(listCG.get(i).getCGID().equals(CGID)){
                cg = listCG.get(i);
            }
        }
        // idproduct
        String productID = cg.getCGID()+storage;
        //  name Product
        String productName = cg.getCGName() + " " + storage + unit ;
        // storage product
        String storageP = storage + unit;

        

        boolean idPExist = false;
        for (int i = 0; i < listP.size(); i++) {
            // check id c?? t???n t???i trong list product hay ko?
            if(productID.equals(listP.get(i).getProductID())){
                idPExist = true;
            }
        }
        
        String messP="";
        if(idPExist){
            messP = "ID ???? t???n t???i !";
        }else{
            Product p = new Product();
            p.setProductID(productID);
            p.setProductName(productName);
            p.setProductPrice(price);
            p.setStorage(storageP);
            p.setImage(image);
            p.setCategory_groupID(CGID);
            db.insertProduct(p);
            messP = "Th??m th??nh c??ng s???n ph???m c?? ID : " + productID;

        }
        
        HttpSession session = request.getSession();
        request.getSession().setAttribute("messP", messP);
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
