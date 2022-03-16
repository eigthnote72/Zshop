/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Eighth_Note
 */
public class ItemAddToCart {
    private int id;
    private Product p;
    private int quantity;
    private String price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public ItemAddToCart() {
    }

    public ItemAddToCart(int id, Product p, int quantity, String price) {
        this.id = id;
        this.p = p;
        this.quantity = quantity;
        this.price = price;
    }
     
    
}
