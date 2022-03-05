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
public class Product {
    private String productID;
    private String productName;
    private String productPrice;
    private String storage;
    private String category_groupID;

    public Product() {
    }

    public Product(String productID, String productName, String productPrice, String storage, String category_groupID) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.storage = storage;
        this.category_groupID = category_groupID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getCategory_groupID() {
        return category_groupID;
    }

    public void setCategory_groupID(String category_groupID) {
        this.category_groupID = category_groupID;
    }
    
    
}
