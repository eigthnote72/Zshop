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
public class insertAccount extends HttpServlet {

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
        response.sendRedirect("registerAccount.jsp");
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
        ArrayList<Account> listA = db.getListAccount();
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String rePass = request.getParameter("rePass");
        String position = "customer";
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        boolean check = false;
        if(!rePass.equals(pass)){
            String mess = "re-enter password invalid";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
        }else{
            for(int i=0;i<listA.size();i++){
                if(user.equals(listA.get(i).getUsername())){
                    check = true;
                }
            }
            
            if(check){
            String mess = "Account already exists";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
            }else{
                Account a = new Account();
                a.setUsername(user);
                a.setPassword(pass);
                a.setPosition(position);
                a.setEmail(email);
                a.setPhone(phone);
                a.setName(name);
                a.setAddress(address);
                db.insertAccount(a);
                HttpSession session = request.getSession();
                session.setAttribute("account", a);
                response.sendRedirect("setProfileAccount");

            }
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
