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
public class productDetail extends HttpServlet {

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
        GetDataDAO db = new GetDataDAO();
        
        
        String pid = request.getParameter("pid");
        Product p = db.getProductByID(pid);
        ArrayList<String> listImg =  db.getImageByCGID(p.getCategory_groupID());
        p.setProductPrice(cvString(p.getProductPrice()));
        ArrayList<Category> listC = db.getBrand();
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        
        request.setAttribute("listCG", listCG);
        request.setAttribute("account", account);
        request.setAttribute("listC", listC);
        request.setAttribute("listImg", listImg);
        request.setAttribute("p", p);
        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
        
        
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

    String cvString(String inputPrice) {
        int count = 0;
        int count1=0;
        String price = "";
        String temp = "";
        String a[] = inputPrice.split("");
        for (int i = inputPrice.length() - 1; i >= 0; i--) {
            count++;
            count1++;
            temp = temp + a[i];
            if (count == 3) {
                count = 0;
                price = price + temp + ".";
                temp = "";
            }
        }
        if (!temp.isEmpty()) {
            price = price + temp;
        }
        String result = "";
        for (int i = price.length() - 1; i >= 0; i--) {
            result = result + price.charAt(i);
        }
        if(count%3==0){
            result = result.substring(1);
        }
        return result;
    }
    
}
