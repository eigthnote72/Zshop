/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.GetDataDAO;
import Model.Account;
import Model.ItemAddToCart;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eighth_Note
 */
public class shoppingCartControl extends HttpServlet {

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
        int quantity = 1;
        String id = request.getParameter("idP");

        if (id != null) {
            Product p = db.getProductByID(id);
            Product pConvertString = db.getProductCVSTringByID(id);
            if (p != null) {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession(false);
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    ArrayList<ItemAddToCart> listItem = new ArrayList<>();
                    ItemAddToCart item = new ItemAddToCart();
                    item.setQuantity(quantity);
                    String price = p.getProductPrice();
                    p.setProductPrice(pConvertString.getProductPrice());
                    item.setP(p);
                    item.setPrice(price);
                    listItem.add(item);
                    order.setItem(listItem);
                    session.setAttribute("order", order);
                } else {
                    Order order = (Order) session.getAttribute("order");
                    ArrayList<ItemAddToCart> listItem = order.getItem();
                    boolean check = false;
                    for (ItemAddToCart item : listItem) {
                        if (item.getP().getProductID().equals(p.getProductID())) {
                            item.setQuantity(item.getQuantity() + quantity);
                            check = true;
                        }
                    }
                    if (check == false) {
                        ItemAddToCart item = new ItemAddToCart();
                        item.setQuantity(quantity);
                        String price = p.getProductPrice();
                        p.setProductPrice(pConvertString.getProductPrice());
                        item.setP(p);
                        item.setPrice(price);
                        listItem.add(item);
                    }
                    session.setAttribute("order", order);
                }
            }

        }
        response.sendRedirect("home");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Order order = (Order) session.getAttribute("order");
        String mess = "";
        if (order != null) {
            if (account != null) {
                order.setAddress(account.getAddress());
                order.setName(account.getName());
                order.setUsername(account.getUsername());
                order.setEmail(account.getEmail());
                order.setPhone(account.getPhone());
                db.insertCustomerLogin(order);
            } else {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                order.setName(name);
                order.setEmail(email);
                order.setPhone(phone);
                order.setAddress(address);
                db.insertCustomerNotLogin(order);
            }

            int customerID = db.getCustomerID();
            db.insertOrder(customerID);
            int orderID = db.getOrderID();
            ArrayList<ItemAddToCart> listItem = order.getItem();
            for (int i = 0; i < listItem.size(); i++) {
                ItemAddToCart item = listItem.get(i);
                db.insertOrderDetail(item, orderID);
            }

            // viết thêm hàm để lưu data order vào database (thiếu code)
            session.removeAttribute("order");

            mess = "done";

        } else {
            mess = "failed";
        }

        request.getSession().setAttribute("mess", mess);

        response.sendRedirect("shoppingCart");
//        request.getRequestDispatcher("shoppingCart").forward(request, response);

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
