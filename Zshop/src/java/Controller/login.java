/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
import Model.Account;
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
public class login extends HttpServlet {

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

        
        
        String urlx ="";
        if(request.getParameter("urlB") != null){
            urlx =  request.getParameter("urlB");
        }
        if(request.getParameter("cgid") != null){
            String cgid = request.getParameter("cgid");
            urlx = urlx + "&cgid=" +cgid;
        } 
        if(request.getParameter("url") != null){
            urlx = request.getParameter("url");
        }
        
        if(request.getParameter("urlS") != null){
            urlx =request.getParameter("urlS");
        }
        
        if(session.getAttribute("account") != null){
            session.removeAttribute("account");
            response.sendRedirect(urlx);
        }else{
            response.sendRedirect("login.jsp");
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String remember = request.getParameter("checkbox");  // value = remeber
        
        GetDataDAO db = new GetDataDAO();
        Account account = new Account();
        ArrayList<Account> listA = db.getListAccount();
        boolean check = false;
        for(int i =0 ; i<listA.size();i++){
            if(listA.get(i).getUsername().equals(user) && listA.get(i).getPassword().equals(pass)){
                check = true;
                account = listA.get(i);
            }
        }
        
        if(check){
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            response.sendRedirect("home");
        }else{
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
