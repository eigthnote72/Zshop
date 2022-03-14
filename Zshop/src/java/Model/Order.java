/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;


/**
 *
 * @author Eighth_Note
 */
public class Order {
    private int id;
    private ArrayList<ItemAddToCart> item;
    private int customerID;
    private String name;
    private String phone;
    private String email;

    public Order() {
    }

    public Order(int id, ArrayList<ItemAddToCart> item, int customerID, String name, String phone, String email) {
        this.id = id;
        this.item = item;
        this.customerID = customerID;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public ArrayList<ItemAddToCart> getItem() {
        return item;
    }

    public void setItem(ArrayList<ItemAddToCart> item) {
        this.item = item;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
