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
import Model.ItemAddToCart;
import Model.Order;
import Model.Product;
import java.util.ArrayList;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eighth_Note
 */
public class shoppingCart extends HttpServlet {

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

        // xử get account và list brand -->> Header
        GetDataDAO db = new GetDataDAO();
        ArrayList<Category> listC = db.getBrand();
        HttpSession session = request.getSession();
        ArrayList<Category_Group> listCG = db.getAllCategory_Group();
        Account account = (Account) session.getAttribute("account");
        // xử get account và list brand  (END)
        Order order = (Order) request.getSession().getAttribute("order");
        if (order == null) {
            String mess = (String) request.getSession().getAttribute("mess");
            String messx = "";
            if (mess != null) {

                if (mess.equals("done")) {
                    session.removeAttribute("mess");
                    messx = mess;
                }
            }
//
            request.setAttribute("mess", messx);
            request.setAttribute("account", account);
            request.setAttribute("listC", listC);
            request.setAttribute("listCG", listCG);
            request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
        } else {
            ArrayList<ItemAddToCart> listItem = order.getItem();
            System.out.println(listItem.size());

            BigInteger totalBI = new BigInteger("0");

            for (int i = 0; i < listItem.size(); i++) {
                BigInteger a = new BigInteger(String.valueOf(listItem.get(i).getQuantity()));
                BigInteger b = new BigInteger(listItem.get(i).getPrice());
                totalBI = totalBI.add(a.multiply(b));

            }

            String total = cvString(totalBI.toString());
            String messx = "";
            String mess = (String) request.getSession().getAttribute("mess");

            if (mess != null) {

                if (mess.equals("done")) {
                    session.removeAttribute("mess");
                    messx = mess;
                }
            }
//
            request.setAttribute("mess", messx);
            request.setAttribute("account", account);
            request.setAttribute("listC", listC);
            request.setAttribute("listCG", listCG);
            request.setAttribute("total", total);
            request.setAttribute("listItem", listItem);
            request.setAttribute("order", order);
            request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
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
        String button = request.getParameter("button");
        String idP = request.getParameter("idP");
        HttpSession session = request.getSession();
        Order order = (Order) request.getSession().getAttribute("order");
        Product p =db.getProductByID(idP);
        ArrayList<ItemAddToCart> listItem = order.getItem();
        if (button.equals("-")) {
            for (int i = 0; i < listItem.size(); i++) {
                if (listItem.get(i).getP().getProductID().equals(idP)) {
                    if (listItem.get(i).getQuantity() == 1) {
                        listItem.remove(i);
                    } else {
                        listItem.get(i).setQuantity(listItem.get(i).getQuantity() - 1);
                        String price = countPrice(p.getProductPrice(), listItem.get(i).getQuantity());
                        listItem.get(i).setPrice(price);
                    }
                }
            }
        } else if (button.equals("+")) {
            for (int i = 0; i < listItem.size(); i++) {
                if (listItem.get(i).getP().getProductID().equals(idP)) {
                    listItem.get(i).setQuantity(listItem.get(i).getQuantity() + 1);
                    String price = countPrice(p.getProductPrice(), listItem.get(i).getQuantity());
                    listItem.get(i).setPrice(price);
                }
            }
        } else if (button.equals("x")) {
            for (int i = 0; i < listItem.size(); i++) {
                if (listItem.get(i).getP().getProductID().equals(idP)) {
                    listItem.remove(i);
                }
            }
        }

        if (listItem.size() == 0) {
            session.removeAttribute("order");
        } else {
            session.setAttribute("order", order);
        }

        response.sendRedirect("shoppingCart");
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

    public String countPrice(String priceTotalItem, int quantity) {
        BigInteger temp1 = new BigInteger(String.valueOf(quantity));
        BigInteger temp2 = new BigInteger(priceTotalItem);
        BigInteger totalI = new BigInteger("0");
        
        totalI = temp1.multiply(temp2);
        String total = totalI.toString();
        return total;
    }

    public String cvString(String inputPrice) {
        int count = 0;
        int count1 = 0;
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
        if (count % 3 == 0) {
            result = result.substring(1);
        }
        return result;
    }

}
